//
//  Detail.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/11/07.
//

import SwiftUI
import Amplify
import AWSPluginsCore

struct Detail: View {
    @Binding var selectedItem: RecipeData
    @Binding var show: Bool
    @Binding var header:Data
    var animation: Namespace.ID
    var screen = UIScreen.main.bounds.size
    var state:[Int:String] = [
        1: "減量中",
        2: "体重維持",
        3: "増量中"
    ]
    
    @EnvironmentObject var user:UserStore
    
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
        calorie: 0,
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
                    self.user.favImageDatum[selectedItem.id] = header
                    self.user.favRecipes.insert(FavData(id:selectedItem.id), at: 0)
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
                                if let firstIndex = self.user.favRecipes.firstIndex(where: {$0.id == selectedItem.id}) {
                                    self.user.favRecipes.remove(at: firstIndex)
                                }
                                self.user.favImageDatum.removeValue(forKey: selectedItem.id)
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
        tmpRecipe = selectedItem
        self.procedures = []
        Amplify.API.query(request: .getRecipeForDetail(id: selectedItem.id)) { event in
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
                        self.tmpRecipe.calorie = recipe.calorie
                        self.tmpRecipe.protein = String(recipe.protein)
                        self.tmpRecipe.fat = String(recipe.fat)
                        self.tmpRecipe.carbo = String(recipe.carbo)
                        self.tmpRecipe.state = recipe.state
                        self.tmpRecipe.materials = recipe.materials
                    }
                    procedureNum = recipe.contents?.count ?? -1
                    
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
        //　parallex
        ScrollView(showsIndicators: false, content: {
            GeometryReader { reader in
                if let image = UIImage(data:header) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: reader.frame(in: .global).minY + (UIScreen.main.bounds.height * 0.7)
                        )
                }
            }
            .frame(height: screen.height * 0.7)
            
            VStack(alignment:.leading ,spacing: 15) {
                VStack {
                    HStack {
                        Text(selectedItem.title)
                            .font(.system(size:35,weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                        VStack {
                            if user.isLogged {
                                Button(
                                    action:{
                                        self.changing = true
                                        if self.user.favRecipes.contains(where: {$0.id == selectedItem.id}) {
                                            self.deleteFav(recipeId: selectedItem.id)
                                        } else {
                                            self.addFav(recipeId: selectedItem.id)
                                        }
                                    }, label: {
                                        Image(systemName: favorite ? "heart.fill":"heart")
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                    }
                                )
                                .disabled(changing)
                            }
                            Text("\(selectedItem.calorie)kcal")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                    HStack {
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
                    
                    HStack(spacing: 15) {
                        VStack {
                            HStack {
                                Text(selectedItem.protein)
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
                                Text(selectedItem.fat)
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
                                Text(selectedItem.carbo)
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
                }
                .frame(height: screen.height * 0.2)
                
                
                Text("材料")
                    .font(.system(size:20,weight: .bold))
                    .foregroundColor(.white)
                
                Text(selectedItem.materials)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                    .padding(.top,5)
                
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
                                .frame(width: screen.width*0.8, alignment: .topLeading)
                        }
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
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical,25)
            .padding(.horizontal)
            .background(.black)
            .cornerRadius(20)
            .offset(y: -35)
        })
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .overlay(
            Button(action: {
                // closing
                withAnimation(.spring()){
                    show = false
                }
            }) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.leading,25)
                    .padding(.top,25)
            }
            ,alignment: .topLeading
        )
        .onAppear{
//            self.favorite = self.user.favRecipes.contains(where: {$0.id == selectedItem.id}) ? true : false
            if user.isLogged {
                self.getFav(recipeId: selectedItem.id)
            }
            
            if (self.procedures.count == 0) {
                load(updated: false)
            }
        }
    }
}
