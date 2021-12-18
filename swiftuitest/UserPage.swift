//
//  UserView.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/12/14.
//

import SwiftUI
import Amplify

struct UserPage: View {
    var userId: String
    
    @State var username: String = ""
    @State var description: String =  ""
    @State var image: Data?
    @State var token: String = ""
    @State var recipes:[RecipeData] = []
    @State var imageDatum = [String:Data]()
    @State var showDetail: Bool = false
    @State var index: Int = -1
    @State var currentImage: Data = Data()
    @State var first = true
    @State var navigationViewIsActive: Bool = false
    
    @Namespace var animation
    
    func getUser() {
        Amplify.API.query(request: .get(User.self, byId: userId)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let user):
                    guard let user = user else {
                        print("Could not find todo")
                        return
                    }
                    print("Successfully retrieved User: \(user)")
                    DispatchQueue.main.async {
                        self.username = user.name
                        self.description = user.description ?? ""
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func getRecipes() {
        Amplify.API.query(request:.getMyRecipesByDate(userid: userId)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("Successfully retrieved my list of recipes:")
                    let recipes = query.getItems()
                    DispatchQueue.main.async {
                        self.token = query.getNextToken()
                    }
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(
                                RecipeData(
                                    id:item.id,
                                    userId:item.user,
                                    title:item.title,
                                    calorie: String(item.calorie),
                                    protein:String(item.protein),
                                    fat:String(item.fat),
                                    carbo:String(item.carbo),
                                    state:item.state,
                                    materials:item.materials,
                                    contents:[],
                                    reviews: [],
                                    favNum: item.favNum,
                                    create_at: item.createdAt!,
                                    update_at: item.updatedAt!,
                                    delFlg: item.delFlg
                            ))
                        }
                        Amplify.Storage.downloadData(key: "recipes/\(item.id).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.imageDatum[item.id] = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                        Amplify.Storage.downloadData(key: "users/\(userId).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.image = imageData
                                }
                            case .failure(let error):
                                print("Failed to download user data - \(error)")
                            }
                        }
                    }
                case .failure(let error):
                    print("Got failed recent result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed recent event with error \(error)")
            }
        }
    }
    
    func listNextPage(nextToken: String) {
        print("listNextPage")
        Amplify.API.query(request:.getMyRecipesByDateNextPage(userid: userId, nextToken: token)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    let recipes = query.getItems()
                    DispatchQueue.main.async {
                        self.token = query.getNextToken()
                    }
                    print("Successfully retrieved next list of recipes:")
                    recipes.forEach { item in
                        print("next recipeeeee")
                        print(item.title)

                        DispatchQueue.main.async {
                            if !self.recipes.contains(where: {$0.id == item.id}) {
                                self.recipes.append(
                                    RecipeData(
                                        id:item.id,
                                        userId:item.user,
                                        title:item.title,
                                        calorie: String(item.calorie),
                                        protein:String(item.protein),
                                        fat:String(item.fat),
                                        carbo:String(item.carbo),
                                        state:item.state,
                                        materials:item.materials,
                                        contents:[],
                                        reviews: [],
                                        favNum: item.favNum,
                                        create_at: item.createdAt!,
                                        update_at: item.updatedAt!,
                                        delFlg: item.delFlg
                                ))
                            }
                        }
                        Amplify.Storage.downloadData(key: "recipes/\(item.id).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.imageDatum[item.id] = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                    }
                case .failure(let error):
                    print("Got failed get next result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed get next event with error \(error)")
            }
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    BannerAd(unitID: "ca-app-pub-5558779899182260/4197512760")
                    // profileCard
                    VStack {
                        VStack(alignment: .leading,spacing: 16) {
                            HStack {
                                if let imageData = image {
                                    let uiimage = UIImage(data: imageData)
                                    Image(uiImage: uiimage!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:66)
                                        .clipShape(Circle())
                                } else {
                                    ZStack {
                                        Circle()
                                            .frame(width: 66, height: 66, alignment: .center)
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 24, weight: .medium, design: .rounded))
                                    }
                                    .frame(width: 66, height: 66, alignment: .center)
                                }
                                
                                VStack {
                                    Text(self.username)
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                }
                                .frame(maxWidth: .infinity)
                                
                                Spacer()
                                
                            }
                            
                            Rectangle()
                                .frame(height:1)
                                .foregroundColor(.white.opacity(0.1))
                            
                            Text(description)
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        .padding(16)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white.opacity(0.2))
                            .background(VisualEffectBlur(blurStyle: .dark))
                    )
                    .cornerRadius(30)
                    .padding()
                    
                    VStack {
                        if index != -1 {
                            NavigationLink(
                                destination: Detail(
                                    selectedItem: $recipes[index],
                                    show: $navigationViewIsActive,
                                    header: $currentImage,
                                    animation: animation,
                                    overlay:false,
                                    toProfile: false
                                ),
                                isActive: $navigationViewIsActive){ EmptyView() }
                        }
                    }.hidden()
                    
                    if (self.imageDatum.count >= 1) {
                        ForEach(0...self.recipes.count-1,id: \.self) { i in
                            if let recipe = self.recipes[i] {
                                PostView(
                                    recipe: recipe,
                                    header: imageDatum[recipe.id] ?? Data()
                                )
                                .onTapGesture{
                                    withAnimation(.spring()){
                                        index = i
                                        currentImage = imageDatum[recipe.id] ?? Data()
                                        self.navigationViewIsActive = true
                                    }
                                }
                                .onAppear {
                                    if i == self.recipes.count - 1 {
                                        if (!token.isEmpty) {
                                            self.listNextPage(nextToken: token)
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        ProgressView()
                    }
                    Spacer()
                }
            }
            .onAppear{
                if (first) {
                    self.getUser()
                    self.getRecipes()
                    self.first = false
                }
            }
        }
        .background(.black)
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
