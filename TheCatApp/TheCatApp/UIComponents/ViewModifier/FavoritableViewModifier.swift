//
//  FavoritableViewModifier.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

struct FavoritableViewModifier: ViewModifier {
    var isFavorite: Bool
    let toggleFavorite: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .topTrailing) {
                Image(systemName: "heart" + (isFavorite ? ".fill" : ""))
                    .font(.title)
                    .padding()
                    .foregroundStyle(.red)
                    .onTapGesture(perform: toggleFavorite)
            }
    }
}

extension View {
    func favoritable(isFavorite: Bool, toggleFavorite: @escaping ()->Void) -> some View
    {
        return self.modifier(FavoritableViewModifier(isFavorite: isFavorite, toggleFavorite: toggleFavorite))
    }
}
