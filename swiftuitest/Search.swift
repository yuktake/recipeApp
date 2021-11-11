//
//  Search.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct Search: View {
    @State var keyword = ""
    @State var protein:Double? = nil
    @State var fat:Double? = nil
    @State var carbo:Double? = nil
    @State var state = 2
    @State var isFocused = false
    
    @State var nextIndex = 1
    @State var rowIndex = UserDefaults.standard.integer(forKey: "rowIndex")
    
    @State var sort_state = 0
    @State var isActive : Bool = false
    @EnvironmentObject var viewModel: RecipesViewModel
    
    @Namespace var animation
    @State var show = false
    @State var index = -1
    @State var selectedImage = Data()
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func sortChange(_ tag: Int){
        viewModel.fetchData(
            protein: protein ?? 0.0,
            fat: fat ?? 0.0,
            carbo: carbo ?? 0.0,
            state: state,
            keyword: keyword,
            sort: tag
        )
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false, content: {
                        VStack {
                            HStack {
                                if (isFocused) {
                                    Button(action: {
                                        self.hideKeyboard()
                                        self.isFocused = false
                                    }){
                                        Text("Cancel")
                                            .foregroundColor(.white)
                                    }
                                } else {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                                        .frame(width:30, height: 30)
                                        .background(Color.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style:.continuous))
                                        .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                                }
                                TextField("Keyword".uppercased(), text: $keyword)
                                    .keyboardType(.default)
                                    .font(.subheadline)
                                    .padding(.horizontal)
                                    .frame(height:44)
                                    .background(Color.white)
                                    .onTapGesture {
                                        self.isFocused = true
                                    }
                            }
                            HStack {
                                VStack{
                                    Text("P")
                                        .font(
                                            .custom("BlackOpsOne-Regular",size: 60)
                                        )
                                        .frame(width:100, alignment: .center)
                                            .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                                    HStack{
                                        TextField("", value: $protein, formatter: NumberFormatter())
                                            .keyboardType(.numberPad)
                                            .font(.subheadline)
                                            .background(Color.white)
                                            .foregroundColor(.black)
                                            .padding(.vertical)
                                            .padding(.leading)
                                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                            .onTapGesture {
                                                self.isFocused = true
                                            }
                                        Text("g 以上")
                                            .padding(.trailing,8)
                                            .font(.subheadline)
                                    }
                                }
                                .background(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                                .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
                                .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y: 5)
                                .frame(height: 100)
                                .frame(maxWidth: .infinity)
                                .frame(alignment:.top)
                                    
                                Spacer()
                                VStack{
                                    Text("F")
                                        .font(
                                            .custom("BlackOpsOne-Regular",size: 60)
                                        )
                                        .frame(width:100, alignment: .center)
                                        .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                                        .background(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                                    HStack {
                                        TextField("",value: $fat, formatter: NumberFormatter())
                                            .keyboardType(.numberPad)
                                            .font(.subheadline)
                                            .background(Color.white)
                                            .foregroundColor(.black)
                                            .padding(.vertical)
                                            .padding(.leading)
                                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                            .onTapGesture {
                                                self.isFocused = true
                                            }
                                        Text("g 以下")
                                            .padding(.trailing,8)
                                            .font(.subheadline)
                                    }
                                }
                                .background(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                                .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
                                .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y: 5)
                                .frame(height: 136)
                                .frame(maxWidth: .infinity)
                                
                                Spacer()
                                
                                VStack{
                                    Text("C")
                                        .font(
                                            .custom("BlackOpsOne-Regular",size: 60)
                                        )
                                        .frame(width:100, alignment: .center)
                                        .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                                    HStack {
                                        TextField("",value: $carbo, formatter: NumberFormatter())
                                            .keyboardType(.numberPad)
                                            .font(.subheadline)
                                            .background(Color.white)
                                            .foregroundColor(.black)
                                            .padding(.vertical)
                                            .padding(.leading)
                                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                            .onTapGesture {
                                                self.isFocused = true
                                            }
                                        Spacer()
                                        Text("g以下")
                                            .padding(.trailing,8)
                                            .font(.subheadline)
                                    }
                                }
                                .background(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                                .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
                                .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y: 5)
                                .frame(height: 136)
                                .frame(maxWidth: .infinity)
                            }
                            
                            
                            Picker(selection: $state, label: Text("状態")) {
                                Text("減量中").tag(1)
                                Text("体重維持").tag(2)
                                Text("増量中").tag(3)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.top)
                            
                            LazyVStack {
                                if (viewModel.recipes.count != 0) {
                                    HStack {
                                        Spacer()
                                        Picker(
                                            selection: $sort_state.onChange(sortChange),
                                            label: Text("ソート順")
                                        ) {
                                            Text("新着順").tag(0)
                                            Text("タンパク質の多い順").tag(1)
                                            Text("脂肪の少ない順").tag(2)
                                            Text("炭水化物の少ない順").tag(3)
                                        }
                                        .pickerStyle(MenuPickerStyle())
                                    }
                                }
                                
            //                    ForEach(viewModel.recipes, content: { recipe in
                                // ??? 正しくは-1だけど初期が空なのでエラーになる
                                ForEach(0..<viewModel.recipes.count, id: \.self) { i in
                                    let recipe = viewModel.recipes[i]
                                    // rowviewで独立させてfavと併用させるべき
                                    ZStack {
                                        favRowView(
                                            fav: recipe,
                                            image:viewModel.imageDatum[recipe.id] ?? Data(),
                                            animation:animation
                                        )
                                        .onAppear {
                                            // 最低３つないといけない
                                            if i == viewModel.recipes.count - 2 {
//                                                viewModel.listNextPage()
                                                viewModel.listNextRecentPage()
                                            }
                                        }
                                        .onTapGesture{
                                            UserDefaults.standard.set(i,forKey: "rowIndex")
                                            withAnimation(.spring()){
                                                show.toggle()
                                                index = i
                                                selectedImage = viewModel.imageDatum[recipe.id] ?? Data()
                                            }
                                        }
//                                        NavigationLink(
//                                            destination:RecipeDetail(
//                                                recipe:recipe,
//                                                editable: false
//                                                , isFirstViewActive: $isActive
//                                            )
//                                            ,isActive: self.$isActive
//                                        ){
//                                            HStack {}
//                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                            .onTapGesture{
//                                                print("search view")
//                                                self.isActive = true
//                                            }
//                                        }
//                                        .isDetailLink(false)
                                    }
                                }
                            }
                            .padding(.top)
                        }
                        .padding()
                })
                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .overlay(
//                    NavigationLink(
//                        destination:SearchResultView(
//                            protein: Double(protein) ?? 0.0,
//                            fat: Double(fat) ?? 0.0,
//                            carbo: Double(carbo) ?? 0.0,
//                            state: state,
//                            keyword: keyword
//                        )
//                    ){
                    Button(action: {
                        hideKeyboard()
                        viewModel.fetchData(
                            protein: protein ?? 0.0,
                            fat: fat ?? 0.0,
                            carbo: carbo ?? 0.0,
                            state: state,
                            keyword: keyword,
                            sort: sort_state
                        )
                    }){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width:60, height: 60)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                            .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                            .padding(.horizontal)
                            .padding(.bottom)
                    }
                    ,alignment: .bottomTrailing
                )
            }
            .navigationBarHidden(true)
            .opacity(show ? 0 : 1)
            
            if show {
                Detail(
                    selectedItem: $viewModel.recipes[index],
                    show: $show,
                    header: $selectedImage,
                    animation: animation
                )
                .ignoresSafeArea(.all)
                Color.black.opacity(0.0)
                    .matchedGeometryEffect(id: "color\(viewModel.recipes[index].id)", in: animation)
            }
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
            .environmentObject(RecipesViewModel())
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}
