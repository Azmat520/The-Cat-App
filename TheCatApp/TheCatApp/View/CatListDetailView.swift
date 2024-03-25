//
//  CatListDetailView.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

struct CatListDetailView: View {
    let pet: AnimalProtocol
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ListCardImage(url: pet.image.url)
                VStack(alignment: .leading, spacing: 16) {
                    ListCardInfoLayout(label: "Origin:", value: pet.origin)
                    Text("Description:")
                        .font(.headline)
                    Text(pet.description)
                }
            }
            .vAlign(.top)
            .navigationTitle(pet.name)
        }
        .padding()
    }
}

#if DEBUG
#Preview { CatListDetailView(pet: DefaultCatObject) }
#endif
