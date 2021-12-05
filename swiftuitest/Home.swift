//
//  Home.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Amplify

struct Home: View {
//    @Binding var tabSelection: Int
    @State var isLogin = false
    @State var showModal = false
    @State var showDetail = false
    
    @State var index: Int = 0
    @State var selectedImage = Data()
    @Namespace var animation
    @EnvironmentObject var user:UserStore
    @EnvironmentObject var network:Network
    
    let itemHeight:CGFloat = 500
    let imageHeight:CGFloat = 400
    let SVWidth = UIScreen.main.bounds.width - 40
    @State var expandedScreen_startPoint = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var expandedScreen_returnPoint = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var expandedScreen_shown = false
    @State var expandedScreen_willHide = false
    @State var expandedItem = RecipeData(
        id: "1",
        userId:"1",
        title:"title",
        calorie: String(0),
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
    )
    
    @State var showDetailPage: Bool = false
    @State var currentCard: RecipeData?
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Today's Receipt")
                            .font(.system(size: 28,weight: .bold))
                        Spacer()
                        AvatarView(showModal: $showModal)
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                    // 本当はログインしていなくても表示
                    if user.isLogged && user.myRecipes.count >= 1 {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(0..<user.myRecipes.count, id: \.self) { i in
                                    if let recipe = user.myRecipes[i] {
                                        RecipeCard(card: recipe)
                                            .onTapGesture {
                                                withAnimation(.spring()){
                                                    showDetail = true
                                                    index = i
                                                    selectedImage = user.imageDatum[recipe.id] ?? Data()
                                                }
                                            }
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    Spacer()
                    BannerAd(unitID: "ca-app-pub-5558779899182260/4197512760")
                }
                .padding()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .opacity(showDetail ? 0 : 1)

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

struct RecipeCard: View {
    @EnvironmentObject var user:UserStore
    var card: RecipeData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Spacer(minLength: 0)
                if let uiimage = UIImage(data: user.imageDatum[card.id] ?? Data()) {
                    Image(uiImage: uiimage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 3)
                        .clipShape(Circle())
                }
            }
            Text(card.title)
                .font(.title)
                .foregroundColor(.black)
            
            HStack(spacing: 12) {
                Label(title: {
                    Text("recipe.rating")
                        .font(.caption)
                        .foregroundColor(.gray)
                }) {
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(Color("orange"))
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(.blue.opacity(0.4))
                .cornerRadius(5)
                
                Text("recipe.type")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(.blue.opacity(0.4))
                    .cornerRadius(5)
            }
            
            Text("recipe.detail")
                .foregroundColor(.gray)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: UIScreen.main.bounds.width / 2)
        .background(
            Color.blue
                .opacity(0.2)
                .cornerRadius(25)
                .padding(.top, 55)
        )
        
    }
}
