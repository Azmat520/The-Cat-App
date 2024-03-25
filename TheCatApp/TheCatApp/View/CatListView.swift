//
//  CatListView.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

struct CatListView: View {
    @StateObject var viewModel: CatListViewModel = .init()
    
    var body: some View {
        NavigationStack {
            AdaptiveView(axis: .vertical) {
                LazyVStack(spacing: defaultSpacing) {
                    ForEach(viewModel.catList) { cat in
                        NavigationLink(value: cat) {
                            ListCard(pet: cat)
                                .padding(.horizontal)
                        }
                    }
                }
                .onAppear(perform: viewModel.getList)
                .navigationTitle("The Cat List")
                .navigationDestination(for: Cat.self) {
                    CatListDetailView(pet: $0)
                }
            }
        }
    }
}

#if DEBUG
#Preview { CatListView() }
#endif
