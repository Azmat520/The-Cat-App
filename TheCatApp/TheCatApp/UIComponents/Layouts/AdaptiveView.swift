//
//  AdaptiveView.swift
//  TheCatApp
//
//  Created by Azmat Tursun on 25/03/2024.
//

import SwiftUI

struct AdaptiveView<Content: View>: View {
    var axis: Axis.Set
    var content: Content
    
    init(axis: Axis.Set, @ViewBuilder content: @escaping () -> Content) {
        self.axis = axis
        self.content = content()
    }
    
    var body: some View {
        ViewThatFits(in: axis) {
            content
            ScrollView { content }
        }
    }
}

#if DEBUG
#Preview { AdaptiveView(axis: .vertical) { } }
#endif
