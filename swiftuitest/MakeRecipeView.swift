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
    @State var shouldShowProcedureImagePicker:[Bool] = [false]
    @State var shouldShowProcedureImageCropper:[Bool] = [false]
    @State var header: UIImage? = nil
    @State var procedureImages: [UIImage?] = []
    @State var screen: CGSize! = UIScreen.main.bounds.size
    @State var showModal:Bool = false
    @State var pickerImageIndex:Int = -1
    @State var isLoading:Bool = false
    @State var showingAlert:Bool = false
    @State var alertText:String = ""
    
    @State var draggedItem: String?
    @State var procedureTmp: [String] = ["1"]
    
    @ObservedObject var viewModel = CreateRecipeViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var disableForm: Bool {
        viewModel.recipe.title.isEmpty ||
        viewModel.recipe.materials.isEmpty ||
//        procedureImages.contains(nil) ||
        header == nil ||
        viewModel.recipe.contents.filter {$0.content.isEmpty}.count != 0
    }
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    func asyncProcess(text: String,completion: @escaping () -> Void) {
        print("start \(text)")
        DispatchQueue.main.async {
            completion()
        }
    }
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func post(){
        let group = DispatchGroup()
        self.isLoading = true
        group.enter()
        asyncProcess(text:"header") { () -> Void in
            upload(image: header,index: -1,group: group)
            print("# End header")
        }
//        for (index,image) in self.procedureImages.enumerated() {
//            group.enter()
//            asyncProcess(text:"procedure") { () -> Void in
//                upload(image: image,index: index,group:group)
//                print("# End procedure")
//            }
//        }
        
        group.notify(queue: .main) {
            viewModel.createRecipe(recipe: viewModel.recipe)
            print("All Process Done!")
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                self.isLoading = false
                dismiss()
            }
        }
    }
    
    func upload(image:UIImage?,index:Int = -1,group:DispatchGroup) {
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else {
            return
        }
        var key = ""
        let uuid = UUID().uuidString
        if (index == -1) {
            key = "recipes/\(uuid).jpg"
        } else {
            key = "procedures/\(uuid).jpg"
        }
        DispatchQueue.main.async {
            Amplify.Storage.uploadData(key: key, data: imageData) { result in
                switch result {
                case .success:
                    print("upload image success")
                    if index == -1 {
                        viewModel.recipe.image = key
                        viewModel.recipe.id = uuid
                    } else {
                        viewModel.recipe.contents[index].image = key
                    }
                    group.leave()
                case .failure(let error):
                    print("upload data error \(error)")
                    group.leave()
                }
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
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                ScrollView(showsIndicators: false) {
                    HStack {
                        Button(action:{
                            showModal.toggle()
//                            shouldShowHeaderImagePicker.toggle()
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
                        
                        FormView(iconImage: "pencil", placeholder: "TITLE", numberPad: false, text: $viewModel.recipe.title)
                        HStack {
                            FormView(iconImage: "p.circle.fill", placeholder: "ROTEIN", numberPad: true, text: $viewModel.recipe.protein)
                            FormView(iconImage: "f.circle.fill", placeholder: "AT", numberPad: true, text: $viewModel.recipe.fat)
                            FormView(iconImage: "c.circle.fill", placeholder: "ARBO", numberPad: true, text: $viewModel.recipe.carbo)
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
                                .onTapGesture {
                                    
                                }
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
                                        contents: $viewModel.recipe.contents, shouldShowProcedureImagePicker: $shouldShowProcedureImagePicker,
                                        shouldShowProcedureImageCropper: $shouldShowProcedureImageCropper,
                                        procedureImages: $procedureImages,
                                        procedureTmp: $procedureTmp,
                                        index: index,
                                        height: screen.height
                                    )
                                    
                                    HStack(spacing: 8) {
                                        TextAreaView(
                                            contents: $viewModel.recipe.contents[index].content
                                        )
                                        .frame(width:screen.width*0.6)
                                        
//                                        ImageButton(
//                                            showModal: $showModal,
//                                            pickerImageIndex: $pickerImageIndex,
//                                            procedureImage: $procedureImages[index],
//                                            showPicker: $shouldShowProcedureImagePicker[index],
//                                            showCropper: $shouldShowProcedureImageCropper[index],
//                                            width: screen.width,
//                                            index: index
//                                        )
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
                                        images: $procedureImages,
                                        contents: $viewModel.recipe.contents,
                                        pickers: $shouldShowProcedureImagePicker,
                                        croppers: $shouldShowProcedureImageCropper,
                                        draggedItem: $draggedItem
                                    )
                                )
                            }
                        }
                        
                    }
                    .padding(.top)
                    
                    HStack {
                        Button(action: {
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
                            shouldShowProcedureImagePicker.append(false)
                            shouldShowProcedureImageCropper.append(false)
                            procedureImages.append(nil)
                            procedureTmp.append(UUID().uuidString)
                            print("add!!!")
                            print(viewModel.recipe.contents.count)
                        }){
                            Text("Add")
                                .foregroundColor(.black)
                        }
                        .padding(12)
                        .padding(.horizontal, 30)
                        .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color:Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3),radius: 20, x:0, y:20)
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text(alertText))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.post()
                            print("push!!!")
                        }){
                            Text("Post")
//                                .foregroundColor(.black)
                        }
                        .padding(12)
                        .padding(.horizontal, 30)
                        .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color:Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3),radius: 20, x:0, y:20)
                        .disabled(disableForm)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding()
                }
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .actionSheet(isPresented: $showModal, content: {
                ActionSheet(title: Text("Select Photo"),message: Text("Choose"),buttons: [
                    .default(Text("Photo Library")) {
                        showModal.toggle()
                        if (pickerImageIndex == -1) {
                            shouldShowHeaderImagePicker.toggle()
                        } else {
                            shouldShowProcedureImagePicker[pickerImageIndex].toggle()
                        }
                    },
                    .destructive(Text("Delete Photo")) {
                        showModal.toggle()
                        if (pickerImageIndex == -1) {
                            header = nil
                        } else {
                            procedureImages[pickerImageIndex] = nil
                        }
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
        .padding(.horizontal,8)
    }
}

struct TitleView: View {
    @Binding var contents: [Procedure]
    @Binding var shouldShowProcedureImagePicker: [Bool]
    @Binding var shouldShowProcedureImageCropper: [Bool]
    @Binding var procedureImages: [UIImage?]
    @Binding var procedureTmp: [String]
    
    var index: Int
    var height: CGFloat
    
    var body: some View {
        HStack {
            if index >= 1 {
                Button(action: {
                    contents.remove(at: index)
                    shouldShowProcedureImagePicker.remove(at: index)
                    shouldShowProcedureImageCropper.remove(at: index)
                    procedureImages.remove(at: index)
                    procedureTmp.remove(at: index)
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

struct ImageButton: View {
    @Binding var showModal:Bool
    @Binding var pickerImageIndex:Int
    @Binding var procedureImage: UIImage?
    
    @Binding var showPicker: Bool
    @Binding var showCropper: Bool
    
    var width:CGFloat
    var index:Int
    
    var body: some View {
        Button(action:{
            showModal.toggle()
            pickerImageIndex = index
        }, label: {
            VStack(alignment: .center) {
                if let image = self.procedureImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width*0.2)
                } else {
                    Image(systemName: "camera")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
        })
            .buttonStyle(BorderlessButtonStyle())
            .sheet(isPresented: $showPicker, content: {
                ImagePicker(
                    sourceType: .photoLibrary,
                    selectedImage: $procedureImage,
                    showModal: $showModal,
                    cropperShown: $showCropper
                )
            })
            .sheet(isPresented: $showCropper){
                ImageCroppingView(
                    shown: $showCropper,
                    image: procedureImage!,
                    croppedImage: $procedureImage
                )
            }
    }
}

struct MyDropDelegate : DropDelegate {

    let item : Int
    @Binding var items : [String]
    @Binding var images : [UIImage?]
    @Binding var contents : [Procedure]
    @Binding var pickers : [Bool]
    @Binding var croppers : [Bool]
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
                self.images.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
                self.contents.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
                self.pickers.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
                self.croppers.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
            }
        }
    }
}

struct MakeRecipe_Previews: PreviewProvider {
    static var previews: some View {
        MakeRecipeView()
    }
}
