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
    
    var body: some View {
        NavigationView{
            ScrollView(){
//                ForEach(store.fav.keys.sorted(),id: \.self){ key in
//                    ZStack {
//                        favRowView(
//                            fav: store.fav[key]!,
//                            image: store.favImageDatum[key] ?? Data(),
//                            animation: animation
//                        )
//                        NavigationLink(
//                            destination:RecipeDetail(
//                                recipe:store.fav[key]!,
//                                editable: false
//                                , isFirstViewActive: $isActive
//                            )
//                            ,isActive: self.$isActive
//                        ){
//                            HStack {}
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .onTapGesture {
//                                print("favorite view")
//                                self.isActive = true
//                            }
//                        }
//                        .isDetailLink(false)
//                    }
//                }
                
//                ForEach(0...store.fav.count){ index in
                
//                ForEach(store.fav.indices, id: \.self) { index in
//                    ZStack {
//                        favRowView(
//                            fav: store.fav[index],
//                            image: store.favImageDatum[store.fav[index].id] ?? Data(),
//                            animation: animation
//                        )
//                        .onAppear{
//                            if index == store.fav.count - 2 {
//                                store.getFavsFromServerNextPage(nextToken: self.store.favToken)
//                            }
//                        }
//                        NavigationLink(
//                            destination:RecipeDetail(
//                                recipe:store.fav[index],
//                                editable: false
//                                , isFirstViewActive: $isActive
//                            )
//                            ,isActive: self.$isActive
//                        ){
//                            HStack {}
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .onTapGesture {
//                                print("favorite view")
//                                self.isActive = true
//                            }
//                        }
//                        .isDetailLink(false)
//                    }
//                }
                
//                ForEach(store.fav.keys.sorted(),id: \.self){ key in
//                ForEach(store.localFavs.keys.sorted(),id: \.self){ key in
//                ForEach(store.favArray,id: \.self){ key in
                
                if self.store.isLogged {
                    if (store.favRecipes.count >= 1) {
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) { // カラム数の指定
                            ForEach(0...store.favRecipes.count-1,id: \.self) { i in
                                ZStack {
                                    if let fav = store.favRecipes[i] {
            //                            favRowView(
                                        ////                            fav: store.fav[key]!,
                                        //                            fav: store.localFavs[key],
                                        //                            image: store.favImageDatum[key] ?? Data(),
                                        //                            animation: animation
                                        //                        )
                                                                favTmpView(
                                        //                            id: store.localFavs[key] ?? "",
                                                                    id: fav.id,
                                                                    image: store.favImageDatum[fav.id] ?? Data(),
                                                                    animation: animation
                                                                )
                                                                .onAppear{
            //                                                        if index == store.fav.keys.count - 2 {
            //                                                            store.getFavsFromServerNextPage(nextToken: self.store.favToken)
            //                                                        }
                                                                    if store.isLogged {
                                                                        if i == store.favRecipes.count - 2 {
                                                                           store.getFavsFromServerNextPage(nextToken: self.store.favToken)
                                                                       }
                                                                    }
                                                                }
                                        //                        NavigationLink(
                                        //                            destination:RecipeDetail(
                                        //                                recipe:store.fav[key]!,
                                        //                                editable: false
                                        //                                , isFirstViewActive: $isActive
                                        //                            )
                                        //                            ,isActive: self.$isActive
                                        //                        ){
                                        //                            HStack {}
                                        //                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        //                            .onTapGesture {
                                        //                                print("favorite view")
                                        //                                self.isActive = true
                                        //                            }
                                        //                        }
                                        //                        .isDetailLink(false)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Favorite"))
        }
        .navigationBarHidden(true)
        .onAppear {
//            self.store.fav = self.store.fav.sorted(by: { lRecipe, rRecipe -> Bool in
//                return lRecipe.create_at > rRecipe.create_at
//            })
//            self.store.fav.forEach{ fav in
//                print("sorted fav")
//                print(fav.id)
//            }
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
                .matchedGeometryEffect(id: "image\(id)", in: animation)
//                .frame(width: 80, height: 80)
                .background(Color.black)
//                .cornerRadius(20)
//                .padding(.horizontal, 4)
//                .padding(.bottom, 8)
        } else {
            LottieView(filename: "search")
                .frame(width:80, height: 80)
//                .cornerRadius(20)
//                .padding(.horizontal, 4)
//                .padding(.bottom, 8)
        }
    }
}

struct favRowView: View {
    var fav:RecipeData
    var image:Data
    var animation: Namespace.ID
    var body: some View {
        HStack {
            if let image = UIImage(data:image) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(fav.id)", in: animation)
                    .frame(width: 80, height: 80)
                    .background(Color.black)
                    .cornerRadius(20)
                    .padding(.horizontal, 4)
            } else {
                LottieView(filename: "search")
                    .frame(width:80, height: 80)
                    .cornerRadius(20)
                    .padding(.horizontal, 4)
            }
            
            VStack(alignment: .leading, spacing: 8.0){
                Text(fav.title)
                    .font(.system(size: 20,weight: .bold))
                    .matchedGeometryEffect(id: "title\(fav.id)", in: animation)
                HStack {
                    Image(systemName: "p.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width:22, height: 22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                        .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                    Text("\(fav.protein)g")
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    Spacer()
                    Image(systemName: "f.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width:22, height: 22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                        .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                    Text("\(fav.fat)g")
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    Spacer()
                    Image(systemName: "c.circle.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                        .frame(width:22, height: 22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                        .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                    Text("\(fav.carbo)g")
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    Spacer()
                }
                Text(fav.create_at)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.bottom, 8)
    }
}
