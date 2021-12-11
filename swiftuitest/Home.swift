//
//  Home.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Amplify

struct Home: View {
    @State var isLogin = false
    @State var showModal = false
    @State var showDetail = false
    
    @State var index: Int = 0
    @State var selectedImage = Data()
    @Namespace var animation
    @EnvironmentObject var user:UserStore
    @EnvironmentObject var network:Network
    @Environment(\.colorScheme) var scheme
    
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
                    
                    // 本当はログインしていなくても表示
//                    if user.isLogged && user.myRecipes.count >= 1 {
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack(spacing: 15) {
//                                ForEach(0..<user.myRecipes.count, id: \.self) { i in
//                                    if let recipe = user.myRecipes[i] {
//                                        RecipeCard(card: recipe)
//                                        .onTapGesture {
//                                            withAnimation(.spring()){
//                                                showDetail = true
//                                                index = i
//                                                selectedImage = user.imageDatum[recipe.id] ?? Data()
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                            .padding()
//                        }
//                    }
                    
                    if user.isLogged {
                        ForEach(0...user.myRecipes.count-1,id: \.self) { i in
                            let adPlacement: Int = 3
                            if let recipe = user.myRecipes[i] {
                                if let image = UIImage(data:user.imageDatum[recipe.id] ?? Data()) {
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
//                    .frame(width: (UIScreen.main.bounds.width * 0.7), height: (UIScreen.main.bounds.height / 2))
                    .frame(width: (UIScreen.main.bounds.width * 0.5), height: UIScreen.main.bounds.height / 3)
                    .clipped()
//                    .cornerRadius(15)
                    .padding()
                if i % 2 ==  0 {
                    Spacer()
                }
            }
            
            if i % 2 ==  1 {
                HStack {
                    SectionView(i:i,recipe:recipe)
                        .padding()
//                        .opacity(0.9)
                    Spacer()
                }
            } else {
                HStack {
                    Spacer()
                    SectionView(i:i,recipe:recipe)
                        .padding()
//                        .opacity(0.9)
                }
            }
        }
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
            Spacer()
            Text(card.title)
                .font(.caption)
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width / 2, alignment: .center)
            Spacer()
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width / 2)
        .background(
            Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
                .cornerRadius(30)
                .shadow(color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                .padding(.top, 55)
        )
        
    }
}

struct SectionView: View {
    var i: Int
    var recipe: RecipeData
    var body: some View {
        VStack {
            Text(recipe.title)
                .font(.title3).fontWeight(.bold)
                .foregroundColor(.black)
            HStack {
                Text("\(recipe.calorie)kcal")
                    .font(.subheadline)
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
                        .font(.subheadline)
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
                        .font(.subheadline)
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
                        .font(.subheadline)
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
