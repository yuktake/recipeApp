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
    var calorie: String
    var protein:String
    var fat:String
    var carbo:String
    var state:Int
    var materials: String
    var contents:[Procedure]
    var reviews: [Review]
    var favNum: Int
    var fav_created_at: String?
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

extension UserDefaults {
    func load<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }
 
    func sets<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self.set(data, forKey: key)
    }
}
