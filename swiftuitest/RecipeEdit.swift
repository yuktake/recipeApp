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
    var procedureImagesData: [String:Data]
    
    @Binding var detail_header: Data
    @Binding var showSheet: Bool
    
    @State var shouldShowHeaderImagePicker: Bool = false
    @State var shouldShowHeaderCropper:Bool = false
    @State var headerImageChanged: Bool = false
    @State var shouldShowProcedureImagePicker: [Bool] = []
    @State var shouldShowProcedureImageCropper:[Bool] = []
    @State var procedureImageChanged: [Bool] = []
    
    @State var header: UIImage?
//    @State var headerImage: Data = Data()
    
    @State var procedures:[Procedure] = []
    @State var procedureImages: [UIImage?] = []
    @State var oldProcedureIds:[String] = []
    @State var deleteProcedures:[Procedure] = []

    @State var screen: CGSize! = UIScreen.main.bounds.size
    @State var showModal = false
    @State var cropperShown = false
    @State var pickerImageIndex = -1
    @State var firstLoad = true
    @State var isLoading = false
    
    @State var draggedItem: String?
//    @State var procedureTmp: [String] = ["1"]
    @State var procedureTmp: [String] = []
    
    @State var showingAlert:Bool = false
    @State var alertText:String = ""
    
    @State var error = false
    @State var title = "" {
        didSet {
            if title.count > 30 && oldValue.count <= 30 {
                error = true
            } else {
                error = false
            }
        }
    }
    
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
        favNum: 0,
        create_at: "",
        update_at: "",
        delFlg: 0
    )
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var user: UserStore
    
    var disableForm: Bool {
        title.isEmpty ||
        recipe.materials.isEmpty ||
        // edited判定したい
        recipe.contents.filter {$0.content.isEmpty}.count != 0 ||
        error
    }
    
    func textChange(_ text: String) {
        if (text.count > 30) {
            self.error =  true
        } else {
            self.error = false
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func load() {
        if (!firstLoad) {
            print("not first load")
            return
        }
        self.recipe = detail_recipe
        self.title = detail_recipe.title
        
//        print(procedureImagesData)
        
        shouldShowProcedureImagePicker = [Bool](repeating: false, count: self.procedureImagesData.count)
        shouldShowProcedureImageCropper = [Bool](repeating: false, count: self.procedureImagesData.count)
//        print(shouldShowProcedureImagePicker)
//        print(shouldShowProcedureImageCropper)
        
        Amplify.API.query(request: .getRecipeForDetail(id: recipe.id)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipe):
                    print("Successfully retrieved recipe: \(recipe)")
                    self.title = recipe.title
                    self.recipe.calorie = String(recipe.calorie)
                    self.recipe.protein = String(recipe.protein)
                    self.recipe.fat = String(recipe.fat)
                    self.recipe.carbo = String(recipe.carbo)
                    self.recipe.state = recipe.state
                    self.recipe.materials = recipe.materials
                    
                    recipe.contents?.forEach{ procedure in
                        DispatchQueue.main.async {
                            self.recipe.contents.append(procedure)
                            self.oldProcedureIds.append(procedure.id)
                            self.procedureImageChanged.append(false)
                            procedureTmp.append(UUID().uuidString)
                            print("contentttttt")
                            if let uiimage = UIImage(data:procedureImagesData[procedure.id]!) {
                                self.procedureImages.append(uiimage)
                            } else {
                                self.procedureImages.append(nil)
                            }
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
        let subgroup = DispatchGroup()
        subgroup.enter()
        asyncProcess { () -> Void in
            self.upload(
                image: header,
                recipeId: recipe.id,
                group: subgroup
            )
            print("# End header")
        }
        
        let amplifyRecipe = Recipe(
            id: self.recipe.id,
            user: self.recipe.userId,
            type: "Recipe",
            title: self.title,
            calorie: Int(self.recipe.calorie) ?? 0,
            protein: Double(self.recipe.protein) ?? 0.0,
            fat: Double(self.recipe.fat) ?? 0.0,
            carbo: Double(self.recipe.carbo) ?? 0.0,
            state: self.recipe.state,
            materials: self.recipe.materials,
            favNum: self.recipe.favNum,
            reviewNum: self.recipe.reviews.count,
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
                    image: content.image!,
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
                case .success(let recipe):
                    print("Successfully updated recipe: \(recipe)")
                    if let firstIndex = user.myRecipes.firstIndex(where: {$0.id == recipe.id}) {
                        DispatchQueue.main.async {
                            self.user.myRecipes[firstIndex].title = recipe.title
                        }
                    }
                    self.deleteProcedures.forEach { procedure in
                        subgroup.enter()
                        asyncProcess { () -> Void in
                            self.deleteProcedure(procedure: procedure, group: subgroup)
                        }
                    }
                    self.procedures.forEach{ p in
                        subgroup.enter()
                        asyncProcess { () -> Void in
                            if self.oldProcedureIds.contains(where: {$0 == p.id}) {
                                self.updateProcedure(procedure: p, procedureImage: procedureImages[p.order-1], group: subgroup)
                            } else {
                                self.createProcedure(procedure: p, procedureImage: procedureImages[p.order-1], group: subgroup)
                            }
                        }
                    }
                    subgroup.notify(queue: .main) {
                        print("subgroup end")
                        group.leave()
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLoading = false
                self.showSheet.toggle()
                print("All Process Done!")
            }
        }
    }
    
    func upload(
        image:UIImage?,
        recipeId:String,
        group:DispatchGroup
    ) {
        if header == nil {
            print("no upload")
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
    
    func createProcedure(procedure: Procedure, procedureImage:UIImage?, group: DispatchGroup) {
        Amplify.API.mutate(request: .create(procedure)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let procedure):
                    print("Successfully created procedure: \(procedure)")
                    if let procedureImage = procedureImage {
                        if !self.procedureImageChanged[procedure.order-1] {
                            print("same picture")
                            group.leave()
                            return
                        }
                        guard let imageData = procedureImage.jpegData(compressionQuality: 0.5) else {
                            group.leave()
                            return
                        }
                        self.procedureImageUpload(key: "procedures/"+procedure.id+".jpg", imageData: imageData, group:group)
                    } else {
                        group.leave()
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    group.leave()
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                group.leave()
            }
        }
    }
    
    func updateProcedure(procedure: Procedure, procedureImage:UIImage?, group: DispatchGroup) {
        Amplify.API.mutate(request: .update(procedure)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let procedure):
                    print("Successfully updated procedure: \(procedure)")
                    if let procedureImage = procedureImage {
                        if !self.procedureImageChanged[procedure.order-1] {
                            print("same picture")
                            group.leave()
                            return
                        }
                        guard let imageData = procedureImage.jpegData(compressionQuality: 0.5) else {
                            group.leave()
                            return
                        }
                        self.procedureImageUpload(key: "procedures/"+procedure.id+".jpg", imageData: imageData, group:group)
                    } else {
                        // 詳細画面では画像が存在
                        if procedureImagesData[procedure.id] != Data() {
                            self.procedureImageDelete(key: "procedures/"+procedure.id+".jpg", group: group)
                        } else {
                            print("already nil")
                        }
                        group.leave()
                    }
                case .failure(let error):
                    print("Got update failed result with \(error.errorDescription)")
                    group.leave()
                }
            case .failure(let error):
                print("Got update failed event with error \(error)")
                group.leave()
            }
        }
    }
    
    func deleteProcedure(procedure: Procedure, group: DispatchGroup) {
        if (procedure.image == "") {
            group.leave()
            return;
        }
        Amplify.Storage.remove(key: procedure.image!) { event in
            switch event {
            case let .success(data):
                print("Completed: Deleted \(data)")
                Amplify.API.mutate(request: .delete(procedure)) { event in
                    switch event {
                    case .success(let result):
                        switch result {
                        case .success(let procedure):
                            print("Successfully deleted procedure: \(procedure)")
                            group.leave()
                        case .failure(let error):
                            print("Got update failed result with \(error.errorDescription)")
                            group.leave()
                        }
                    case .failure(let error):
                        print("Got update failed event with error \(error)")
                        group.leave()
                    }
                }
            case let .failure(storageError):
                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                group.leave()
            }
        }
    }
    
    func procedureImageUpload(key: String, imageData: Data, group: DispatchGroup) {
        Amplify.Storage.uploadData(key: key, data: imageData) { result in
            switch result {
            case .success:
                print("upload procedure image success")
                group.leave()
            case .failure(let error):
                print("upload procedure data error \(error)")
                group.leave()
            }
        }
    }
    
    func procedureImageDelete(key: String, group: DispatchGroup) {
        Amplify.Storage.remove(key: key) { event in
            switch event {
            case let .success(data):
                print("Completed: Deleted \(data)")
            case let .failure(storageError):
                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                HStack{
                    Button(action:{
                        showModal.toggle()
                        pickerImageIndex = -1
                    }, label: {
                        // Pickerから選択した画像
                        if let image = header {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top)
                        // 詳細から受け取った画像
                        } else if let image = UIImage(data: detail_header){
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
                            croppedImage: $header,
                            change: $headerImageChanged
                        )
                    }
                    .padding(.top)
                }
                VStack(spacing:16) {
                    FormView(iconImage: "pencil", placeholder: "TITLE", numberPad: false, text: $title.onChange(textChange))
                    HStack {
                        if self.error {
                            Text("制限文字数を30文字までです。")
                                .foregroundColor(.red)
                                .padding(.top)
                        }
                        Spacer()
                    }
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
                        Spacer()
                    }
                    TextAreaView(
                        contents: $recipe.materials
                    )
                    .padding(.horizontal)
                    
                    LazyVStack(spacing : 15) {
                        ForEach(0..<recipe.contents.count, id:\.self) { index in
                            VStack {
                                EditTitleView(
                                    contents: $recipe.contents,
                                    oldProcedureIds: $oldProcedureIds,
                                    deleteProcedures: $deleteProcedures,
                                    shouldShowProcedureImagePicker: $shouldShowProcedureImagePicker,
                                    shouldShowProcedureImageCropper: $shouldShowProcedureImageCropper,
                                    procedureImages: $procedureImages,
                                    procedureTmp: $procedureTmp,
                                    index: index,
                                    height: screen.height
                                )
                                
                                HStack(spacing: 8) {
                                    TextAreaView(
                                        contents: $recipe.contents[index].content
                                    )
                                    .frame(width:screen.width*0.7)
                                    
//                                    if (procedureImages[index] != nil) {
                                        ImageButton(
                                            showModal: $showModal,
                                            pickerImageIndex: $pickerImageIndex,
                                            procedureImage: $procedureImages[index],
                                            showPicker: $shouldShowProcedureImagePicker[index],
                                            showCropper: $shouldShowProcedureImageCropper[index],
                                            change: $procedureImageChanged[index],
                                            width: screen.width,
                                            index: index
                                        )
//                                    }
                                }
                                .padding(.horizontal)
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
                                    contents: $recipe.contents,
                                    imageChanges: $procedureImageChanged,
                                    pickers: $shouldShowProcedureImagePicker,
                                    croppers: $shouldShowProcedureImageCropper,
                                    draggedItem: $draggedItem
                                )
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    BannerAd(unitID: Constants.bannerAdId)
                        .background(.blue)
                }
                .padding(.top)
            }
            .overlay(
                HStack {
                    Button(action:{
                        dismiss()
                    }){
                        HStack(spacing: 10) {
                            Image(systemName: "xmark")
                                .renderingMode(.template)
                        }
                        .foregroundColor(.red)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(.red.opacity(0.15))
                        .clipShape(Capsule())
                    }
                    Spacer()
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
                        procedureTmp.append(UUID().uuidString)
                        procedureImageChanged.append(false)
                        shouldShowProcedureImagePicker.append(false)
                        shouldShowProcedureImageCropper.append(false)
                        procedureImages.append(nil)
                        print("add!!!")
                        print(self.recipe.contents.count)
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
                    
                    Button(action: {
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
            .onTapGesture{
                hideKeyboard()
            }
            .background(.black)
            
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
                        if procedureImages[pickerImageIndex] != nil {
                            procedureImageChanged[pickerImageIndex] = true
                        }
                        procedureImages[pickerImageIndex] = nil
                        self.recipe.contents[pickerImageIndex].image = ""
                    }
                },
                .cancel() {
                    showModal.toggle()
                }
            ])
        })
        .onAppear(){
//            UITextView.appearance().backgroundColor = .clear
            screen = UIScreen.main.bounds.size
            load()
        }
//        onDisappear() {
//            UITextView.appearance().backgroundColor = nil
//        }
    }
}

struct EditTitleView: View {
    @Binding var contents: [Procedure]
    @Binding var oldProcedureIds: [String]
    @Binding var deleteProcedures: [Procedure]
    @Binding var shouldShowProcedureImagePicker: [Bool]
    @Binding var shouldShowProcedureImageCropper: [Bool]
    @Binding var procedureImages: [UIImage?]
    @Binding var procedureTmp: [String]
    
    var index: Int
    var height: CGFloat
    
    var body: some View {
        HStack {
            Text("手順\(index+1)")
                .font(.system(size: 20,weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 8)
            if index >= 1 {
                Button(action: {
                    if oldProcedureIds.contains(where: {$0 == contents[index].id}) {
                        deleteProcedures.append(contents[index])
                    }
                    contents.remove(at: index)
                    shouldShowProcedureImagePicker.remove(at: index)
                    shouldShowProcedureImageCropper.remove(at: index)
                    procedureImages.remove(at: index)
                    procedureTmp.remove(at: index)
                }, label: {
                    Image(systemName: "xmark.circle")
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .clipShape(Circle())
                        .frame(width:16)
                })
            }
            Spacer()
        }
        .frame(height: height*0.05)
    }
}
