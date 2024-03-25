//
//  FavoriteCatView.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

struct FavoriteCatView: View {
    @EnvironmentObject var viewModel: CatListViewModel
    
    var body: some View {
        NavigationStack {
            if viewModel.favoriteCatList.isEmpty { EmptyView }
            else { ListView }
        }
    }
    
    var EmptyView: some View {
        VStack {
            Text("You don't have favorite cats yet. \n\n Press 'Explore' to browse the list of cats and press ❤️ to add it to the list.")
                .multilineTextAlignment(.center)
            Button("Explore", action: viewModel.exploreList)
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .padding(.top)
        }
    }
    
    var ListView: some View {
        AdaptiveView(axis: .vertical) {
            VStack(spacing: defaultSpacing) {
                ForEach(viewModel.favoriteCatList) { cat in
                    NavigationLink(value: cat) {
                        ListCard(pet: cat,
                                 toggleFavorite: viewModel.toggleFavorite(_:),
                                 isFavorite: viewModel.isFavorite(cat))
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("The Favorite Cats")
            .navigationDestination(for: Cat.self) {
                CatListDetailView(pet: $0)
            }
        }
    }
}

#if DEBUG
#Preview { FavoriteCatView().environmentObject(CatListViewModel()) }
#endif
