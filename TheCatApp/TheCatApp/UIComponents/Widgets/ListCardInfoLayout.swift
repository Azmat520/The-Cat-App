//
//  ListCardInfoLayout.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

struct ListCardInfoLayout: View {
    let label: String
    let value: String
    
    private let maxLetterCount = 30
    
    var body: some View {
        let layout = label.count + value.count > maxLetterCount ?
                    AnyLayout(VStackLayout(alignment:. leading)) :
                    AnyLayout(HStackLayout(alignment: .top))
        
        layout {
            Text(label)
                .font(.headline)
            Text(value)
                .font(.subheadline)
        }
    }
}

#if DEBUG
#Preview { ListCardInfoLayout(label: "Name:", value: "Tom") }
#endif
