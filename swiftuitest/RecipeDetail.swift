//
//  Recipe.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Amplify

struct RecipeDetail: View {
    
    var recipe: RecipeData
    var editable: Bool
    
    @State private var isActive = false
    @Binding var isFirstViewActive: Bool
    
    @EnvironmentObject var user:UserStore
    
    @State var favorite:Bool = false
    @State var procedures:[Procedure] = []
    @State var procedureImages = [String:Data]()
    @State var reviews:[Review] = []
    @State var reviewImages = [String:Data]()
    @State var screen: CGSize! = UIScreen.main.bounds.size
    @State var image:Data = Data()
    @State var showModal = false
    @State var showEditModal = false
    @State var profile:Data = Data()
    @State var procedureNum: Int = -1
    @State var deleted: Bool = false
    @State var reviewable: Bool = false
    
    @State var tmpRecipe: RecipeData = RecipeData(
        userId: "",
        title: "",
        protein: String(0.0),
        fat: String(0.0),
        carbo: String(0.0),
        state: 2,
        materials: "",
        contents: [],
        reviews:[],
        image: "",
        favNum: 0,
        create_at: "",
        update_at: "",
        delFlg: 0
    )
    @State var edited: Bool = false
    @State var showAlert :Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func deleteRecipe() {
        let amplifyRecipe = Recipe(
            id: self.recipe.id,
            user: self.recipe.userId,
            type: "Recipe",
            title: self.recipe.title,
            protein: Double(self.recipe.protein) ?? 0.0,
            fat: Double(self.recipe.fat) ?? 0.0,
            carbo: Double(self.recipe.carbo) ?? 0.0,
            state: self.recipe.state,
            materials: self.recipe.materials,
            image: self.recipe.image,
            favNum: self.recipe.favNum,
            createdAt: recipe.create_at,
            updatedAt: recipe.update_at,
            delFlg: 1
        )
        Amplify.API.mutate(request: .update(amplifyRecipe)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let a):
                    print("Successfully delete recipe: \(a)")
                    DispatchQueue.main.async {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    user.getMyRecipes()
                    print("All Process Done!")
                case .failure(let error):
                    print("Got failed update result with \(error.errorDescription)")
                    break
                }
            case .failure(let error):
                print("Got failed update event with error \(error)")
                break
            }
        }
    }
    
    func load(updated: Bool){
        // get recipe
        tmpRecipe = recipe
        self.procedures = []
        self.procedureImages = [:]
        Amplify.API.query(request: .getRecipeForDetail(id: recipe.id)) { event in
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
                        self.tmpRecipe.protein = String(recipe.protein)
                        self.tmpRecipe.fat = String(recipe.fat)
                        self.tmpRecipe.carbo = String(recipe.carbo)
                        self.tmpRecipe.state = recipe.state
                        self.tmpRecipe.materials = recipe.materials
                    }
                    procedureNum = recipe.contents?.count ?? -1
                    let options = StorageDownloadDataRequest.Options(accessLevel: .guest)
                    Amplify.Storage.downloadData(key: recipe.image,options: options) { result in
                        switch result {
                        case .success(let imageData):
                            DispatchQueue.main.async{
                                self.image = imageData
                            }
                        case .failure(let error):
                            print("Failed to download image data - \(error)")
                        }
                    }
                    Amplify.Storage.downloadData(key: "\(recipe.user).jpg",options: options) { result in
                        switch result {
                        case .success(let imageData):
                            DispatchQueue.main.async{
                                self.profile = imageData
                            }
                        case .failure(let error):
                            print("Failed to download image data - \(error)")
                        }
                    }
                    
                    
                    recipe.contents?.forEach{ procedure in
                        print("contentttttt")
                        DispatchQueue.main.async {
                            self.procedures.append(procedure)
                        }
                        Amplify.Storage.downloadData(key: procedure.image!,options: options) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.procedureImages[procedure.id] = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                    }

                    recipe.reviews?.forEach{ review in
                        print("reviewwwww")
                        DispatchQueue.main.async {
                            if review.user == user.sub {
                                self.reviewable = true
                            }
                            self.reviews.append(review)
                        }
                        Amplify.Storage.downloadData(key: review.image!,options: options) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.reviewImages[review.id] = imageData
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
        let states:[String] = [
            "",
            "減量中",
            "体重維持",
            "増量中"
        ]
        
        if !self.deleted {
            ScrollView {
                VStack(spacing:20){
                    if let header = UIImage(data:image) {
                        Image(uiImage: header)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screen.width, height: 200)
                    } else {
                        LottieView(filename: "search")
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                            .padding(.horizontal, 4)
                    }
                    
                    HStack {
                        Text(states[tmpRecipe.state])
                            .frame(alignment: .leading)
                            .background(Color.orange)
                            .cornerRadius(20)
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("材料")

                        Spacer()
                        if user.isLogged {
                            Button(
                                action:{
                                    if self.user.fav.keys.contains(recipe.id) {
                                        favorite = false
                                        self.user.fav.removeValue(forKey: recipe.id)
                                        self.user.localFavs.removeValue(forKey: recipe.id)
                                    } else {
                                        favorite = true
                                        self.user.fav[recipe.id] = recipe
                                        self.user.localFavs[recipe.id] = recipe.id
                                    }
                                }, label: {
                                    Image(systemName: favorite ? "star.fill":"star")
                                        .font(.title)
                                        .padding()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
//                                        .background(Color.purple)
//                                        .clipShape(Circle())
                                })
                        }
                        if let image = UIImage(data: profile) {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack {
//                        Text(recipe.materials)
                        Text(tmpRecipe.materials)
                            .background(Color.orange)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
    //                    ForEach(procedures, content: { procedure in
                        ForEach(0..<procedures.count, id: \.self) { index in
                            HStack {
                                Text("手順\(index+1)")
                                    .font(.system(size: 20,weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                Spacer()
                            }
                            HStack(spacing:8) {
                                VStack {
                                    Text(procedures[index].content)
                                        .padding(8)
                                        .frame(width: screen.width * 0.7, alignment: .topLeading)
                                }
    //                                .frame(maxWidth: .infinity)
                                .background(
                                    BlurView(style: .systemMaterial)
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 30,
                                        style: .continuous
                                    )
                                )
                                .shadow(
                                    color: .black.opacity(0.15),
                                    radius: 20, x:0, y:20
                                )
                                    
                                Spacer()
    //                                .frame(width:screen.width*0.6,height:200,alignment: .leading)
                                if let image = UIImage(data:procedureImages[procedures[index].id] ?? Data()) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: screen.width*0.2)
                                } else {
                                    LottieView(filename: "search")
                                        .frame(height: 200)
                                }
                            }
                            .padding(.horizontal)
                        }
    //                    )
                    }
                    
                    VStack(alignment: .leading) {
    //                    ForEach(procedures, content: { procedure in
                        ForEach(0..<reviews.count, id: \.self) { index in
                            HStack {
                                Text("レビュー\(index+1)")
                                    .font(.system(size: 20,weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                Spacer()
                            }
                            HStack(spacing:8) {
                                VStack {
                                    Text(reviews[index].content)
                                        .padding(8)
                                }
                                .frame(width: screen.width * 0.7, height: 110, alignment: .topLeading)
    //                                .frame(maxWidth: .infinity)
                                .background(
                                    BlurView(style: .systemMaterial)
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 30,
                                        style: .continuous
                                    )
                                )
                                .shadow(
                                    color: .black.opacity(0.15),
                                    radius: 20, x:0, y:20
                                )
                                    
                                Spacer()
    //                                .frame(width:screen.width*0.6,height:200,alignment: .leading)
                                if let image = UIImage(data:reviewImages[reviews[index].id] ?? Data()) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: screen.width*0.2)
                                } else {
                                    LottieView(filename: "search")
                                        .frame(height: 200)
                                }
                            }
                            .padding(.horizontal)
                        }
    //                    )
                    }
                }
                if self.reviewable && user.sub != nil {
                    HStack {
                        Button(action: {
                            self.showModal.toggle()
                        }){
                            Text("Review")
                                .foregroundColor(.black)
                        }
                        .padding(12)
                        .padding(.horizontal, 30)
                        .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color:Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3),radius: 20, x:0, y:20)
                    }
                }
            }
            .padding(.horizontal)
//            .navigationTitle(recipe.title)
            .navigationTitle(tmpRecipe.title)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing){
                    if self.editable && procedureNum == procedureImages.count {
                        NavigationLink(
                            destination:RecipeEdit(
//                                detail_recipe: recipe,
                                detail_recipe: tmpRecipe,
                                detail_image: image,
                                detail_procedures: procedures,
                                detail_procedures_images: procedureImages,
                                edited: $edited
                                ,isFirstViewActive: $isFirstViewActive
                            )
                            ,isActive: $isActive
                        ){
//                            Text("Edit")
                            
                            Button(action: {
                                self.isActive = true
                            }, label: {
                                Text("Edit")
                            })
                            
                        }
                        .isDetailLink(false)
                        
                        
//                        Menu {
//                            Button(action: {
//                                print("edit")
//                                self.showEditModal.toggle()
//                            }) {
//                                Text("Edit")
//                                Image(systemName: "pencil")
//                            }
//
//                            Button(action: {
//                                self.showAlert.toggle()
//                            }) {
//                                Text("Delete")
//                                Image(systemName: "trash")
//                            }
//                        } label: {
//                            Image(systemName: "ellipsis")
//                        }
                    }
                }
            }
            .onAppear{
                self.favorite = self.user.fav.keys.contains(recipe.id) ? true : false
                screen = UIScreen.main.bounds.size
                if (self.procedures.count == 0) {
                    load(updated: false)
                }
            }
            .onChange(of: self.edited) {newValue in
                print("edited changed")
                print(newValue)
                if (newValue) {
                    load(updated: true)
                }
            }
            .sheet(isPresented: $showModal){
                ReviewView(recipeID:recipe.id)
            }
//            .sheet(isPresented: $showEditModal){
//                RecipeEdit(
//                    detail_recipe: tmpRecipe,
//                    detail_image: image,
//                    detail_procedures: procedures,
//                    detail_procedures_images: procedureImages,
//                    edited: $edited
//                )
//            }
            .alert(isPresented: $showAlert){
                Alert(
                    title: Text("Warning"),
                    message: Text("このレシピを削除しますか？"),
                    primaryButton: .cancel(Text("キャンセル")),
                    secondaryButton: .destructive(Text("削除"),action: {
                        print("delete")
                        deleteRecipe()
                    })
                )
            }
        } else {
            Text("Deleted")
                .onAppear{
                    user.localFavs.removeValue(forKey: recipe.id)
                }
        }
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    @State static var isFirstViewActive = false
    static var previews: some View {
        RecipeDetail(
            recipe: RecipeData(
                id: "1",
                userId:"1",
                title:"title",
                protein: String(1),
                fat: String(1),
                carbo: String(1),
                state: 2,
                materials:"a",
                contents: [],
                reviews: [],
                image: "https://thumb.photo-ac.com/13/138a664e93a533fd2c86786eee42e391_w.jpeg",
                favNum: 0,
                create_at: "",
                update_at: "",
                delFlg: 0
            ),
            editable: true,
            isFirstViewActive: $isFirstViewActive
        )
        .environmentObject(UserStore())
//        .environmentObject(FavStore())
    }
}
