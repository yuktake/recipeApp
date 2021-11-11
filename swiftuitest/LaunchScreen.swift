//
//  LaunchScreen.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/09/16.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isLoading = true

    @EnvironmentObject var network:Network
    
    var body: some View {
        if isLoading || !network.connected {
            ZStack {
                Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                    .ignoresSafeArea() // ステータスバーまで塗り潰すために必要
//                Image(uiImage: #imageLiteral(resourceName: "Blob"))
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding()
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
            }
        } else {
            TabBar()
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
