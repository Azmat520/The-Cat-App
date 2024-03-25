//
//  ListCard.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

struct ListCard: View {
    let pet: AnimalProtocol
    let toggleFavorite: (AnimalProtocol) -> Void
    var isFavorite: Bool
    
    var body: some View {
        VStack {
            ListCardImage(url: pet.image.url)
                .favoritable(isFavorite: isFavorite) {
                    toggleFavorite(pet)
                }
            
            VStack(alignment: .leading, spacing: 10) {
                ListCardInfoLayout(label: "Name:", value: pet.name)
                ListCardInfoLayout(label: "Origin:", value: pet.origin)
                TemperamentView(temperament: pet.temperament)
            }
            .padding(10)
            .background(.ultraThinMaterial)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 0)
    }
}

#if DEBUG
#Preview { ListCard(pet: Cat(id: "Short",
                             name: "British short hair",
                             origin: "UK",
                             weight: Weight(imperial: "8-18", metric: "8-18"),
                             image: CustomImageObject(id: "test",
                                                      width: 1268,
                                                      height: 966,
                                                      url: "https://cdn2.thecatapi.com/images/5iYq9NmT1.jpg"),
                             description: "random text",
                             temperament: "Affectionate, Dependent, Gentle, Intelligent, Playful, Hello, Test, mmooi"),
                    toggleFavorite: {_ in},
                    isFavorite: false) }
#endif
