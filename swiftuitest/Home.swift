//
//  Home.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Amplify
import AWSPluginsCore

struct Home: View {
    @State var isLogin = false
    @State var showModal = false
    @State var showDetail = false
    @State var first = true
    
    @State var index: Int = 0
    @State var selectedImage = Data()
    @State var poplularRecipes: [RecipeData] = []
    @State var imageDatum = [String:Data]()
    @Namespace var animation
    @EnvironmentObject var user:UserStore
    @EnvironmentObject var network:Network
    
    func getRecipes() {
        Amplify.API.query(request: .getRecipesByFav()) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("Successfully retrieved popular recipes:")
                    let recipes = query.getItems()
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.poplularRecipes.append(
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
                                    image:item.image,
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
                    }
                case .failure(let error):
                    print("Got failed popular result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed popular event with error \(error)")
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color("background")
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Today's Receipt")
                            .font(.system(size: 28,weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                        AvatarView(showModal: $showModal)
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                    if (poplularRecipes.count >= 1) {
                        ForEach(0...poplularRecipes.count-1,id: \.self) { i in
                            let adPlacement: Int = 3
                            if let recipe = poplularRecipes[i] {
                                if let image = UIImage(data: imageDatum[recipe.id] ?? Data()) {
                                    Card(
                                        i:i,
                                        recipe:recipe,
                                        image:image
                                    )
                                    .onTapGesture {
                                        withAnimation(.spring()){
                                            showDetail = true
                                            index = i
                                            selectedImage = user.imageDatum[recipe.id] ?? Data()
                                        }
                                    }
                                    if i % adPlacement == 0 {
                                        BannerAd(unitID: "ca-app-pub-5558779899182260/4197512760")
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .opacity(showDetail ? 0 : 1)
            .onAppear{
                if first {
                    self.getRecipes()
                    first = false
                }
            }

            if user.showLogin {
                ZStack {
                    LoginView()
                    VStack{
                        HStack{
                            Spacer()
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    .padding()
                    .onTapGesture {
                        self.user.showLogin = false
                    }
                }
            }
            
            if showDetail {
                Detail(
                    selectedItem: $user.myRecipes[index],
                    show: $showDetail,
                    header: $selectedImage,
                    animation: animation
                )
                .ignoresSafeArea(.all)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserStore())
    }
}

struct Card: View {
    var i: Int
    var recipe: RecipeData
    var image: UIImage
    var body: some View {
        ZStack  {
            HStack {
                if i % 2 ==  1 {
                    Spacer()
                }
                Image(uiImage:image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (UIScreen.main.bounds.width * 0.5), height: UIScreen.main.bounds.height / 3)
                    .clipped()
                    .padding()
                if i % 2 ==  0 {
                    Spacer()
                }
            }
            
            if i % 2 ==  1 {
                HStack {
                    SectionView(i:i,recipe:recipe)
                        .padding()
                    Spacer()
                }
            } else {
                HStack {
                    Spacer()
                    SectionView(i:i,recipe:recipe)
                        .padding()
                }
            }
        }
    }
}

struct SectionView: View {
    var i: Int
    var recipe: RecipeData
    var body: some View {
        VStack {
            Text(recipe.title)
                .font(.custom("851MkPOP",size: 15))
                .foregroundColor(.black)
            HStack {
                Text("\(recipe.calorie)kcal")
//                    .font(.subheadline)
                    .font(.custom("851MkPOP",size: 15))
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                Spacer()
            }
            .padding(.vertical,5)
            HStack {
                VStack {
                    Image(systemName: "p.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width:22, height: 22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                        .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                    Text("\(recipe.protein)")
//                        .font(.subheadline)
                        .font(.custom("851MkPOP",size: 15))
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                }
                Spacer()
                VStack {
                    Image(systemName: "f.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width:22, height: 22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                        .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                    Text("\(recipe.fat)")
                        .font(.custom("851MkPOP",size: 15))
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                }
                Spacer()
                VStack {
                    Image(systemName: "c.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width:22, height: 22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                        .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                    Text("\(recipe.carbo)")
                        .font(.custom("851MkPOP",size: 15))
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                }
            }
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height / 4)
        .background(
            Image("paper")
        )
//        .clipShape(RounddRectangle(cornerRadius: 16, style: .continuous))
        .clipShape(Rectangle())
        .shadow(
            color: Color(#colorLiteral(red: 0.760805108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: i%2==0 ?20:-20, y: 20
        )
        .shadow(color: Color(.white), radius: 20, x: i%2==0 ? 20 : -20, y: -20)
        
    }
}
