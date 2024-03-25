//
//  TemperamentView.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

struct TemperamentView: View {
    let temperament: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Temperament:")
                .font(.headline)
            LazyVGrid(columns: [GridItem(),GridItem(), GridItem(), GridItem()], content: {
                ForEach(temperament.components(separatedBy: ", "), id: \.self) {
                    Text($0)
                        .font(.caption2)
                        .padding(5)
                        .background(Color.random)
                        .clipShape(Capsule())
                }
            })
        }
    }
}

#if DEBUG
#Preview { TemperamentView(temperament: DefaultCatObject.temperament) }
#endif
