//
//  Profile.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Amplify

struct ProfileView: View {
    @State var isActive : Bool = false
    @State var showSettings:Bool = false
    @Binding var tabSelection: Int
    @EnvironmentObject var user: UserStore

    @State var index: Int = 0
    @State var isDetail: Bool = false
    @State var refresh = Refresh(started: false, released: false)
    
    func updateData() {
        print("updated")
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            withAnimation(Animation.linear) {
                if refresh.startOffset == refresh.offset {
                    // addData here
                    
                    refresh.released = false
                    refresh.started = false
                } else {
                    refresh.invalid = true
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
//            Image("background-2")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .edgesIgnoringSafeArea(.all)
            
            NavigationView {
                ScrollView {
                    GeometryReader{ reader -> AnyView in
                        DispatchQueue.main.async {
                            if refresh.startOffset == 0 {
                                refresh.startOffset = reader.frame(in: .global).minY
                            }

                            refresh.offset = reader.frame(in: .global).minY

                            if refresh.offset - refresh.startOffset > 80 && !refresh.started {
                                refresh.started = true
                            }
                            if refresh.startOffset == refresh.offset && refresh.started && !refresh.released {
                                withAnimation(Animation.linear){refresh.released = true}
                                updateData()
                            }
                            if refresh.startOffset == refresh.offset && refresh.started && !refresh.released && refresh.invalid {
                                refresh.invalid = false
                                updateData()
                            }
                        }
                        return AnyView(Color.black.frame(width: 0, height: 0))
                    }
                    .frame(width: 0, height: 0)
                    
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        if refresh.started && refresh.released {
                            ProgressView()
                                .offset(y: -35)
                        } else {
                            Image(systemName: "arrow.down")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.white)
                                .rotationEffect(.init(degrees: refresh.started ? 180 : 0))
                                .offset(y: -25)
                                .animation(.easeIn)
                        }
                        
                        VStack {
                            // profileCard
                            VStack {
                                VStack(alignment: .leading,spacing: 16) {
                                    HStack(spacing: 16) {
                                        if let imageData = user.image {
                                            let uiimage = UIImage(data: imageData)
                                            Image(uiImage: uiimage!)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width:66)
                                                .clipShape(Circle())
                                        } else {
                                            ZStack {
                                                Circle()
                                                    .foregroundColor(Color("pink-gradient-1"))
                                                    .frame(width: 66, height: 66, alignment: .center)
                                                Image(systemName: "person.fill")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 24, weight: .medium, design: .rounded))
                                            }
                                            .frame(width: 66, height: 66, alignment: .center)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text(((user.sub == nil ? "Who Are You?": user.username) ?? ""))
                                                .foregroundColor(.white)
                                                .font(.title2)
                                                .bold()
                                        }
                                        Spacer()
                                        
                                        if user.sub != nil {
                                            Button(action:{
                                                showSettings.toggle()
                                            }, label: {
                                                TextfieldIcon(iconName:"gearshape.fill", passedImage: .constant(nil), currentlyEditing: .constant(true))
                                            })
                                            .sheet(isPresented:$showSettings , content: {
                                                NavigationView {
                                                    SettingsView()
                                                }
                                            })
                                        }
                                    }
                                    
                                    Rectangle()
                                        .frame(height:1)
                                        .foregroundColor(.white.opacity(0.1))
                                    
                                    Text(user.description ?? "")
                                        .foregroundColor(.white)
                                        .font(.title2.bold())
                                    
                                    Label("a", systemImage: "calendar")
                                        .foregroundColor(.white.opacity(0.7))
                                        .font(.footnote)
                                    
                                    Rectangle()
                                        .frame(height:1)
                                        .foregroundColor(.white.opacity(0.1))
                                    
                                    HStack(spacing: 16){
                                        Image("Twitter")
                                            .resizable()
                                            .foregroundColor(.white).opacity(0.7)
                                            .frame(width: 24, height: 24, alignment: .center)
                                        Image(systemName: "link")
                                            .foregroundColor(.white)
                                            .opacity(0.7)
                                            .font(.system(size: 17, weight: .semibold, design:.rounded))
                                        Text("company")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.footnote)
                                        
                                    }
                                }
                                .padding(16)
                                
                                Button(action:{
                                    Amplify.Auth.signOut() { result in
                                        switch result {
                                        case .success:
                                            DispatchQueue.main.async {
                                                print("Successfully signed out")
                                                self.user.isLogged = false
                                                self.user.sub = ""
                                                user.resetAllPublished()
                                                UserDefaults.standard.removeAll()
                                                print(user.localFavs)
                                                print(user.sub)
                                            }
                                        case .failure(let error):
                                            print("Sign out failed with error \(error)")
                                        }
                                    }
                                    self.tabSelection = 1
                                }, label: {
                                    GradientText(text:"text")
                                        .font(.footnote.bold())
                                })
                                .padding(.bottom)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white.opacity(0.2))
                                    .background(Color("secondaryBackground").opacity(0.5))
                                    .background(VisualEffectBlur(blurStyle: .dark))
                                    .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
                            )
                            .cornerRadius(30)
                            .padding()
                            
                            if user.isLogged {
    //                            ScrollView(.horizontal, showsIndicators: false){
    //                                HStack(spacing: 30){
                                        if (user.myRecipes.count >= 1) {
                                            NavigationLink(
                                                destination:
                                                RecipeDetail(recipe: user.myRecipes[index], editable: true, isFirstViewActive: self.$isActive)
                                                ,isActive: $isActive
                                            ) {
                                                EmptyView()
                                            }
                                            .isDetailLink(false)
                                            
                                            ForEach(0...user.myRecipes.count-1,id: \.self) { i in
                                                if let recipe = user.myRecipes[i] {
    //                                                NavigationLink(
    //                                                    destination:RecipeDetail(recipe: recipe, editable: true
    //                                                                             , isFirstViewActive: self.$isActive
    //                                                                            )
    //                                                    ,isActive: $isActive
    //                                                ) {
//                                                        SectionView(
//                                                            recipe: recipe,
//                                                            header: user.imageDatum[recipe.id] ?? Data(),
//                                                            profile: user.userDatum[recipe.id] ?? Data()
//                                                        )
                                                        PostView(
                                                            recipe: recipe,
                                                            header: user.imageDatum[recipe.id] ?? Data(),
                                                            profile: user.image ?? Data(),
                                                            username: user.username ?? ""
                                                        )
                                                        .onTapGesture{
                                                            print("section view")
                                                            self.index = i
                                                            self.isActive = true
                                                        }
                                                        .onAppear {
                                                            // 最低３つないといけない
                                                            if i == user.myRecipes.count - 1 {
                                                                if (!user.token.isEmpty) {
                                                                    user.listNextPage(nextToken: user.token)
                                                                }
                                                            }
                                                        }
    //                                                }
    //                                                .isDetailLink(false)
                                                }
                                                
                                            }
                                            
                                            
    //                                        Button {} label: {
    //                                            NavigationLink(
    //                                                destination: UserRecipeList(
    //                                                    isFirstViewActive: self.$isActive
    //                                                )
    //                                                ,isActive: self.$isActive
    //                                            ) {
    //                                                Image(systemName: "ellipsis.circle.fill")
    //                                                    .font(.system(size: 32, weight: .medium))
    //                                                    .frame(width: 32, height: 32)
    //                                                    .foregroundColor(.primary)
    //                                                    .onTapGesture{
    //                                                        print("profile view elipsis")
    //                                                        self.isActive = true
    //                                                    }
    //                                            }
    //                                            .isDetailLink(false)
    //                                        }
    //                                        .padding(.trailing)
                                        }
    //                                }
    //                                .padding(.horizontal)
    //                                .onAppear{
    //                                    print("user.recentRecipes")
    //                                    print(user.recentRecipes)
    //                                }
    //                            }

                                VStack {
                                    Button {
                                        print("tap signout")
                                        Amplify.Auth.signOut() { result in
                                            switch result {
                                            case .success:
                                                DispatchQueue.main.async {
                                                    print("Successfully signed out")
                                                    user.resetAllPublished()
                                                    UserDefaults.standard.removeAll()
                                                    print(user.localFavs)
                                                    print(user.sub)
                                                }
                                            case .failure(let error):
                                                print("Sign out failed with error \(error)")
                                            }
                                        }
                                        self.tabSelection = 1
                                    } label: {
                                        HStack(spacing: 12) {
                                            Image(systemName: "person.crop.circle")
                                                .foregroundColor(.primary)
                                                .font(.system(size: 16, weight: .medium))
                                                .frame(width: 36, height: 36)
                                                .background(Color("background3"))
                                                .clipShape(Circle())
                                                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                                            GradientText(text: "Sign Out")
                                            Spacer()
                                        }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16, style: .circular)
                                                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                                        )
                                        .background(
                                            Color.init(red: 26/255, green: 20/255, blue: 51/255)
                                                .cornerRadius(16)
                                        )
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .offset(y: refresh.released ? 40 : -20)
                }
                .navigationBarHidden(true)
               
            // end of navigationView
            }
        }
        .navigationBarHidden(true)
        .colorScheme(.dark)
    }
}

struct ProfileView_Previews: PreviewProvider {
    // for debug
    static var previews: some View {
        ProfileView(tabSelection:.constant(4))
            .environmentObject(UserStore())
    }
}

extension UserDefaults {

    func removeAll() {
        dictionaryRepresentation().forEach{ removeObject(forKey: $0.key) }
    }
}

struct Refresh {
    var startOffset: CGFloat = 0
    var offset: CGFloat = 0
    var started: Bool
    var released: Bool
    var invalid: Bool = false
}
