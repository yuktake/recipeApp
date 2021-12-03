//
//  Review.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/10/10.
//

import SwiftUI
import Amplify

struct ReviewView: View {
    @State var shouldShowHeaderImagePicker = false
    @State var shouldShowHeaderCropper = false
    @State var showLottie: Bool = false
    @State var header: UIImage?
    @State var screen: CGSize! = UIScreen.main.bounds.size
    @State var showModal = false
    @State var contents = ""
    @State var isFocused = false
    @State var headerKey = ""
    @State var recipe:Recipe? = nil
    
    var recipeID: String
    @Binding var showSheet: Bool
    
    @EnvironmentObject var user: UserStore
    @Environment(\.presentationMode) var presentationMode
    
    func getRecipe(id: String) {
        Amplify.API.query(request: .get(Recipe.self, byId: id)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipe):
                    guard let recipe = recipe else {
                        print("Could not find todo")
                        return
                    }
                    self.recipe = recipe
                    print("Successfully retrieved recipe for review: \(recipe)")
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func asyncProcess(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func post(){
        let group = DispatchGroup()
        showLottie.toggle()
        group.enter()
        asyncProcess() { () -> Void in
            upload(image: header, group: group)
            print("# End header")
        }
        
        group.notify(queue: .main) {
            let amplify_review = Review(
                user: user.sub!,
                content: contents,
                image: headerKey,
                recipe: recipe
            )
            Amplify.API.mutate(request: .create(amplify_review)) { event in
                switch event {
                case .success(let result):
                    switch result {
                    case .success(let review):
                        print("Successfully created review: \(review)")
                        print("All Process Done!")
                        DispatchQueue.main.async {
                            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                                showLottie.toggle()
                                showSheet=false
                            }
                        }
                    case .failure(let error):
                        print("Got failed result with \(error.errorDescription)")
                        showLottie.toggle()
                    }
                case .failure(let error):
                    print("Got failed event with error \(error)")
                    showLottie.toggle()
                }
            }
        }
    }
    
    func upload(image: UIImage?, group: DispatchGroup) {
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else {
            return
        }
        
        let key = "reviews/"+UUID().uuidString + ".jpg"
        DispatchQueue.main.async {
            Amplify.Storage.uploadData(key: key, data: imageData) { result in
                switch result {
                case .success:
                    print("upload image success")
                    self.headerKey = key
                    group.leave()
                case .failure(let error):
                    print("upload data error \(error)")
                
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button(action:{
                        showModal.toggle()
                    }, label: {
                        if let image = header {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top)
                        } else {
                            Image(systemName: "camera")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .frame (width: screen.width ,height: screen.height * 0.4)
                                .background(Color.gray)
                        }
                    })
                    .sheet(isPresented: $shouldShowHeaderImagePicker, content: {
                        ImagePicker(
                            sourceType: .photoLibrary,
                            selectedImage: $header,
                            showModal: $showModal,
                            cropperShown: $shouldShowHeaderCropper
                        )
                    })
                    .sheet(isPresented: $shouldShowHeaderCropper){
                        ImageCroppingView(
                            shown: $shouldShowHeaderCropper,
                            image: header!,
                            croppedImage: $header
                        )
                    }
                    .padding()
                }
                HStack {
                    Text("料理の感想")
                        .font(.system(size: 20,weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                    Spacer()
                }
                .padding()
                
                HStack {
                    TextEditor(text: $contents)
                        .keyboardType(.default)
                        .font(.subheadline)
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .onTapGesture {
                            self.isFocused = true
                        }
                }
                .frame(width: screen.width - 32, height: screen.height * 0.3)
                .background(
                    BlurView(style: .systemMaterial)
                )
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.15), radius: 20, x:0, y:20)
            }
            .sheet(isPresented: $shouldShowHeaderImagePicker, content: {
                ImagePicker(
                    sourceType: .photoLibrary,
                    selectedImage: $header,
                    showModal: $showModal,
                    cropperShown: $shouldShowHeaderCropper
                )
            })
            .sheet(isPresented: $shouldShowHeaderCropper){
                ImageCroppingView(
                    shown: $shouldShowHeaderCropper,
                    image: header!,
                    croppedImage: $header
                )
            }
            .overlay(
                Button(action: {
                    // closing
                    self.post()
                }) {
                    Text("Post")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.trailing,25)
                        .padding(.top,25)
                }
                ,alignment: .topTrailing
            )
            
            .actionSheet(isPresented: $showModal, content: {
                ActionSheet(title: Text("Select Photo"),message: Text("Choose"),buttons: [
                    .default(Text("Photo Library")) {
                        showModal.toggle()
                        shouldShowHeaderImagePicker.toggle()
                    },
                    .destructive(Text("Delete Photo")) {
                        showModal.toggle()
                        header = nil
                    },
                    .cancel() {
                        showModal.toggle()
                    }
                ])
            })
            .offset(y:isFocused ? -150 : 0)
            .onTapGesture {
                hideKeyboard()
                self.isFocused = false
            }
            
            if showLottie {
                LottieView(filename: "review")
            }
        }
        .onTapGesture {
            hideKeyboard()
            self.isFocused = false
        }
        .onAppear{
            self.getRecipe(id: recipeID)
        }
    }
}

//struct ReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewView(recipeID: "")
//    }
//}
