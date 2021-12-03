//
//  AvatarView.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/31.
//

import SwiftUI

struct AvatarView: View {
    @Binding var showModal: Bool
    @EnvironmentObject var user: UserStore
    var body: some View {
        VStack {
            if user.isLogged {
                Button(action: { self.showModal.toggle() }) {
                    if let imageData = user.image {
                        let uiimage = UIImage(data: imageData)
                        Image(uiImage: uiimage!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:44)
                            .clipShape(Circle())
                    } else {
                        ZStack {
                            Circle()
//                                .foregroundColor(Color("pink-gradient-1"))
                                .frame(width: 66, height: 66, alignment: .center)
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        }
                        .frame(width: 66, height: 66, alignment: .center)
                    }
                }
                .sheet(isPresented: $showModal){
                    MakeRecipeView()
                }
            } else {
                Button(action: { self.user.showLogin.toggle() }) {
                    Image(systemName: "person")
                        .foregroundColor(.primary)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
//                        .background(Color("background3"))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
            }
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(showModal: .constant(true))
    }
}
