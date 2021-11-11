//
//  LoadingView.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/30.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading")
                .frame(width:200,height:200)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
