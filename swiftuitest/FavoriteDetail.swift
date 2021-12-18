//
//  FavoriteDetail.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/11/21.
//

import SwiftUI
import Amplify
import AWSPluginsCore

struct FavoriteDetail: View {
    
    @Binding var show: Bool
    @Binding var header:Data
    
    var animation: Namespace.ID
    var screen = UIScreen.main.bounds.size
    var selectedId: String
    var state:[Int:String] = [
        1: "減量中",
        2: "体重維持",
        3: "増量中"
    ]
    
    // offsetScrollView用
    @State var verticalOffset: CGFloat = 0.0
    
    @EnvironmentObject var user:UserStore
    
    @State var profileImage: Data?
    @State var procedures:[Procedure] = []
    @State var reviews:[Review] = []
    @State var deleted: Bool = false
    @State var procedureNum: Int = -1
    @State var reviewable: Bool = false
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
                    self.user.favImageDatum[selectedId] = header
                    self.user.favRecipes.insert(FavData(id:selectedId), at: 0)
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
                                if let firstIndex = self.user.favRecipes.firstIndex(where: {$0.id == selectedId}) {
                                    self.user.favRecipes.remove(at: firstIndex)
                                }
                                self.user.favImageDatum.removeValue(forKey: selectedId)
//                                UserDefaults.standard.set(self.user.favImageDatum, forKey: "favImageDatum")
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
//        self.procedures = []
        Amplify.API.query(request: .getRecipeForDetail(id: selectedId)) { event in
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
                        print("contentttttt")
                        DispatchQueue.main.async {
                            self.procedures.append(procedure)
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
        // 拡大遷移
        // 親ViewのZStackの上に表示
        if let image = UIImage(data:header) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding()
        }

        Color.black
            .opacity(0.5)
        
            OffsetableScrollView { point in
                verticalOffset = point.y
            } content: {
                VStack {
                    HStack {
                        Text(tmpRecipe.title)
                            .font(.system(size:25,weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
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
                            NavigationLink(destination: UserPage(userId: tmpRecipe.userId)) {
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
                                        if self.user.favRecipes.contains(where: {$0.id == selectedId}) {
                                            self.deleteFav(recipeId: selectedId)
                                        } else {
                                            self.addFav(recipeId: selectedId)
                                        }
                                    }, label: {
                                        Image(systemName: favorite ? "heart.fill":"heart")
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                    }
                                )
                                .disabled(changing)
                            }
                            Text("\(tmpRecipe.calorie)kcal")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        VStack {
                            HStack {
                                Text(tmpRecipe.protein)
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
                                Text(tmpRecipe.fat)
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
                                Text(tmpRecipe.carbo)
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
                    
                    HStack {
                        Text("材料")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.top, 16)

                    HStack {
                        Spacer()
                        Text(tmpRecipe.materials)
                            .padding(.top,5)
                        Spacer()
                    }
                    .padding(.bottom)

                    HStack {
                        Text("つくりかた")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(0..<procedures.count, id:\.self){ i in
                            HStack {
                                Text("\(i+1). \(procedures[i].content)")
                                    .frame(width: screen.width * 0.7, alignment: .topLeading)
                                Spacer()
                            }
                            Divider()
                                .padding(.top)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top)
                }
                .padding(.horizontal,32)
                .padding(.top,36)
            }
            .overlay(
                Button(action: {
                    // closing
                    withAnimation(.spring()){
                        show.toggle()
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.leading,25)
                        .padding(.top,25)
                },alignment: .topLeading
            )
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height * 0.9
            )
            .onAppear{
                if user.isLogged {
                    self.getFav(recipeId: selectedId)
                }
                if (self.procedures.count == 0) {
                    load(updated: true)
                }
            }
//        }
        
    }
}


private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        
    }
}

struct OffsetableScrollView<T: View>: View {
    let axes: Axis.Set
    let showsIndicator: Bool
    let offsetChanged: (CGPoint) -> Void
    let content: T
    
    init(
        axes: Axis.Set = .vertical,
        showsIndicator: Bool = true,
        offsetChanged: @escaping (CGPoint) -> Void = {_ in },
        @ViewBuilder content: () -> T
    ){
        self.axes = axes
        self.showsIndicator = showsIndicator
        self.offsetChanged = offsetChanged
        self.content = content()
    }
    
    var body: some View {
        ScrollView(
            axes,
            showsIndicators: showsIndicator
        ) {
            GeometryReader{ proxy in
                Color.clear.preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .named("ScrollView")).origin
                )
            }
            .frame(width:0, height:0)
            content
        }
        .coordinateSpace(name: "ScrollView")
        .onPreferenceChange(OffsetPreferenceKey.self, perform: offsetChanged)
    }
}
