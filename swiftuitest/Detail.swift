//
//  Detail.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/11/07.
//

import SwiftUI
import Amplify
import AWSPluginsCore

struct Detail: View {
    @Binding var selectedItem: RecipeData
    @Binding var show: Bool
    @Binding var header:Data
    var animation: Namespace.ID
    var overlay: Bool
    var toProfile: Bool
    
    var screen = UIScreen.main.bounds.size
    var state:[Int:String] = [
        1: "減量中",
        2: "体重維持",
        3: "増量中"
    ]
    
    @EnvironmentObject var user:UserStore
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var profileImage: Data?
    @State var procedures:[Procedure] = []
    @State var procedureImages = [String:Data]()
    @State var reviews:[Review] = []
    @State var reviewImages:[String:Data] = [:]
    @State var showReview: Bool = false
    @State var showList: Bool = false
    @State var selectedReview: Review?
    @State var deleted: Bool = false
    @State var procedureNum: Int = -1
    @State var reviewable: Bool = true
    @State var edited: Bool = false
    @State var favorite:Bool = false
    @State var tmpRecipe: RecipeData = RecipeData(
        userId: "",
        title: "",
        calorie: String(0),
        protein: String(0.0),
        fat: String(0.0),
        carbo: String(0.0),
        state: 2,
        materials: "",
        contents: [],
        reviews:[],
        favNum: 0,
        create_at: "",
        update_at: "",
        delFlg: 0
    )
    @State var changing = true
    @State var showModal = false
    @State var showEdit = false
    @State var showAlert = false
    
    func sheetChange(_ tag: Bool){
        print("sheet change")
        self.load(updated: false)
    }
    
    func getFav(recipeId: String) {
        print("get fav")
        let f = Fav.keys
        var predicate = QueryPredicateGroup.init()
        predicate = predicate.and(f.recipeID == recipeId)
        predicate = predicate.and(f.userID == UserDefaults.standard.string(forKey: "sub")!)
        Amplify.API.mutate(request: .list(Fav.self, where: predicate )) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let favs):
                    print("Successfully get favs: \(favs)")
                    DispatchQueue.main.async {
                        if favs.isEmpty {
                            self.changing = false
                            return
                        }
                        self.changing = false
                        self.favorite = true
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func addFav(recipeId: String) {
        print("add fav")
        let fav = Fav(
            userID: UserDefaults.standard.string(forKey: "sub")!,
            recipeID: recipeId,
            type: "Fav"
        )
        Amplify.API.mutate(request: .create(fav)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let fav):
                    print("Successfully created fav: \(fav)")
                    self.changing = false
                    self.favorite = true
                    DispatchQueue.main.async {
                        self.user.favImageDatum[selectedItem.id] = header
                        self.user.favRecipes.insert(FavData(id:selectedItem.id), at: 0)
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func deleteFav(recipeId: String) {
        print("delete fav")
        let f = Fav.keys
        var predicate = QueryPredicateGroup.init()
        predicate = predicate.and(f.recipeID == recipeId)
        predicate = predicate.and(f.userID == UserDefaults.standard.string(forKey: "sub")!)
        Amplify.API.mutate(request: .list(Fav.self, where: predicate )) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let favs):
                    print("Successfully get favs: \(favs)")
                    if favs.isEmpty {
                        return
                    }
                    let favorite = favs[0]
                    Amplify.API.mutate(request: .delete(favorite)) { event in
                        switch event {
                        case .success(let result):
                            switch result {
                            case .success(let fav):
                                print("Successfully delete fav: \(fav)")
                                self.changing = false
                                self.favorite = false
                                if let firstIndex = self.user.favRecipes.firstIndex(where: {$0.id == selectedItem.id}) {
                                    self.user.favRecipes.remove(at: firstIndex)
                                }
                                self.user.favImageDatum.removeValue(forKey: selectedItem.id)
                            case .failure(let error):
                                print("Got failed result with \(error.errorDescription)")
                            }
                        case .failure(let error):
                            print("Got failed event with error \(error)")
                        }
                    }
                    //
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func load(updated: Bool){
        // get recipe
        tmpRecipe = selectedItem
        self.procedures = []
        self.reviews = []
        Amplify.API.query(request: .getRecipeForDetail(id: selectedItem.id)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipe):
                    print("Successfully retrieved recipe: \(recipe)")
                    // TODO del_flgチェック
                    if (recipe.delFlg == 1) {
                        self.deleted = true
                        return
                    }
                    if (updated) {
                        self.tmpRecipe.id = recipe.id
                        self.tmpRecipe.userId = recipe.user
                        self.tmpRecipe.title = recipe.title
                        self.tmpRecipe.calorie = String(recipe.calorie)
                        self.tmpRecipe.protein = String(recipe.protein)
                        self.tmpRecipe.fat = String(recipe.fat)
                        self.tmpRecipe.carbo = String(recipe.carbo)
                        self.tmpRecipe.state = recipe.state
                        self.tmpRecipe.materials = recipe.materials
                    }
                    procedureNum = recipe.contents?.count ?? -1
                    
                    Amplify.Storage.downloadData(key: "users/\(recipe.user).jpg") { result in
                        switch result {
                        case .success(let imageData):
                            DispatchQueue.main.async{
                                self.profileImage = imageData
                            }
                        case .failure(let error):
                            print("Failed to download image data - \(error)")
                        }
                    }
                    
                    recipe.contents?.forEach{ procedure in
                        DispatchQueue.main.async {
                            self.procedures.append(procedure)
                        }
                        if (procedure.image! != "") {
                            Amplify.Storage.downloadData(key: procedure.image!) { result in
                                switch result {
                                case .success(let imageData):
                                    DispatchQueue.main.async{
                                        self.procedureImages[procedure.id] = imageData
                                    }
                                case .failure(let error):
                                    print("Failed to download image data - \(error)")
                                    DispatchQueue.main.async{
                                        self.procedureImages[procedure.id] = Data()
                                    }
                                }
                            }
                        } else {
                            DispatchQueue.main.async{
                                self.procedureImages[procedure.id] = Data()
                            }
                        }
                    }

                    recipe.reviews?.forEach{ review in
                        print("reviewwwww")
                        Amplify.Storage.downloadData(key: review.image) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.reviewImages[review.id] = imageData
                                    if review.user == user.sub {
                                        self.reviewable = false
                                    }
                                    self.reviews.append(review)
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                    }
                    self.edited = false
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    var body: some View {
        //　parallex
        ZStack {
            if self.deleted {
                Text("This Recipe is Deleted")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .overlay(
                        Button(action: {
                            withAnimation(.spring()){
                                show.toggle()
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.leading,25)
                                .padding(.top,30)
                        },alignment: .topLeading
                    )
            } else {
                ScrollView(showsIndicators: false, content: {
                    GeometryReader { reader in
                        if let image = UIImage(data:header) {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .offset(y: -reader.frame(in: .global).minY)
                                .frame(
                                    width: UIScreen.main.bounds.width,
                                    height: reader.frame(in: .global).minY + (UIScreen.main.bounds.height * 0.7)
                                )
                        }
                    }
                    .frame(height: screen.height * 0.7)
                    
                    VStack(alignment:.leading ,spacing: 15) {
                        VStack {
                            HStack {
                                Text(selectedItem.title)
                                    .font(.system(size:25,weight: .bold))
                                    .foregroundColor(.white)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                                if user.sub == selectedItem.userId {
                                    Menu {
                                        Button(
                                            role: .destructive,
                                            action: {
                                                showAlert = true
                                            }, label: {
                                                Text("削除")
                                            }
                                        )
                                        .foregroundColor(Color.red)
                                        
                                        Button(action: {
                                            showEdit = true
                                        }, label: {
                                            Text("編集")
                                        })
                                    } label: {
                                        Label(
                                            title: {},
                                            icon: {
                                                Image(systemName: "ellipsis")
                                                    .foregroundColor(.white)
                                                    .frame(width: 48, height: 48)
                                            }
                                        )
                                    }
                                }
                            }
                            .padding(.top)
                            
                            HStack {
                                VStack {
                                    Text(state[tmpRecipe.state] ?? "")
                                        .font(.system(size:10))
                                        .padding(.horizontal, 14)
                                        .background(
                                            Capsule()
                                                .fill(Color.white)
                                        )
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                Spacer()
                                if let uiimage = UIImage(data: self.profileImage ?? Data()) {
                                    if toProfile {
                                        NavigationLink(destination: UserPage(userId: selectedItem.userId)) {
                                            Image(uiImage: uiimage)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: screen.width * 0.1)
                                                .clipShape(Circle())
                                        }
                                    } else {
                                        Image(uiImage: uiimage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: screen.width * 0.1)
                                            .clipShape(Circle())
                                    }
                                }
                                VStack {
                                    if user.isLogged {
                                        Button(
                                            action:{
                                                self.changing = true
                                                if self.user.favRecipes.contains(where: {$0.id == selectedItem.id}) {
                                                    self.deleteFav(recipeId: selectedItem.id)
                                                } else {
                                                    self.addFav(recipeId: selectedItem.id)
                                                }
                                            }, label: {
                                                Image(systemName: favorite ? "heart.fill":"heart")
                                                    .resizable()
                                                    .frame(width: 16, height: 16)
                                            }
                                        )
                                        .disabled(changing)
                                    }
                                    Text("\(selectedItem.calorie)kcal")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 15) {
                                VStack {
                                    HStack {
                                        Text(selectedItem.protein)
                                            .font(.system(size:20,weight: .bold))
                                            .foregroundColor(.white)
                                        Text("g")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .padding(.top,5)
                                    }
                                    Text("protein")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                VStack {
                                    HStack {
                                        Text(selectedItem.fat)
                                            .font(.system(size:20,weight: .bold))
                                            .foregroundColor(.white)
                                        Text("g")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .padding(.top,5)
                                    }
                                    Text("fat")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    HStack {
                                        Text(selectedItem.carbo)
                                            .font(.system(size:20,weight: .bold))
                                            .foregroundColor(.white)
                                        Text("g")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .padding(.top,5)
                                    }
                                    Text("carbo")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("材料")
                            .font(.system(size:20,weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        HStack {
                            Text(selectedItem.materials)
                                .underline()
                                .foregroundColor(.white)
                                .padding(.top,5)
                            Spacer()
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                        
                        Text("つくりかた")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Divider()
                            .padding(.top)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        ForEach(0..<procedures.count, id: \.self) { index in
                            VStack(alignment: .leading, spacing: 10, content:{
                                Text("\(index+1)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .frame(width: 24)
                                    .background(
                                        Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
                                    )
                                    .clipShape(Circle())
                                
                                HStack(spacing:8) {
                                    VStack {
                                        Text(procedures[index].content)
                                            .font(.caption)
                                            .padding(8)
//                                            .frame(width: screen.width * 0.6, alignment: .topLeading)
                                            .frame(alignment: .topLeading)
                                            .background(.blue)
                                    }
                                    Spacer()
                                    if let imagedata = procedureImages[procedures[index].id] {
                                        if let image = UIImage(data:imagedata ?? Data()) {
                                            Image(uiImage: image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: screen.width*0.2)
                                        }
                                    }
                                }
                            })
                            .padding(.horizontal)
                            Divider()
                                .padding(.top)
                                .foregroundColor(.white)
                        }
                        
                        Text("みんなの感想")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                if user.isLogged {
                                    if reviews.filter{$0.user == user.sub}.count == 0 {
                                        Button {
                                            self.showModal.toggle()
                                        } label: {
                                            if let imageData = user.image {
                                                let uiimage = UIImage(data: imageData)
                                                Image(uiImage: uiimage!)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width:50, height: 50)
                                                    .clipShape(Circle())
                                                    .overlay(
                                                        Image(systemName: "plus")
                                                            .padding(7)
                                                            .background(.blue, in: Circle())
                                                            .foregroundColor(.white)
                                                            .padding(2)
                                                            .background(.black, in: Circle())
                                                            .offset(x: 10, y: 10)
                                                    )
                                                    .padding(.trailing, 10)
                                            } else {
                                                Image(systemName: "person.fill")
                                                    .resizable()
                                                    .foregroundColor(.white)
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width:50, height: 50)
                                                    .clipShape(Circle())
                                                    .overlay(
                                                        Image(systemName: "plus")
                                                            .padding(7)
                                                            .background(.blue, in: Circle())
                                                            .foregroundColor(.white)
                                                            .padding(2)
                                                            .background(.black, in: Circle())
                                                            .offset(x: 10, y: 10)
                                                    )
                                                    .padding(.trailing, 10)
                                            }
                                        }
                                    }
                                }
                                ForEach(0..<self.reviews.count,id: \.self) { i in
                                    if let uiimage = UIImage(data: reviewImages[reviews[i].id] ?? Data()) {
                                        Image(uiImage: uiimage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .padding(2)
                                            .onTapGesture {
                                                selectedReview = reviews[i]
                                                withAnimation {
                                                    showReview = true
                                                }
                                            }
                                    }
                                }
                                if self.reviews.count >= 3 {
                                    Image(systemName: "ellipsis")
                                        .frame(width: 50, height: 50)
                                        .onTapGesture {
                                            self.showList = true
                                        }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical,25)
                    .background(.black)
                    .cornerRadius(20)
                    .offset(y: -35)
                })
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
                .background(Color.black.edgesIgnoringSafeArea(.all))
                .onAppear{
                    if user.isLogged {
                        self.getFav(recipeId: selectedItem.id)
                    }
                    
                    if (self.procedures.count == 0) {
                        load(updated: false)
                    }
                }
                .opacity(showReview ? 0 : 1)
                .fullScreenCover(isPresented: $showModal.onChange(sheetChange)){
                    ReviewView(
                        recipeID:selectedItem.id,
                        showSheet: $showModal
                    )
                }
                .fullScreenCover(isPresented: $showList){
                    ReviewList(
                        showList: $showList,
                        recipeId: tmpRecipe.id
                    )
                }
                .fullScreenCover(isPresented: $showEdit){
                    RecipeEdit(
                        detail_recipe: selectedItem,
                        procedureImagesData: procedureImages,
                        detail_header: $header,
                        showSheet: $showEdit
                    )
                }
                .if(overlay) {
                    $0.overlay(
                        Button(action: {
                            withAnimation(.spring()){
                                show = false
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.leading,25)
                                .padding(.top,25)
                        }
                        ,alignment: .topLeading
                    )
                }
                .if(!overlay) {
                    $0.overlay(
                        Button("戻る") {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .padding(.leading)
                        .padding(.top,8)
                        ,alignment: .topLeading
                    )
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Warning"),
                        message: Text("このレシピを削除しますか？"),
                        primaryButton: .cancel(Text("キャンセル")),
                        secondaryButton: .destructive(
                            Text("削除"),
                            action: {
                               print("delete")
//                                deleteRecipe()
                            }
                        )
                    )
                }
                
                if (showReview) {
                    if let review = selectedReview {
                        StoryView(showReview: $showReview, reviewImage: self.reviewImages[review.id] ?? Data(), reviewData: review)
                            .ignoresSafeArea(.all)
                            .transition(.move(edge:.bottom))
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct StoryView: View {
    @Binding var showReview:Bool
    var reviewImage: Data
    var reviewData: Review
    
    var body: some View {
        ZStack {
            VStack {
                if let uiimage = UIImage(data:reviewImage) {
                    Image(uiImage: uiimage)
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                }
                ScrollView(showsIndicators: false) {
                    HStack {
                        Text(reviewData.content)
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
            }
            .padding(.bottom,32)
        }
        .statusBar(hidden: true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .overlay(
            Button(action: {
                withAnimation(.spring()){
                    showReview = false
                }
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(8)
                    .background(.white, in: Circle())
            })
            .padding()
            .padding(.top)
            ,alignment: .topTrailing
        )
    }
}
