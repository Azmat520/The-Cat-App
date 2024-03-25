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
        AdaptiveView(axis: .vertical) {
            VStack(spacing: defaultSpacing) {
                ForEach(viewModel.catList) { ListCard(pet: $0).padding(.horizontal) }
            }
            .onAppear(perform: viewModel.getList)
        }
    }
}

#if DEBUG
#Preview { CatListView() }
#endif
