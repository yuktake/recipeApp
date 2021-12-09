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
    
    @State var error = false
    @State var title = "" {
        didSet {
            if title.count > 30 && oldValue.count <= 30 {
                title = oldValue
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
        image: "",
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
        title.count > 30
    }
    
    func load() {
        if (!firstLoad) {
            print("not first load")
            return
        }
        self.recipe = detail_recipe
        self.title = detail_recipe.title
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
            title: self.title,
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
                case .success(let recipe):
                    print("Successfully updated recipe: \(recipe)")
                    if let firstIndex = user.myRecipes.firstIndex(where: {$0.id == recipe.id}) {
                        DispatchQueue.main.async {
                            self.user.myRecipes[firstIndex].title = recipe.title
                        }
                    }
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
        ZStack(alignment: .top) {
            Color.black.edgesIgnoringSafeArea(.all)
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
                    FormView(iconImage: "pencil", placeholder: "TITLE", numberPad: false, text: $title)
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
                                TitleView(
                                    contents: $recipe.contents,
                                    index: index,
                                    height: screen.height
                                )
                                
                                HStack(spacing: 8) {
                                    TextAreaView(
                                        contents: $recipe.contents[index].content
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
                                    contents: $recipe.contents,
                                    draggedItem: $draggedItem
                                )
                            )
                        }
                    }
                    BannerAd(unitID: "ca-app-pub-5558779899182260/4197512760")
                }
                .padding(.top)
            }
            .overlay(
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
                        procedureTmp.append(UUID().uuidString)
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
