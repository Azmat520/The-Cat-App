//
//  ContentView.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

enum TabViews { case Favorite, Cats }

struct ContentView: View {
    @State private var selection: TabViews = .Cats
    var body: some View {
        TabView(selection: $selection) {
            CatListView()
                .tabItem { Image(systemName: "cat") }
                .tag(TabViews.Cats)
            
            FavoriteCatView()
                .tabItem { Image(systemName: "heart") }
                .tag(TabViews.Favorite)
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
