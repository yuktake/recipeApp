//
//  Recipe.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Amplify

struct RecipeData:Identifiable,Codable {
    var id = UUID().uuidString
    var userId:String
    var title: String
    var protein:String
    var fat:String
    var carbo:String
    var state:Int
    var materials: String
    var contents:[Procedure]
    var reviews: [Review]
    var image: String
    var favNum: Int
    var create_at:String
    var update_at:String
    var delFlg: Int
}

func save(_ recipes: [RecipeData]) {
    let data = recipes.map { try? JSONEncoder().encode($0) }
    UserDefaults.standard.set(data, forKey: "favs")
}

func load() -> [RecipeData] {
    guard let encodedData = UserDefaults.standard.array(forKey: "favs") as? [Data] else {
        return []
    }
    return encodedData.map {
        try! JSONDecoder().decode(RecipeData.self, from: $0)
    }
}
