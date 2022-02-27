//
//  SettingView.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/31.
//

import SwiftUI
import Amplify

struct SettingsView: View {
    @State var nameError = false
    @State var descriptionError = false
    @State var name:String = UserDefaults.standard.string(forKey: "username") ?? "" {
        didSet {
            if name.count > 15 && oldValue.count <= 15 {
                nameError = true
            } else {
                nameError = false
            }
        }
    }
    @State var description:String = UserDefaults.standard.string(forKey: "description") ?? "" {
        didSet {
            if description.count > 100 && oldValue.count <= 100 {
                descriptionError = true
            } else {
                descriptionError = false
            }
        }
    }
    @State var profile: UIImage?
    
    @State var showSheet:Bool = false
    @State var showPicker:Bool = false
    @State var cropperShown = false
    @State var profileImageChanged: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: UserStore
    var screen = UIScreen.main.bounds.size
    var disableForm : Bool {
        (profile == nil &&
        name == UserDefaults.standard.string(forKey: "username") &&
        description == UserDefaults.standard.string(forKey: "description")) ||
        nameError ||
        descriptionError
    }
    
    func nameChange(_ text: String) {
        if (text.count > 15) {
            self.nameError =  true
        } else {
            self.nameError = false
        }
    }
    
    func descriptionChange(_ text: String) {
        if (text.count > 100) {
            self.descriptionError =  true
        } else {
            self.descriptionError = false
        }
    }
    
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
                        type: "User",
                        name: userData.name,
                        displayName: name,
                        email: userData.email,
                        description: description,
                        favNum: userData.favNum,
                        reviewNum: userData.reviewNum
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
                                dismiss()
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
        ZStack {
            Color("FormBackground").edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    ZStack {
                        if let imageData = profile {
                            Image(uiImage: imageData)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screen.width / 3)
                                .clipShape(Circle())
                        } else if let image = user.image {
                            if let uiimage = UIImage(data: image) {
                                Image(uiImage: uiimage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: screen.width / 3)
                                    .clipShape(Circle())
                            }
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.white)
                                .frame(width: screen.width / 3)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                                .background(.yellow)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top)
                    .onTapGesture {
                        showSheet.toggle()
                    }
                    
                    HStack {
                        TextField("Username", text: $name.onChange(nameChange))
                            .keyboardType(.default)
                            .font(.subheadline)
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .padding(8)
                    }
                    .frame(height:40)
                    .frame(maxWidth: .infinity)
                    .background(BlurView(style: .systemMaterial))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: .black.opacity(0.15), radius: 20, x:0, y:20)
                    .padding(8)
                    
                    Spacer()
                }
                .frame(width: screen.width / 3, height: screen.height / 3)
                .onTapGesture {
                    self.hideKeyboard()
                }
                
                HStack {
                    if self.nameError {
                        Text("制限文字数を15文字までです。")
                            .foregroundColor(.red)
                            .padding(.top,8)
                    }
                }
                
                Rectangle()
                    .frame(height:1)
                    .foregroundColor(.white.opacity(0.1))

                HStack {
                    Text("自己紹介")
                        .font(.system(size: 20,weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading)
                    Spacer()
                }
                
                HStack {
                    if self.descriptionError {
                        Text("制限文字数を100文字までです。")
                            .foregroundColor(.red)
                            .padding(.top, 8)
                            .padding(.leading)
                        Spacer()
                    }
                }
                
                HStack {
                    TextEditor(text: $description.onChange(descriptionChange))
                        .keyboardType(.default)
                        .font(.subheadline)
                        .padding(8)
                }
                .frame(height:110)
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.15), radius: 20, x:0, y:20)
                .padding(8)
                
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
                ImageCroppingView(shown: $cropperShown, image: profile!, croppedImage: $profile, change: $profileImageChanged)
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
                    .disabled(disableForm)
                }
                .padding()
                ,alignment: .top
            )
            .background(.black)
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(UserStore())
    }
}
