//
//  SearchResultView.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/08/01.
//

import SwiftUI

struct SearchResultView: View {
    var protein:Double
    var fat:Double
    var carbo:Double
    var state:Int
    var keyword:String
    @State var nextIndex = 1
    @State var rowIndex = UserDefaults.standard.integer(forKey: "rowIndex")
    
    @EnvironmentObject var viewModel: RecipesViewModel
    
    var body: some View {
        ZStack {
//            ScrollView() {
//                LazyVStack {
////                    ForEach(viewModel.recipes, content: { recipe in
//                    ForEach(0..<viewModel.recipes.count, id: \.self) { i in
//                        let recipe = viewModel.recipes[i]
//                        NavigationLink(destination:RecipeDetail(recipe:recipe,editable: false)){
//                            // rowviewで独立させてfavと併用させるべき
//                            favRowView(fav: recipe, image:viewModel.imageDatum[recipe.image] ?? Data())
//                                .onAppear {
//                                    if i == viewModel.recipes.count - 2 {
//                                        viewModel.listNextPage()
//                                    }
//                                }
//                                .onTapGesture{
//                                    UserDefaults.standard.set(i,forKey: "rowIndex")
//                                }
//                        }
//                    }
//                }
//            }
//            .padding(.top)
        }
        .onAppear{
            
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(protein: 0.0, fat: 0.0, carbo: 0.0, state: 2,keyword: "")
    }
}
