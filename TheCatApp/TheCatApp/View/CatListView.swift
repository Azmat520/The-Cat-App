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
        VStack {
            ForEach(viewModel.catList) { Text($0.name) }
        }
        .onAppear(perform: viewModel.getList)
    }
}

#if DEBUG
#Preview { CatListView() }
#endif
