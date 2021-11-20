//
//  Home.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Amplify

struct Home: View {
//    @Binding var tabSelection: Int
    @State var isLogin = false
    @State var showModal = false
    
    @State var index: Int = 0
    @State var isActive : Bool = false
    //　本当はtrendとpoplular
//    @EnvironmentObject var fav:FavStore
    @EnvironmentObject var user:UserStore
    @EnvironmentObject var network:Network
    
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
    @Namespace var animation
    
    @ViewBuilder
    func DetailPage()-> some View {
        ZStack {
            if let currentCard = currentCard,showDetailPage {
                if let data = user.imageDatum[currentCard.id] {
                    if let image = UIImage(data: data) {
                        Image(uiImage:image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width)
                            .matchedGeometryEffect(id: currentCard.id, in: animation)
                            .ignoresSafeArea()
                    } else {
                        Rectangle()
                            .fill(Color.orange)
                            .matchedGeometryEffect(id: currentCard.id, in: animation)
                            .ignoresSafeArea()
                    }
                } else {
                    Rectangle()
                        .fill(Color.orange)
                        .matchedGeometryEffect(id: currentCard.id, in: animation)
                        .ignoresSafeArea()
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Button {
                        withAnimation(.spring()) {
                            showDetailPage = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Text(currentCard.create_at)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.top)

                    Text(currentCard.title)
                        .font(.title.bold())

                    ScrollView(.vertical, showsIndicators: false) {
                        Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n")
                    }
                }
                .padding()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
//            NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Today's Receipt \(network.connected ? "connected" : "not connected")")
                            .font(.system(size: 28,weight: .bold))
                        Spacer()
                        AvatarView(showModal: $showModal)
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                    if user.isLogged && user.myRecipes.count >= 1 {
                        GeometryReader{proxy in
                            let size = proxy.size
                            let trailingCardsToShown: CGFloat = 2
                            let trailingSpaceofEachCards: CGFloat = 20
                            ZStack {
                                ForEach(user.myRecipes) { card in
                                    InfiniteStackedCardView(
                                        cards: $user.myRecipes,
                                        card: card,
                                        header: user.imageDatum[card.id],
                                        trailingCardsToShown: trailingCardsToShown,
                                        trailingSpaceofEachCards: trailingSpaceofEachCards,
                                        animation:animation,
                                        showDetailPage: $showDetailPage
                                    )
                                        .onTapGesture {
                                            withAnimation(.spring()) {
                                                currentCard = card
                                                showDetailPage = true
                                            }
                                        }
                                }
                            }
                            .padding(.leading, 10)
                            .padding(.trailing,(trailingCardsToShown*trailingSpaceofEachCards))
                            .frame(height: size.height / 1.6)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                        }
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                        .padding(.bottom, 32)
                    }
                    
                    if user.isLogged && user.myRecipes.count >= 1 {
                        NavigationLink(
                            destination:
                            RecipeDetail(recipe: user.myRecipes[index], editable: false, isFirstViewActive: self.$isActive)
                            ,isActive: $isActive
                        ) {
                            EmptyView()
                        }
                        ForEach(0...user.myRecipes.count-1,id: \.self) { i in
                            if let recipe = user.myRecipes[i] {
                                GeometryReader{geo -> AnyView? in
                                    AnyView(
                                        ZStack{
                                            if let image = UIImage(data:user.imageDatum[recipe.id] ?? Data()) {
                                                Image(uiImage:image)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width:self.SVWidth, height: self.itemHeight)
                                                    .clipped()
//                                                    .background(Color.white)
//                                                    .foregroundColor(Color.green)
                                            }

                                            Button(action: {
                                                self.expandedItem = recipe
                                                self.index = i
                                                let x = geo.frame(in: .global).minX
                                                let y = geo.frame(in: .global).minY
                                                let thisRect = CGRect(x: x,
                                                                      y: y,              width:self.SVWidth,
                                                                      height: self.itemHeight)
                                                self.expandedScreen_returnPoint = thisRect
                                                self.expandedScreen_startPoint =  thisRect



                                                self.expandedItem = recipe

                                                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) {
                                                    (timer) in
                                                    self.expandedScreen_shown = true
                                                    self.expandedScreen_startPoint =  CGRect(x: 0,
                                                                                             y: 0,                                                                                    width:UIScreen.main.bounds.size.width,
                                                                                             height: UIScreen.main.bounds.size.height)
                                                }
                                            }) {
                                                VStack{
                                                    HStack{
                                                        VStack(alignment: .leading){
                                                            Text("\(recipe.title)"
                                                            )
                                                                .font(.system(size: 18, weight: .bold, design: .default))
                                                                .foregroundColor(.init(red: 0.8, green: 0.8, blue: 0.8)).opacity(0.6)
                                                            Text("\(recipe.title)")
                                                                .font(.system(size: 36, weight: .bold, design: .default))
                                                        }.padding()
                                                        Spacer()
                                                    }
                                                    Spacer()
                                                    HStack{

                                                        VStack(alignment: .leading){
                                                            Text("\(recipe.title)")
                                                                .lineLimit(2)
                                                                .font(.system(size: 18, weight: .bold, design: .default))
                                                                .foregroundColor(.init(red: 0.9, green: 0.9, blue: 0.9)).opacity(0.8)

                                                        }.padding()
                                                        Spacer()
                                                    }
                                                }.frame(width: self.SVWidth)}


                                        }
                                        .cornerRadius(15).foregroundColor(.white)
                                        .shadow(color: .init(red: 0.1, green: 0.1, blue: 0.1), radius: 11 , x: 0, y: 4)
                                    )
                                }.background(Color.clear.opacity(0.4)).frame(height:self.itemHeight)
//                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                    .padding(.bottom, 20)
                            }
                        }
                        .coordinateSpace(name: "forEach")
                    }
                    
                }
                
                .padding()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
//                .frame(height: UIScreen.main.bounds.height)
//                .overlay(
//                    DetailPage()
//                )
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
            GeometryReader{geo -> AnyView in
                let baselineOffset_x = UIScreen.main.bounds.width/2
                let thisItem = self.expandedItem
                 AnyView(
                    ZStack{
                        ScrollView{
                            VStack(spacing:0){
                                ZStack{
                                    if let image = UIImage(data:user.imageDatum[thisItem.id] ?? Data()) {
                                        Image(uiImage:image)
                                            .resizable()
                                            .scaledToFill()
                                            .offset(y: self.expandedScreen_shown ? 0 : 0)
                                            .frame(width:
                                                self.expandedScreen_shown ? UIScreen.main.bounds.width : self.SVWidth

                                                , height:
                                                self.itemHeight
                                        )
                                            .clipped()
                                            .background(Color.white)
                                            .foregroundColor(Color.green)
                                            .edgesIgnoringSafeArea(.top)
                                    }

                                    VStack{
                                        HStack{

                                            VStack(alignment: .leading){
                                                Text("\(thisItem.title)")
                                                    .font(.system(size: 18, weight: .bold, design: .default))
                                                    .foregroundColor(.init(red: 0.8 , green: 0.8, blue: 0.8  )).opacity(1.0)
                                                Text("\(thisItem.title)")
                                                    .font(.system(size: 36, weight: .bold, design: .default))
                                                    .foregroundColor(.white)
                                            }.padding()
                                            Spacer()
                                        }.offset(y:
                                            self.expandedScreen_shown ? 44 : 0)
                                        Spacer()
                                        HStack{

                                            VStack(alignment: .leading){
                                                Text("\(thisItem.title)")
                                                    .lineLimit(2)
                                                    .font(.system(size: 18, weight: .bold, design: .default))
                                                    .foregroundColor(.init(red: 0.9, green: 0.9, blue: 0.9)).opacity(0.8)

                                            }.padding()
                                            Spacer()
                                        }
                                    }.frame(width: self.expandedScreen_startPoint.width)


                                }.frame(height:
                                        self.itemHeight
                                ).zIndex(1)

                                Button(action: {
                                    self.isActive = true
                                }, label: {
                                    Text("詳しく見る")
                                        .padding()
                                        .frame(
                                            maxHeight: self.expandedScreen_shown ? .infinity : 0
                                        )
                                        .frame(width: self.expandedScreen_shown ? UIScreen.main.bounds.width : 0)
                                        .foregroundColor(Color.black)
                                        .background(Color.white)
                                })
                            }

                        }
                        .frame(width: self.expandedScreen_startPoint.width, height: self.expandedScreen_startPoint.height)
                        .background(Color.clear)
                        .cornerRadius(self.expandedScreen_shown ? 0 : 15 )
                        .animation(.easeInOut(duration: self.expandedScreen_shown ? 0.3 : 0.3))
                        .offset(x: self.expandedScreen_startPoint.minX, y: self.expandedScreen_startPoint.minY)

                        Button(action: {
                            self.expandedScreen_willHide = true
                            self.expandedScreen_startPoint = self.expandedScreen_returnPoint

                            self.expandedScreen_shown = false
                            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
                                self.expandedScreen_willHide = false
                            }
                        }){

                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.init(white: 0.9))
                                        .font(.system(size: 25)).padding()
                                        .opacity(self.expandedScreen_shown ? 1 : 0.0)
                                            .animation(
                                                Animation.easeInOut(duration: 0.3)

                                        )

                        }.offset(x: (UIScreen.main.bounds.width/2) - 30, y: (-1 * UIScreen.main.bounds.height/2) + 60)

                    }

                )
            }.edgesIgnoringSafeArea(.top)
                .opacity(self.expandedScreen_shown ? 1 : 0.0)
                .animation(
                    Animation.easeInOut(duration: 0.05)
                        .delay(self.expandedScreen_willHide ? 0.5 : 0)
            )
            
            DetailPage()

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
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserStore())
    }
}

struct SectionView: View {
    var recipe: RecipeData
    var header: Data
    var profile: Data
    
    var body: some View {
        VStack {
            HStack{
                Text(recipe.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                if let image = UIImage(data: profile) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .background(Color.black)
                        .cornerRadius(20)
                        .padding(.horizontal, 4)
                }
            }
            Text(recipe.title.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let image = UIImage(data:header) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 230, height: 150)
                    .background(Color.black)
                    .cornerRadius(20)
                    .padding(.horizontal, 4)
            }
        }
        .padding(20)
        .frame(width: 275, height: 275)
        .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
        .cornerRadius(30)
        .shadow(color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct PostView: View {
    var recipe: RecipeData
    var header: Data
    var profile: Data
    var username: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
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
                    Text(recipe.create_at).font(.subheadline)
                }
                .padding(.leading, 8)
            }
            .padding(.leading, 16)
            .padding(.top, 16)
            
            Text(recipe.title)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 32)
            
            if let image = UIImage(data:header) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
//        .padding(.leading, -20)
        .padding(.bottom, -8)
    }
}

struct InfiniteStackedCardView: View {
    @Binding var cards: [RecipeData]
    var card: RecipeData
    var header: Data?
    var trailingCardsToShown: CGFloat
    var trailingSpaceofEachCards: CGFloat
    var animation: Namespace.ID
    @Binding var showDetailPage: Bool
    
    @GestureState var isDragging: Bool = false
    @State var offset: CGFloat = .zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(card.create_at)
                .font(.caption)
                .fontWeight(.semibold)
            
            Text(card.title)
                .font(.title.bold())
                .padding(.top)
            Spacer()
            
            Label {
                Image(systemName: "arrow.right")
            } icon: {
                Text("Read More")
            }
            .font(.system(size:15, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .padding(.vertical,10)
        .foregroundColor(.white)
        .background(
            ZStack {
                if showDetailPage {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.gray)
                } else {
                    if let image = UIImage(data:header ?? Data()) {
                        Image(uiImage:image)
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(25)
//                          .frame(width:self.SVWidth, height: self.itemHeight)
                            .clipped()
                    } else {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.orange)
                            .matchedGeometryEffect(id: card.id, in: animation)
                    }
                }
            }
        )
        .padding(.trailing, -getPadding())
        .padding(.vertical,getPadding())
        .zIndex(Double(CGFloat(cards.count) - getIndex()))
        .rotationEffect(.init(degrees: getRotation(angle: 10)))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .offset(x: offset)
        .gesture(
            DragGesture()
                .updating($isDragging, body: { _, out, _ in
                    out = true
                })
                .onChanged({value in
                    var translation = value.translation.width
                    translation = cards.first?.id == card.id ? translation : 0
                    translation = isDragging ? translation : 0
                    translation = (translation < 0 ? translation : 0)
                    offset = translation
                })
                .onEnded({value in
                    let width = UIScreen.main.bounds.width
                    let cardPassed = -offset > (width / 2)
                    withAnimation(.easeInOut(duration: 0.2)){
                        if cardPassed{
                            offset = -width
                            removeAndPutBack()
                        } else {
                            offset = .zero
                        }
                    }
                })
        )
    }
    
    func removeAndPutBack(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1){
            var updatedCard = card
            updatedCard.id = UUID().uuidString
            cards.append(updatedCard)
            
            withAnimation{
                cards.removeFirst()
            }
        }
    }
    
    func getRotation(angle: Double)->Double {
        let width = UIScreen.main.bounds.width - 50
        let progress = offset / width
        
        return Double(progress) * angle
    }
    
    func getPadding()->CGFloat {
        let maxPadding = trailingCardsToShown * trailingSpaceofEachCards
        let cardPadding = getIndex() * trailingSpaceofEachCards
        return (getIndex() <= trailingCardsToShown ? cardPadding : maxPadding)
    }
    
    func getIndex()->CGFloat {
        let index = cards.firstIndex { card in
            return self.card.id == card.id
        } ?? 0
        
        return CGFloat(index)
    }
}

//struct DetailPage: View {
//    @Binding var showDetailPage: Bool
//
//    var currentCard: RecipeData?
//    var header: Data
//    var animation:Namespace.ID
//
//    var body: some View {
//        ZStack {
//            if let currentCard = currentCard,showDetailPage {
//                if let image = UIImage(data: header ?? Data()) {
//                    Image(uiImage:image)
//                        .resizable()
//                        .scaledToFit()
//                        .matchedGeometryEffect(id: currentCard.id, in: animation)
//                        .ignoresSafeArea()
//                } else {
//                    Rectangle()
//                        .fill(Color.orange)
//                        .matchedGeometryEffect(id: currentCard.id, in: animation)
//                        .ignoresSafeArea()
//                }
//                VStack(alignment: .leading, spacing: 15) {
//                    Button {
//                        withAnimation(.spring()) {
//                            showDetailPage = false
//                        }
//                    } label: {
//                        Image(systemName: "xmark")
//                            .foregroundColor(.black)
//                            .padding(10)
//                            .background(Color.white.opacity(0.6))
//                            .clipShape(Circle())
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//                    Text(currentCard.create_at)
//                        .font(.callout)
//                        .fontWeight(.semibold)
//                        .padding(.top)
//
//                    Text(currentCard.title)
//                        .font(.title.bold())
//
//                    ScrollView(.vertical, showsIndicators: false) {
//
//                    }
//                }
//                .padding()
//                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
//            }
//        }
//    }
//}
