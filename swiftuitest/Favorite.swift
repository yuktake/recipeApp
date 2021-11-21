//
//  Favorite.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI

struct Favorite: View {
    @State var isActive : Bool = false
    @EnvironmentObject var store:UserStore
    @Namespace var animation
    
    @State var show = false
    @State var selectedId = ""
    @State var selectedImage = Data()
    
    var body: some View {
        ZStack {
            NavigationView{
                ScrollView {
                    if self.store.isLogged {
                        if (store.favRecipes.count >= 1) {
                            LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) { // カラム数の指定
                                ForEach(0...store.favRecipes.count-1,id: \.self) { i in
                                    ZStack {
                                        if let fav = store.favRecipes[i] {
                                            favTmpView(
                                                id: fav.id,
                                                image: store.favImageDatum[fav.id] ?? Data(),
                                                animation: animation
                                            )
                                            .onAppear{
                                                if store.isLogged {
                                                    if i == store.favRecipes.count - 2 {
                                                       store.getFavsFromServerNextPage(nextToken: self.store.favToken)
                                                   }
                                                }
                                            }
                                            .onTapGesture {
                                                withAnimation(.spring()){
                                                    show.toggle()
                                                    selectedId = fav.id
                                                    selectedImage = store.favImageDatum[fav.id] ?? Data()
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Favorite"))
            }
            .opacity(show ? 0 : 1)
            .onAppear {
                print("favorite")
                print(selectedId)
            }
            
            if show {
                FavoriteDetail(
                    show: $show,
                    header: $selectedImage,
                    animation: animation,
                    selectedId: selectedId
                )
                .ignoresSafeArea(.all)
            }
            
        }
        .navigationBarHidden(true)
        .onAppear {

        }
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Favorite()
    }
}

struct favTmpView: View {
    var id:String
    var image:Data
    var animation: Namespace.ID
    var body: some View {
        if let image = UIImage(data:image) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .matchedGeometryEffect(id: "fav\(id)", in: animation)
                .background(Color.black)
                .cornerRadius(20)
        } else {
            LottieView(filename: "search")
                .frame(width:80, height: 80)
        }
    }
}
