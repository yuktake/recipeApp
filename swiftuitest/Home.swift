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
    @Namespace var animation
    @EnvironmentObject var user:UserStore
    @State var poplularRecipes: [RecipeData] = []
    @State var imageDatum = [String:Data]()
    @State var users:[User] = []
    @State var userImages:[String:Data?] = [:]
    
    func getPopularUsers() {
        print("getPopularUsers")
        Amplify.API.query(request: .getPopularUsers()) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("Successfully retrieved popular users:")
                    let users = query.getItems()
                    users.forEach { user in
                        Amplify.Storage.downloadData(key: "users/\(user.id).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.users.append(user)
                                    self.userImages[user.id] = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                                DispatchQueue.main.async{
                                    self.users.append(user)
                                    self.userImages[user.id] = Data()
                                }
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
    
    func getRecipes() {
        Amplify.API.query(request: .getPopularRecipes()) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("Successfully retrieved popular recipes:")
                    let recipes = query.getItems()
                    recipes.forEach { item in
                        Amplify.Storage.downloadData(key: "recipes/\(item.id).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
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
                                            favNum: item.favNum,
                                            create_at: item.createdAt!,
                                            update_at: item.updatedAt!,
                                            delFlg: item.delFlg
                                    ))
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
            if imageDatum.count >= 3 {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        HStack {
                            Text("Today's Receipt")
                                .font(.system(size: 28,weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                            AvatarView(showModal: $showModal)
                        }
                        .padding(.horizontal)
                        .padding(.top, 30)
                        
                        HStack {
                            Text("人気のユーザ")
                                .font(.system(size: 20,weight: .bold))
                                .foregroundColor(.black)
                                .padding(.leading)
                            Spacer()
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
//                                ScrollView(.horizontal, showsIndicators: false) {
                                ForEach(0..<self.users.count,id: \.self) { i in
                                    if let user = users[i] {
                                        if let uiimage = UIImage(data: (userImages[user.id] ?? nil) ?? Data() ) {
                                            NavigationLink(destination: UserPage(userId: user.id)) {
                                                Image(uiImage: uiimage)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 50, height: 50)
                                                    .clipShape(Circle())
                                                    .padding(2)
                                            }
                                        } else {
                                            NavigationLink(destination: UserPage(userId: user.id)) {
                                                Image(systemName: "person.fill")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 50, height: 50)
                                                    .clipShape(Circle())
                                                    .padding(2)
                                            }
                                        }
                                    }
                                }
//                                }
//                                .frame(width: UIScreen.main.bounds.width)
                            }
                        }
                        .padding(.leading)
                        
                        if (self.poplularRecipes.count >= 1) {
                            ForEach(0...self.poplularRecipes.count-1,id: \.self) { i in
                                let adPlacement: Int = 3
                                if let recipe = self.poplularRecipes[i] {
                                    if let image = UIImage(data: self.imageDatum[recipe.id] ?? Data()) {
                                        Card(
                                            i:i,
                                            recipe:recipe,
                                            image:image
                                        )
                                        // これで範囲が固定された！！
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            withAnimation(.spring()){
                                                showDetail = true
                                                index = i
                                                selectedImage = imageDatum[recipe.id] ?? Data()
                                            }
                                        }
                                    } else {
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: (UIScreen.main.bounds.width * 0.5), height: UIScreen.main.bounds.height / 3)
                                            .clipped()
                                    }
                                    if i % adPlacement == 0 {
                                        BannerAd(unitID: "ca-app-pub-5558779899182260/4197512760")
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                    }
//                    .frame(
//                        maxWidth: .infinity,
//                        maxHeight: .infinity,
//                        alignment: .top
//                    )
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .opacity(showDetail ? 0 : 1)

                if user.showLogin {
                    ZStack {
                        LoginView()
                    }
                }
                
                if showDetail {
                    Detail(
                        selectedItem: $poplularRecipes[index],
                        show: $showDetail,
                        header: $selectedImage,
                        animation: animation,
                        overlay: true,
                        toProfile: true
                    )
                    .ignoresSafeArea(.all)
                }
                
            } else {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                }
                .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height)
            }
        }
        .onAppear{
            if (first) {
                first = false
                self.getRecipes()
                self.getPopularUsers()
            }
        }
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
        .clipShape(Rectangle())
        .shadow(
            color: Color(#colorLiteral(red: 0.760805108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: i%2==0 ?20:-20, y: 20
        )
        .shadow(color: Color(.white), radius: 20, x: i%2==0 ? 20 : -20, y: -20)
        
    }
}

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}
