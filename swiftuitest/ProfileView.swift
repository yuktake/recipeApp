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
            favNum: recipe.favNum,
            reviewNum: 0,
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
                                }
                                
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
                            .padding()
                        }
                        
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white.opacity(0.2))
                            .background(VisualEffectBlur(blurStyle: .dark))
                    )
                    .cornerRadius(30)
                    .padding()
                    
                    if user.isLogged {
                        if (user.myRecipes.count >= 1) {
                            ScrollView(showsIndicators: false) {
                                LazyVGrid(columns: Array(repeating: GridItem(spacing:0), count: 3), spacing: 0) {
                                    ForEach(0...user.myRecipes.count-1,id: \.self) { i in
                                        ZStack {
                                            if let recipe = user.myRecipes[i] {
                                                favCellView(
                                                    id: recipe.id,
                                                    image: user.imageDatum[recipe.id] ?? Data(),
                                                    animation: animation
                                                )
                                                .onAppear{
                                                    if i == user.myRecipes.count - 1 {
                                                        if (!user.token.isEmpty) {
                                                            user.listNextPage(nextToken: user.token)
                                                        }
                                                    }
                                                }
                                                .onTapGesture {
                                                    withAnimation(.spring()){
                                                        showDetail = true
                                                        index = i
                                                        currentImage = user.imageDatum[recipe.id] ?? Data()
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            
            if showDetail {
                Detail(
                    selectedItem: $user.myRecipes[index],
                    show: $showDetail,
                    header: $currentImage,
                    animation: animation,
                    overlay: true,
                    toProfile: false
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
