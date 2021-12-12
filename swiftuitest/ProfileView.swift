//
//  Profile.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Amplify

struct ProfileView: View {
    @State var showSettings:Bool = false
    @Binding var tabSelection: Int
    @EnvironmentObject var user: UserStore

    @State var index: Int = 0
    @State var currentImage: Data = Data()
    @State var showModal: Bool = false
    @State var showAlert: Bool = false
    @State var showDetail: Bool = false
    @State var refresh = Refresh(started: false, released: false)
    
    @Namespace var animation
    
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
    
    func deleteRecipe() {
        let recipe = user.myRecipes[index]
        let amplifyRecipe = Recipe(
            id: recipe.id,
            user: recipe.userId,
            type: "Recipe",
            title: recipe.title,
            calorie: Int(recipe.calorie) ?? 0,
            protein: Double(recipe.protein) ?? 0.0,
            fat: Double(recipe.fat) ?? 0.0,
            carbo: Double(recipe.carbo) ?? 0.0,
            state: recipe.state,
            materials: recipe.materials,
            image: recipe.image,
            favNum: recipe.favNum,
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
                    // myRecipesから削除する
                    DispatchQueue.main.async {
                        user.myRecipes.remove(at: index)
                    }
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
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
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
                                HStack {
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
                                                .frame(width: 66, height: 66, alignment: .center)
                                            Image(systemName: "person.fill")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium, design: .rounded))
                                        }
                                        .frame(width: 66, height: 66, alignment: .center)
                                    }
                                    
                                    VStack {
                                        Text(((user.sub == nil ? "Who Are You?": user.username) ?? ""))
                                            .foregroundColor(.white)
                                            .font(.title3)
                                            .bold()
                                            .frame(maxWidth: .infinity)
                                    }
                                    .frame(maxWidth: .infinity)
                                    
                                    Spacer()
                                    
                                    if user.sub != nil {
                                        Button(action:{
                                            showSettings.toggle()
                                        }, label: {
                                            TextfieldIcon(iconName:"gearshape.fill", passedImage: .constant(nil), currentlyEditing: .constant(true))
                                        })
                                        .sheet(isPresented:$showSettings , content: {
                                            SettingsView()
                                        })
                                    }
                                }
                                
                                Rectangle()
                                    .frame(height:1)
                                    .foregroundColor(.white.opacity(0.1))
                                
                                Text(user.description ?? "")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                            .padding(16)
                            
                            VStack {
                                Button {
                                    print("tap signout")
                                    user.signOut()
                                    self.tabSelection = 1
                                } label: {
                                    HStack(spacing: 12) {
                                        Image(systemName: "person.crop.circle")
                                            .foregroundColor(.primary)
                                            .font(.system(size: 16, weight: .medium))
                                            .frame(width: 36, height: 36)
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
                            .padding()
                            
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white.opacity(0.2))
                                .background(VisualEffectBlur(blurStyle: .dark))
                        )
                        .cornerRadius(30)
                        .padding()
                        
                        if user.isLogged {
                            VStack {
                                Button {
                                    print("tap signout")
                                    user.signOut()
                                    self.tabSelection = 1
                                } label: {
                                    HStack(spacing: 12) {
                                        Image(systemName: "person.crop.circle")
                                            .foregroundColor(.primary)
                                            .font(.system(size: 16, weight: .medium))
                                            .frame(width: 36, height: 36)
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
                            
                            if (user.myRecipes.count >= 1) {
                                ForEach(0...user.myRecipes.count-1,id: \.self) { i in
                                    if let recipe = user.myRecipes[i] {
                                        UserView(
                                            profile: user.image ?? Data(),
                                            username: user.username ?? "",
                                            recipeId: recipe.id,
                                            i: i,
                                            index: $index,
                                            showModal: $showModal,
                                            showAlert: $showAlert,
                                            currentImage: $currentImage
                                        )
                                        PostView(
                                            recipe: recipe,
                                            header: user.imageDatum[recipe.id] ?? Data()
                                        )
                                        .onTapGesture{
                                            withAnimation(.spring()){
                                                showDetail = true
                                                index = i
                                                currentImage = user.imageDatum[recipe.id] ?? Data()
                                            }
                                        }
                                        .onAppear {
                                            // 最低３つないといけない
                                            if i == user.myRecipes.count - 1 {
                                                if (!user.token.isEmpty) {
                                                    user.listNextPage(nextToken: user.token)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .offset(y: refresh.released ? 40 : -20)
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showModal){
                RecipeEdit(
                    detail_recipe: user.myRecipes[index],
                    detail_image: $currentImage,
                    showSheet: $showModal
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
                            deleteRecipe()
                        }
                    )
                )
            }
            
            if showDetail {
                Detail(
                    selectedItem: $user.myRecipes[index],
                    show: $showDetail,
                    header: $currentImage,
                    animation: animation
                )
                .ignoresSafeArea(.all)
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

struct UserView: View {
    var profile: Data
    var username: String
    var recipeId: String
    var i: Int
    @Binding var index: Int
    @Binding var showModal: Bool
    @Binding var showAlert: Bool
    @Binding var currentImage: Data
    
    @EnvironmentObject var user: UserStore
    
    var body: some View {
        HStack {
            if let image = UIImage(data: profile) {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .clipped()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(username).font(.headline)
            }
            .padding(.leading, 8)
            
            Spacer()
            
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
                    showModal = true
                }, label: {
                    Text("編集")
                })
            } label: {
                Label(
                    title: {},
                    icon: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    }
                )
                .frame(width: 24, height: 24)
            }
            .padding(.trailing,24)
            .onTapGesture {
                withAnimation(.spring()){
                    currentImage = user.imageDatum[recipeId] ?? Data()
                    index = i
                }
            }
        }
        .padding(.leading, 16)
        .padding(.top, 16)
    }
}

struct PostView: View {
    var recipe: RecipeData
    var header: Data
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(recipe.title)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 32)
            
            if let image = UIImage(data: header) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .padding(.bottom, -8)
        Divider()
            .padding(.top)
            .foregroundColor(.white)
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
