//
//  UserRecipeList.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/10/07.
//

import SwiftUI

struct UserRecipeList: View {
    
    @State var isActive: Bool = false
    @Binding var isFirstViewActive : Bool
    
    @EnvironmentObject var viewmodel:UserRecipesViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(0..<viewmodel.recipes.count, id: \.self){ i in
                        let recipe = viewmodel.recipes[i]
                        ZStack {
//                            favRowView(
//                                fav: recipe,
//                                image: viewmodel.imageDatum[recipe.id] ?? Data()
//                            )
//                            .onAppear {
//                                if i == viewmodel.recipes.count - 2 {
//                                    viewmodel.listNextPage()
//                                }
//                            }
//                            .onTapGesture{
//                                UserDefaults.standard.set(i,forKey: "rowIndex")
//                            }
//                            NavigationLink(
//                                destination:RecipeDetail(
//                                    recipe: recipe,
//                                    editable: true
//                                    ,isFirstViewActive: $isFirstViewActive
//                                )
//                                ,isActive: $isActive
//                            ){
//                                HStack {}
//                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                .onTapGesture{
//                                    print("user recipe list view")
//                                    self.isActive = true
//                                }
//                            }
//                            .isDetailLink(false)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My Recipes"))
        }
        .navigationBarHidden(true)
        .onAppear {
            if viewmodel.firstLoad {
                print("first fetch data")
                viewmodel.fetchData()
            }
        }
    }
}

struct UserRecipeList_Previews: PreviewProvider {
    @State static var isFirstViewActive = false
    static var previews: some View {
        UserRecipeList(
            isFirstViewActive: $isFirstViewActive
        )
    }
}
