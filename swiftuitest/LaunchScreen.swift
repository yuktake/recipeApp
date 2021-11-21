//
//  LaunchScreen.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/09/16.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isLoading = true
    
    @State var isShowTutorialView: Bool = false
    @State var offset: CGFloat = 0
    @State var currentIndex = 0

    @EnvironmentObject var network:Network
    
    func firstVisitSetup(){
        let visit = UserDefaults.standard.bool(forKey: "visit")
        if visit{
            print("Access More Than Once")
            UserDefaults.standard.set(false, forKey: "visit")
        }else{
            print("First Access")
            self.isShowTutorialView.toggle()
            UserDefaults.standard.set(true, forKey: "visit")
        }
    }
    
    var body: some View {
        if isLoading || !network.connected {
            ZStack {
                Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                    .ignoresSafeArea() // ステータスバーまで塗り潰すために必要
                LottieView(filename: "splash")
                    .frame(width:200, height: 200)
                    .cornerRadius(20)
                    .padding(.horizontal, 4)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        isLoading = false
                    }
                }
                firstVisitSetup()
            }
        } else if (isShowTutorialView) {
            GeometryReader { proxy in
                let size = proxy.size
                VStack {
                    OffsetPageTabView(offset: $offset) {
                        HStack {
                            ForEach(0..<3) { _ in
                                VStack {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: size.height / 3)
                                    
                                    VStack(alignment: .leading, spacing: 22) {
                                        Text("Title")
                                            .font(.largeTitle.bold())
                                        
                                        Text("Description")
                                            .fontWeight(.semibold)
                                            .foregroundColor(.secondary)
                                    }
                                    .foregroundStyle(.white)
                                    .padding(.top, 50)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding()
                                .frame(width: size.width)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    
                    HStack(alignment: .bottom) {
                        HStack(spacing: 12) {
                            ForEach(intros.indices, id: \.self) { index in
                                Capsule()
                                    .fill(.white)
                                    .frame(width: getIndex(screenWidth: size.width) == index ? 20 : 7, height: 7)
                            }
                        }
                        .overlay(
                            Capsule()
                                .fill(.white)
                                .frame(width: 20, height: 7)
                                .offset(x: getIndicatorOffset(screenWidth: size.width))
                            ,alignment: .leading
                        )
                        .offset(x: 10, y:-15)
                        
                        
                        Spacer()
                        Button {
                            let index = min(getIndex(screenWidth: size.width) + 1, intros.count-1)
                            if (self.currentIndex == intros.count-1) {
                                print("last one")
                                // toggle
                                self.isShowTutorialView = false
                            }
                            self.currentIndex = index
                            offset = CGFloat(index) * size.width
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .padding(20)
                                .background(
                                    intros[getIndex(screenWidth: size.width)].color,
                                    in:Circle()
                                )
                        }
                    }
                    .padding()
                    .offset(y: -20)
                    .animation(
                        .easeInOut,
                        value:getIndex(screenWidth: size.width)
                    )
                }
            }
        } else {
            TabBar()
        }
    }
    
    func getIndicatorOffset(screenWidth: CGFloat) -> CGFloat {
        let progress = offset / screenWidth
        let maxWidth: CGFloat = 12 + 7
        return progress * maxWidth
    }
    
    func getIndex(screenWidth:CGFloat) -> Int {
        let progress = round(offset/screenWidth)
        let index = min(Int(progress), intros.count-1)
        return index
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
