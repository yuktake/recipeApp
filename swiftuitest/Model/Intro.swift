//
//  Intro.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/11/20.
//

import SwiftUI

struct Intro: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
}

var intros: [Intro] = [
    Intro(image: "food", title: "title1", description: "description", color: Color.blue),
    Intro(image: "food2", title: "title2", description: "description2", color: Color.yellow),
    Intro(image: "food3", title: "title3", description: "description3", color: Color.pink)
]
