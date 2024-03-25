//
//  ListCardImage.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

struct ListCardImage: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { $0.resizable() }
        placeholder: { ProgressView() }
            .scaledToFit()
    }
}

#if DEBUG
#Preview { ListCardImage(url: "https://cdn2.thecatapi.com/images/5iYq9NmT1.jpg") }
#endif
