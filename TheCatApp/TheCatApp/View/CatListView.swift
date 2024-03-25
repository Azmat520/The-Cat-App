//
//  CatListView.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

/// Future enhancement add posiblities to filter the list based on the temperament.

struct CatListView: View {
    @EnvironmentObject var viewModel: CatListViewModel
    
    var body: some View {
        NavigationStack {
            AdaptiveView(axis: .vertical) {
                VStack(spacing: defaultSpacing) {
                    ForEach(viewModel.filteredList, id: \.self) { cat in
                        NavigationLink(value: cat) {
                            ListCard(pet: cat,
                                     toggleFavorite: viewModel.toggleFavorite(_:),
                                     isFavorite: viewModel.isFavorite(cat))
                                .padding(.horizontal)
                        }
                    }
                }
                .onAppear(perform: viewModel.getList)
                .navigationTitle("The Cat List")
                .navigationDestination(for: Cat.self) {
                    CatListDetailView(pet: $0)
                }
                .searchable(text: $viewModel.searchTerm, prompt: "Search your favorite cat")
                .overlay {
                    /// Due to lack of time, added progress view instead of shimmer effect for loading.
                    if viewModel.isLoading { ProgressView() }
                }
            }
        }
    }
}

#if DEBUG
#Preview { CatListView().environmentObject(CatListViewModel()) }
#endif
