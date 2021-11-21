//
//  TabBar.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI

struct TabBar: View {
    @State private var home = UUID()
    @State private var search = UUID()
    @State private var favorite = UUID()
    @State private var profile = UUID()
    @State var tabSelection = 1
    @State private var tappedTwice = false
    
    var body: some View {
        var handler: Binding<Int> { Binding(
            get : {
                return self.tabSelection
            },
            set : {
                if $0 == self.tabSelection {
                    self.tappedTwice = true
                } else {
                    self.tabSelection = $0
                }
            }
        )}
        return TabView(selection: handler) {
            NavigationView {
                Home()
                    .id(home)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                        guard tappedTwice else { return }
                        home = UUID()
                        self.tappedTwice = false
                    })
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(1)
            
            NavigationView {
                Search()
                    .id(search)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                        guard tappedTwice else { return }
                        search = UUID()
                        self.tappedTwice = false
                    })
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .tag(2)
            
            
            NavigationView {
                Favorite()
                    .id(favorite)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                        guard tappedTwice else { return }
                        favorite = UUID()
                        self.tappedTwice = false
                    })
            }
            .tabItem {
                Image(systemName: "heart.text.square")
                Text("Fav")
            }
            .tag(3)
            
            NavigationView {
                ProfileView(tabSelection: $tabSelection)
                    .id(profile)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                        guard tappedTwice else { return }
                        profile = UUID()
                        self.tappedTwice = false
                    })
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
            .tag(4)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(UserStore())
    }
}
