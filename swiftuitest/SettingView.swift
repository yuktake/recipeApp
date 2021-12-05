//
//  SettingView.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/31.
//

import SwiftUI
import Amplify

struct SettingsView: View {
    @State var name:String = UserDefaults.standard.string(forKey: "username") ?? ""
    @State var description:String = UserDefaults.standard.string(forKey: "description") ?? ""
    @State var profile: UIImage?
    
    @State var showSheet:Bool = false
    @State var showPicker:Bool = false
    @State var cropperShown = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: UserStore
    
    func save() {
        let group = DispatchGroup()
        group.enter()
        if let imageData = profile?.jpegData(compressionQuality: 0.5) {
            let key = "users/\(user.sub!).jpg"
            DispatchQueue.main.async {
                user.image = imageData
                Amplify.Storage.uploadData(key: key, data: imageData) { result in
                    switch result {
                    case .success:
                        print("upload image success")
                        group.leave()
                    case .failure(let error):
                        print("upload data error \(error)")
                    }
                }
            }
        }

        group.enter()
        Amplify.API.query(request: .get(User.self, byId: user.sub!)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let userData):
                    guard let userData = userData else {
                        print("Could not find user")
                        return
                    }
                    print("Successfully retrieved user: \(userData)")
                    // update
                    let amplifyUser = User(
                        id: userData.id,
                        name: userData.name,
                        displayName: name,
                        email: userData.email,
                        description: description
                    )
                    Amplify.API.mutate(request: .update(amplifyUser)) { event in
                        switch event {
                        case .success(let result):
                            switch result {
                            case .success(let updatedUser):
                                print("Successfully updated user: \(updatedUser)")
                                DispatchQueue.main.async {
                                    user.username = name
                                    user.description = description
                                }
                            case .failure(let error):
                                print("Got failed result with \(error.errorDescription)")
                            }
                        case .failure(let error):
                            print("Got failed event with error \(error)")
                        }
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
        
        group.notify(queue: .main) {
            print("All Process Done!")
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    if let imageData = profile {
                        Image(uiImage: imageData)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .clipShape(Circle())
                    } else if let image = user.image {
                        if let uiimage = UIImage(data: image) {
                            Image(uiImage: uiimage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 3)
                                .clipShape(Circle())
                        }
                    } else {
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium, design: .rounded))
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .clipShape(Circle())
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 3)
                .padding(.top)
                .onTapGesture {
                    showSheet.toggle()
                }
                
                HStack {
                    TextField("Username", text: $name)
                        .keyboardType(.default)
                        .font(.subheadline)
                        .padding(.leading,4)
                        .frame(height:44)
                }
                .frame(
                    width: UIScreen.main.bounds.width / 3,
                    height:40
                )
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.15), radius: 20, x:0, y:20)
                .padding(.horizontal,8)
            }
            
            Rectangle()
                .frame(height:1)
                .foregroundColor(.white.opacity(0.1))

            HStack {
                Text("自己紹介")
                    .font(.system(size: 20,weight: .bold))
                    .foregroundColor(.black)
                    .padding(.leading)
                Spacer()
            }
            HStack {
                TextEditor(text: $description)
                    .keyboardType(.default)
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            }
            .frame(height:110)
            .frame(maxWidth: .infinity)
            .background(BlurView(style: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.15), radius: 20, x:0, y:20)
            .padding(.horizontal,8)
            
            Spacer()
        }
        .actionSheet(isPresented: $showSheet, content: {
            ActionSheet(title: Text("Select Photo"),message: Text("Choose"),buttons: [
                .default(Text("Photo Library")) {
                    showSheet.toggle()
                    showPicker.toggle()
                },
                .destructive(Text("Delete Photo")) {
                    showSheet.toggle()
                    profile = nil
                },
                .cancel() {
                    showSheet.toggle()
                }
            ])
        })
        .sheet(isPresented: $showPicker, content: {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $profile,showModal: $showSheet, cropperShown: $cropperShown)
        })
        .sheet(isPresented: $cropperShown){
            ImageCroppingView(shown: $cropperShown, image: profile!, croppedImage: $profile)
        }
        .overlay(
            HStack {
                Button (action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                })
                Spacer()
                Button (action: {
                    save()
                }, label: {
                    Text("Save")
                })
                .disabled(
                    profile == nil &&
                    name == UserDefaults.standard.string(forKey: "username") &&
                    description == UserDefaults.standard.string(forKey: "description")
                )
            }
            .padding()
            ,alignment: .top
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(UserStore())
    }
}
