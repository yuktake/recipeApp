//
//  MakeRecipe.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/31.
//

import SwiftUI
import Amplify
import UniformTypeIdentifiers

struct MakeRecipeView: View {
    @State var shouldShowHeaderImagePicker:Bool = false
    @State var shouldShowHeaderCropper:Bool = false
    @State var header: UIImage? = nil
    @State var screen: CGSize! = UIScreen.main.bounds.size
    @State var showModal:Bool = false
    @State var pickerImageIndex:Int = -1
    @State var isLoading:Bool = false
    @State var showingAlert:Bool = false
    @State var alertText:String = ""
    
    @State var draggedItem: String?
    @State var procedureTmp: [String] = ["1"]
    
    @State var error = false
    
    @ObservedObject var viewModel = CreateRecipeViewModel()
    @EnvironmentObject var user: UserStore
    
    @Environment(\.presentationMode) var presentationMode
    
    var disableForm: Bool {
        viewModel.recipe.title.isEmpty ||
        viewModel.recipe.materials.isEmpty ||
        viewModel.recipe.protein.isEmpty ||
        viewModel.recipe.fat.isEmpty ||
        viewModel.recipe.carbo.isEmpty ||
        viewModel.recipe.calorie.isEmpty ||
        header == nil ||
        viewModel.recipe.contents.filter {$0.content.isEmpty}.count != 0 ||
        error
    }
    
    func textChange(_ text: String) {
        if (text.count > 30) {
            self.error =  true
        } else {
            self.error = false
        }
    }
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    func asyncProcess(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func asyncProcessExample(completion: @escaping () -> Void) {
        print("#Start")
        completion()
    }
    
    // asyncとgroupは非同期直列ではなく、非同期複数が完了した時のnotify
    func post(){
        let group = DispatchGroup()
        guard let imageData = header?.jpegData(compressionQuality: 0.5) else {
            return
        }
        let uuid = UUID().uuidString
        self.isLoading = true
        
        group.enter()
        asyncProcess { () -> Void in
            upload(id: uuid, imageData: imageData, group: group)
        }

        group.notify(queue: .main) {
            print("All Process Done!")
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                self.isLoading = false
                self.user.myRecipes.insert(viewModel.recipe, at: 0)
                self.user.imageDatum[viewModel.recipe.id] = imageData
                dismiss()
            }
        }
    }
    
    func upload(id: String, imageData: Data, group: DispatchGroup) {
        var key = ""
        key = "recipes/\(id).jpg"
        Amplify.Storage.uploadData(key: key, data: imageData) { result in
            switch result {
            case .success:
                print("upload image success")
                viewModel.createRecipe(id: id, recipe: viewModel.recipe, group: group)
            case .failure(let error):
                print("upload data error \(error)")
                group.leave()
            }
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack(alignment: .top) {
                ScrollView(showsIndicators: false) {
                    HStack {
                        Button(action:{
                            showModal.toggle()
                            pickerImageIndex = -1
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
                                    .frame (width: screen.width ,height: screen.height * 0.3)
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
                        .padding(.top)
                    }
                    
                    VStack(spacing:16) {
                        
                        FormView(
                            iconImage: "pencil",
                            placeholder: "TITLE",
                            numberPad: false,
                            text: $viewModel.recipe.title.onChange(textChange)
                        )
                        if error {
                            HStack {
                                Text("制限文字数を30文字までです。")
                                    .foregroundColor(.red)
                                    .padding(.top)
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        
                        HStack {
                            FormView(iconImage: "p.circle.fill", placeholder: "ROTEIN", numberPad: true, text: $viewModel.recipe.protein)
                            FormView(iconImage: "f.circle.fill", placeholder: "AT", numberPad: true, text: $viewModel.recipe.fat)
                            FormView(iconImage: "c.circle.fill", placeholder: "ARBO", numberPad: true, text: $viewModel.recipe.carbo)
                        }
                        HStack {
                            FormView(
                                iconImage: "plus.circle.fill",
                                placeholder: "Calorie",
                                numberPad: true,
                                text: $viewModel.recipe.calorie
                            )
                                .frame(width: screen.width  * 0.4)
                            Text("kcal")
                                .font(.caption)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        Picker(selection: $viewModel.recipe.state, label: Text("状態")) {
                            Text("減量中").tag(1)
                            Text("体重維持").tag(2)
                            Text("増量中").tag(3)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        
                        HStack {
                            Text("材料一覧")
                                .font(.system(size: 20,weight: .bold))
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                            Spacer()
                        }
                        
                        TextAreaView(
                            contents: $viewModel.recipe.materials
                        )
                        .padding(.horizontal)
                        
                        LazyVStack(spacing : 15) {
                            ForEach(0..<viewModel.recipe.contents.count, id:\.self) { index in
                                VStack {
                                    TitleView(
                                        contents: $viewModel.recipe.contents,
                                        index: index,
                                        height: screen.height
                                    )
                                    .padding(.leading, 16)
                                    
                                    HStack {
                                        TextAreaView(
                                            contents: $viewModel.recipe.contents[index].content
                                        )
                                        .frame(width:screen.width*0.8)
                                    }
                                    .frame(height:screen.height*0.2)
                                }
                                .onDrag({
                                    self.draggedItem = procedureTmp[index]
                                    return NSItemProvider(item: nil, typeIdentifier: String(index))
                                }) .onDrop(
                                    of: [UTType.text],
                                    delegate: MyDropDelegate(
                                        item: index,
                                        items: $procedureTmp,
                                        contents: $viewModel.recipe.contents,
                                        draggedItem: $draggedItem
                                    )
                                )
                            }
                        }
                        BannerAd(unitID: "ca-app-pub-5558779899182260/4197512760")
                        
                    }
                    .padding(.top)
                    
                }
                .padding(.bottom)
                .onTapGesture {
                    hideKeyboard()
                }
                .overlay(
                    HStack {
                        Button(action:{
                            dismiss()
                        }){
                            HStack(spacing: 10) {
                                Image(systemName: "xmark")
                                    .renderingMode(.template)
                                Text("Close")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.yellow)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(.yellow.opacity(0.15))
                            .clipShape(Capsule())
                        }
                        Spacer()
                        Button(action:{
                            if (viewModel.recipe.contents.count >= 5) {
                                self.showingAlert = true
                                self.alertText = "手順は5つまでです。"
                                return
                            }
                            viewModel.recipe.contents.append(
                                Procedure(
                                    order:viewModel.recipe.contents.count+1,
                                    content: "",
                                    image: ""
                                )
                            )
                            procedureTmp.append(UUID().uuidString)
                        }){
                            HStack(spacing: 10) {
                                Image(systemName: "plus")
                                    .renderingMode(.template)
                                Text("Add")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.yellow)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(.yellow.opacity(0.15))
                            .clipShape(Capsule())
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text(alertText))
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button(action:{
                            self.post()
                        }){
                            HStack(spacing: 10) {
                                Image(systemName: "paperplane.circle")
                                    .renderingMode(.template)
                                Text("Post")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.yellow)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(disableForm ? .gray.opacity(0.15) : .yellow.opacity(0.15))
                            .clipShape(Capsule())
                        }
                        .disabled(disableForm)
                    }
                    .padding(.top)
                    .padding(.horizontal, 22)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    .background(Color.white)
                    .clipShape(CustomCorner(corners: [.topLeft, .topRight], size: 55))
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -5)
                    ,alignment: .bottom
                )
            }
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
            .onAppear(){
                screen = UIScreen.main.bounds.size
            }
            
            if (isLoading) {
                VStack{}
                .frame(width: screen.width, height: screen.height)
                .background(.black)
                .contentShape(Rectangle())
                .opacity(0.5)
                .onTapGesture {}
                LoadingView()
            }
        }
    }
}

struct FormView: View {
    var iconImage:String
    var placeholder:String
    var numberPad:Bool
    @Binding var text:String
    
    var body: some View {
        HStack {
            Image(systemName: iconImage)
                .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                .frame(width:22, height: 22)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                .shadow(color:Color.black.opacity(0.15),radius: 5, x:0, y:5)
                .padding(.leading)
            TextField(placeholder, text: $text)
                .keyboardType(numberPad ? .numberPad : .default)
                .font(.subheadline)
                .padding(.leading,4)
                .frame(height:44)
        }
        .frame(height:68)
        .frame(maxWidth: .infinity)
        .background(BlurView(style: .systemMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.15), radius: 20, x:0, y:20)
        .padding(.horizontal,4)
    }
}

struct TitleView: View {
    @Binding var contents: [Procedure]
    
    var index: Int
    var height: CGFloat
    
    var body: some View {
        HStack {
            if index >= 1 {
                Button(action: {
                    contents.remove(at: index)
                }, label: {
                    Image(systemName: "xmark.circle")
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .frame(width:16)
                        .padding(.leading)
                })
            }
            Text("手順\(index+1)")
                .font(.system(size: 20,weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 8)
            Spacer()
        }
        .frame(height: height*0.05)
    }
}

struct TextAreaView: View {
    @Binding var contents:String
    
    var body: some View {
        VStack {
            HStack {
                TextEditor(text: $contents)
                    .keyboardType(.default)
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            }
            .frame(height:110)
            .frame(maxWidth: .infinity)
            .background(
                BlurView(style: .systemMaterial)
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.15), radius: 20, x:0, y:20)
        }
    }
}

struct MyDropDelegate : DropDelegate {

    let item : Int
    @Binding var items : [String]
    @Binding var contents : [Procedure]
    @Binding var draggedItem : String?

    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    func dropEntered(info: DropInfo) {
        guard let draggedItem = self.draggedItem else {
            return
        }
        if draggedItem != items[item] {
            let from = items.firstIndex(of: draggedItem)!
            let to = items.firstIndex(of: items[item])!
            withAnimation(.default) {
                self.items.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
                let fromOffset = IndexSet(integer: from)
                let toOffset = to > from ? to + 1 : to
                self.contents[from].order = to
                self.contents[to].order = from
                self.contents.move(fromOffsets: fromOffset, toOffset: toOffset)
                print(self.contents)
            }
        }
    }
}

struct MakeRecipe_Previews: PreviewProvider {
    static var previews: some View {
        MakeRecipeView()
    }
}

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var size: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: size, height: size)
        )
        
        return Path(path.cgPath)
    }
}
