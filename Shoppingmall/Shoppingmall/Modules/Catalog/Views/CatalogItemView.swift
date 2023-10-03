//
//  CatalogItemView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 03.10.2023.
//

import SwiftUI

struct CatalogItemView<BackgroundView: View>: View {
    
    @Environment(\.isLandscape) var isLandscape: Bool
    
    private let background: BackgroundView
    private let label: LocalizedStringKey
    
    init(label: LocalizedStringKey, @ViewBuilder background: () -> BackgroundView) {
        self.background = background()
        self.label = label
    }
    
    var body: some View {
        ZStack {
            if !isLandscape {
                Color.clear
                    .overlay {
                        background
                            .scaledToFill()
                    }
                    .clipped()
                    .aspectRatio(1, contentMode: .fit)
            } else {
                Color.clear
                    .overlay {
                        background
                            .scaledToFill()
                    }
                    .clipped()
            }
            Text(label)
                .font(
                    Font.custom("GraphikTrial-Regular", size: 18)
                )
        }
        .clipShape(.rect(cornerRadius: 12))
        .foregroundStyle(.white)
    }
}

struct CatalogItemView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItemView(label: "Test", background: { Color.mint })
            .previewLayout(.fixed(width: 50, height: 50))
    }
}
