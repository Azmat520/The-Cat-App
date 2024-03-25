//
//  ContentView.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

enum TabViews { case Favorite, Cats }

struct ContentView: View {
    @StateObject private var viewModel = CatListViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selection) {
            FavoriteCatView()
                .environmentObject(viewModel)
                .tabItem { Image(systemName: "heart") }
                .tag(TabViews.Favorite)
            
            CatListView()
                .environmentObject(viewModel)
                .tabItem { Image(systemName: "cat") }
                .tag(TabViews.Cats)
        }
    }
}

#Preview {
    ContentView()
}
