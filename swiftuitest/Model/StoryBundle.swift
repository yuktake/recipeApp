//
//  StoryBundle.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/11/30.
//

import SwiftUI

struct StoryBundle: Identifiable {
    var id = UUID().uuidString
    var profileName: String
    var profileImage: Data
    var isSeen: Bool = false
    var stories: [Review]
}

//struct Story: Identifiable {
//    var id = UUID().uuidString
//    var imageURL: String
//}
