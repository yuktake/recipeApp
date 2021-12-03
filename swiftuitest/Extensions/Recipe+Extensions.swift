//
//  Recipe+Extensions.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/08/11.
//

import Foundation

extension Recipe: Identifiable{
}

extension Procedure: Identifiable{
    
}

extension Review: Identifiable{
    
}

extension UserDefaults {
    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }

    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self.set(data, forKey: key)
    }
}

protocol Storable {
    func data(forKey: String) -> Data?
    func set(_ data :Any?, forKey: String)
}

// テスト用スタブのため
extension UserDefaults: Storable{}

// 責務：データの永続化
struct StoreManager {

    let store: Storable

    init(store: Storable = UserDefaults.standard) {
        self.store = store
    }

    func save<T: Codable>(value: T, key: String) throws {
        do {
            let encodedData = try JSONEncoder().encode(value)
            store.set(encodedData, forKey: key)
        } catch let error {
            throw error
        }
    }

    func load<T: Codable>(key: String) -> T? {
        guard let data = store.data(forKey: key) else { return nil }
        do {
            let decode = try JSONDecoder().decode(T.self, from: data)
            return decode
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
