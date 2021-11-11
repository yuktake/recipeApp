//
//  swiftuitestApp.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Amplify
import AWSAPIPlugin
import AWSDataStorePlugin
import AWSCognitoAuthPlugin
import AWSS3StoragePlugin

@main
struct swiftuitestApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(UserStore())
                .environmentObject(FavStore())
                .environmentObject(RecipesViewModel())
//                .environmentObject(CreateRecipeViewModel())
                .environmentObject(UserRecipesViewModel())
                .environmentObject(Network())
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        do {
            // AmplifyModels is generated in the previous step
//            let apiPlugin = AWSAPIPlugin(modelRegistration: AmplifyModels())
            let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSAPIPlugin(modelRegistration:AmplifyModels()))
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.configure()
            print("Amplify configured with DataStore plugin")
        } catch {
            print("Failed to initialize Amplify with \(error)")
            return false
        }

        return true
    }
    
    // 必要に応じて処理を追加
    
}
