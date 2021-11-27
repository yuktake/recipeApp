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
    Intro(
        image: "tutorial2",
        title: "できること",
        description: "このアプリでは皆さんに投稿していただいた\n1人分の簡単レシピをカロリーやPFC別に検索することができます。",
        color: Color.blue
    ),
    Intro(
        image: "tutorial1",
        title: "運動をされている方",
        description: "体型管理を目的としているため\nレシピの工程はシンプルなものばかりです。",
        color: Color.yellow
    ),
    Intro(
        image: "tutorial3",
        title: "あなたのレシピ",
        description: "あなたのおすすめのレシピがあれば\nぜひ共有してみてください！",
        color: Color.pink
    )
]
