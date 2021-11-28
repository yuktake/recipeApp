//
//  RecipeEdit.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/09/18.
//

import SwiftUI
import Amplify
import UniformTypeIdentifiers

struct RecipeEdit: View {
    
    var detail_recipe: RecipeData
    @Binding var detail_image: Data
    @Binding var showSheet: Bool
    
    @State var shouldShowHeaderImagePicker: Bool = false
    @State var shouldShowHeaderCropper:Bool = false
    @State var header: UIImage?
    @State var headerImage: Data = Data()
    @State var procedures:[Procedure] = []
    @State var oldProcereIds:[String] = []

    @State var screen: CGSize! = UIScreen.main.bounds.size
    @State var showModal = false
    @State var cropperShown = false
    @State var pickerImageIndex = -1
    @State var firstLoad = true
    @State var isLoading = false
    
    @State var draggedItem: String?
    @State var procedureTmp: [String] = ["1"]
    
    @State var showingAlert:Bool = false
    @State var alertText:String = ""
    
    @State var recipe = RecipeData(
        userId: UserDefaults.standard.string(forKey: "sub") ?? "",
        title: "",
        calorie: String(0),
        protein: String(0.0),
        fat: String(0.0),
        carbo: String(0.0),
        state: 2,
        materials: "",
        contents: [],
        reviews:[],
        image: "",
        favNum: 0,
        create_at: "",
        update_at: "",
        delFlg: 0
    )
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var user: UserStore
    
    var disableForm: Bool {
        recipe.title.isEmpty ||
        recipe.materials.isEmpty ||
        // edited判定したい
        recipe.contents.filter {$0.content.isEmpty}.count != 0
    }
    
    func load() {
        if (!firstLoad) {
            print("not first load")
            return
        }
        self.recipe = detail_recipe
        print(self.recipe)
        Amplify.API.query(request: .getRecipeForDetail(id: recipe.id)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipe):
                    print("Successfully retrieved recipe: \(recipe)")
                    self.recipe.calorie = String(recipe.calorie)
                    self.recipe.protein = String(recipe.protein)
                    self.recipe.fat = String(recipe.fat)
                    self.recipe.carbo = String(recipe.carbo)
                    self.recipe.state = recipe.state
                    self.recipe.materials = recipe.materials
                    
                    recipe.contents?.forEach{ procedure in
                        print("contentttttt")
                        DispatchQueue.main.async {
//                            self.procedures.append(procedure)
                            self.recipe.contents.append(procedure)
                            self.oldProcereIds.append(procedure.id)
                            procedureTmp.append(UUID().uuidString)
                        }
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
        print("contents count edit")
        firstLoad.toggle()
    }
    
    func asyncProcess(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func post(){
        self.isLoading = true
        let group = DispatchGroup()
        
        group.enter()
        asyncProcess { () -> Void in
            self.upload(
                image: header,
                recipeId: recipe.id,
                group: group
            )
            print("# End header")
        }
        
        let amplifyRecipe = Recipe(
            id: self.recipe.id,
            user: self.recipe.userId,
            type: "Recipe",
            title: self.recipe.title,
            calorie: Int(self.recipe.calorie) ?? 0,
            protein: Double(self.recipe.protein) ?? 0.0,
            fat: Double(self.recipe.fat) ?? 0.0,
            carbo: Double(self.recipe.carbo) ?? 0.0,
            state: self.recipe.state,
            materials: self.recipe.materials,
            image: self.recipe.image,
            favNum: self.recipe.favNum,
            createdAt: recipe.create_at,
            updatedAt: recipe.update_at,
            delFlg: 0
        )
        
        // amplifyRecipeをセットするため
        var order = 1
        self.recipe.contents.forEach{ content in
            self.procedures.append(
                Procedure(
                    id: content.id,
                    order: order,
                    content: content.content,
                    image: "",
                    recipe: amplifyRecipe
                )
            )
            order+=1
        }
        
        print("amplifyRecipe")
        print(amplifyRecipe)
            
        Amplify.API.mutate(request: .update(amplifyRecipe)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let a):
                    print("Successfully updated recipe: \(a)")
                    self.procedures.forEach{ p in
                        group.enter()
                        asyncProcess { () -> Void in
                            if self.oldProcereIds.contains(where: {$0 == p.id}) {
                                self.updateProcedure(procedure: p, group: group)
                            } else {
                                self.createProcedure(procedure: p, group: group)
                            }
                        }
                    }
                case .failure(let error):
                    print("Got failed update result with \(error.errorDescription)")
                    break
                }
            case .failure(let error):
                print("Got failed update event with error \(error)")
                break
            }
        }
        
        group.notify(queue: .main) {
            self.isLoading = false
            self.showSheet.toggle()
            print("All Process Done!")
        }
    }
    
    func upload(
        image:UIImage?,
        recipeId:String,
        group:DispatchGroup
    ) {
        if header == nil {
            group.leave()
            return
        }
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else {
            return
        }

        //TODO: 修正したもののみを判別したい
        let key = "recipes/"+recipeId+".jpg"
        
        DispatchQueue.main.async {
            Amplify.Storage.uploadData(
                key: key,
                data: imageData
            ) { result in
                switch result {
                case .success(let k):
                    print("upload image success")
                    DispatchQueue.main.async {
                        self.user.imageDatum[recipeId] = imageData
                        group.leave()
                    }
                case .failure(let error):
                    print("upload data error \(error)")
                    group.leave()
                }
            }
        }
    }
    
    func createProcedure(procedure: Procedure, group: DispatchGroup) {
        Amplify.API.mutate(request: .create(procedure)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let procedure):
                    print("Successfully created procedure: \(procedure)")
                    group.leave()
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                group.leave()
            }
        }
    }
    
    func updateProcedure(procedure: Procedure, group: DispatchGroup) {
        Amplify.API.mutate(request: .update(procedure)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let procedure):
                    print("Successfully updated procedure: \(procedure)")
                    group.leave()
                case .failure(let error):
                    print("Got update failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got update failed event with error \(error)")
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack(alignment: .top) {
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                NavigationView{
                    ScrollView {
                        HStack{
                            Button(action:{
                                showModal.toggle()
                                pickerImageIndex = -1
                            }, label: {
                                if let image = header {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.top)
                                } else if let image = UIImage(data: detail_image){
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
                            FormView(iconImage: "pencil", placeholder: "TITLE", numberPad: false, text: $recipe.title)
                            HStack {
                                FormView(iconImage: "p.circle.fill", placeholder: "ROTEIN", numberPad: true, text: $recipe.protein)
                                FormView(iconImage: "f.circle.fill", placeholder: "AT", numberPad: true, text: $recipe.fat)
                                FormView(iconImage: "c.circle.fill", placeholder: "ARBO", numberPad: true, text: $recipe.carbo)
                            }
                            Picker(selection: $recipe.state, label: Text("状態")) {
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
                                    .onTapGesture{
//                                        self.isFirstViewActive = false
//                                        self.edited = true
                                    }
                                Spacer()
                            }
                            TextAreaView(
                                contents: $recipe.materials
                            )
                            .padding(.horizontal)
                            
                            LazyVStack(spacing : 15) {
                                ForEach(0..<recipe.contents.count, id:\.self) { index in
                                    VStack {
                                        TitleView(
                                            contents: $recipe.contents,
//                                            shouldShowProcedureImagePicker: $shouldShowProcedureImagePicker,
//                                            shouldShowProcedureImageCropper: $shouldShowProcedureImageCropper,
//                                            procedureImages: $procedureImages,
//                                            procedureTmp: $procedureTmp,
                                            index: index,
                                            height: screen.height
                                        )
                                        
                                        HStack(spacing: 8) {
                                            TextAreaView(
                                                contents: $recipe.contents[index].content
                                            )
                                            .frame(width:screen.width*0.6)
                                            
//                                            ImageButton(
//                                                showModal: $showModal,
//                                                pickerImageIndex: $pickerImageIndex,
//                                                procedureImage: $procedureImages[index],
//                                                showPicker: $shouldShowProcedureImagePicker[index],
//                                                showCropper: $shouldShowProcedureImageCropper[index],
//                                                width: screen.width,
//                                                index: index
//                                            )
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
//                                            images: $procedureImages,
                                            contents: $recipe.contents,
//                                            pickers: $shouldShowProcedureImagePicker,
//                                            croppers: $shouldShowProcedureImageCropper,
                                            draggedItem: $draggedItem
                                        )
                                    )
                                }
                            }
                            
//                            ForEach(0..<self.procedureTmp.count, id: \.self) { index in
//    //                        ForEach(0..<self.recipe.contents.count, id: \.self) { index in
//                                HStack {
//                                    Text("手順\(index+1)")
//                                        .font(.system(size: 20,weight: .bold))
//                                        .foregroundColor(.white)
//                                        .padding(.leading)
//                                    Spacer()
//                                }
//                                HStack(spacing:16) {
//                                    TextAreaView(contents: $recipe.contents[index].content)
//    //                                    .frame(width: screen.width*0.7)
//                                    Button(action:{
//                                        showModal.toggle()
//                                        pickerImageIndex = index
//                                    }, label: {
//                                        if let image = self.procedureImages[index] {
//    //                                    if let image = UIImage(data:procedureImages[index]) {
//                                            Image(uiImage: image)
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
//    //                                            .frame(height:200)
//                                                .frame(width: screen.width*0.2)
//                                        } else {
//                                            Image(systemName: "camera")
//                                                .font(.largeTitle)
//                                                .padding()
//                                                .background(Color.purple)
//                                                .foregroundColor(.white)
//                                                .clipShape(Circle())
//                                        }
//                                    })
//                                    .sheet(isPresented: $shouldShowProcedureImagePicker[index], content: {
//                                        ImagePicker(sourceType: .photoLibrary, selectedImage: $procedureImages[index],showModal: $showModal, cropperShown: $cropperShown)
//                                    })
//                                }
//                                .padding(.horizontal)
//                            }
                        }
                        .padding(.top)
                        
                        HStack {
                            Button(action: {
                                if (recipe.contents.count >= 5) {
                                    self.showingAlert = true
                                    self.alertText = "手順は5までです。"
                                    return
                                }
                                self.recipe.contents.append(
                                    Procedure(
                                        order:self.recipe.contents.count+1,
                                        content: "",
                                        image: ""
                                    )
                                )
//                                shouldShowProcedureImagePicker.append(false)
//                                shouldShowProcedureImageCropper.append(false)
//                                self.procedureImages.append(nil)
                                procedureTmp.append(UUID().uuidString)
                                print("add!!!")
                                print(self.recipe.contents.count)
                            }){
                                Text("Add")
                                    .foregroundColor(.black)
                            }
                            .padding(12)
                            .padding(.horizontal, 30)
                            .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .shadow(color:Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3),radius: 20, x:0, y:20)
                            Spacer()
                            Button(action: {
                                self.post()
                                print("push!!!")
                            }){
                                Text("Post")
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
                            .disabled(disableForm)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .padding()
                        
                    }
                    .onTapGesture{
                        hideKeyboard()
                    }
                    .navigationBarHidden(true)
                }
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
                load()
            }
            if (isLoading) {
                LoadingView()
            }
        }
    }
}

//struct RecipeEdit_Previews: PreviewProvider {
//
//    @State static var isFirstViewActive = false
//    @State static var edited = false
//
//    static var previews: some View {
//        RecipeEdit(
//            detail_recipe: RecipeData(
//                id: "1",
//                userId:"1",
//                title:"title",
//                calorie: 0,
//                protein: String(1),
//                fat: String(1),
//                carbo: String(1),
//                state: 2,
//                materials:"a",
//                contents: [],
//                reviews: [],
//                image: "https://thumb.photo-ac.com/13/138a664e93a533fd2c86786eee42e391_w.jpeg",
//                favNum: 0,
//                create_at: "",
//                update_at: "",
//                delFlg: 0
//            )
//            ,
//            detail_image: Data()
////            detail_procedures: [],
////            detail_procedures_images: [:],
////            edited: $edited
////            ,isFirstViewActive: $isFirstViewActive
////            ,shouldPopToRootView: $shouldPopToRootView
//        )
//            .environmentObject(CreateRecipeViewModel())
//    }
//}
