//
//  CatalogView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 03.10.2023.
//

import SwiftUI

struct CatalogView: View {
    
    @Environment(\.isLandscape) var isLandscape: Bool
    
    var body: some View {
        VStack {
            Text("catalog")
                .font(
                    Font.custom("GraphikTrial-Regular", size: 24)
                )
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 24)
                .padding(.top, 40)
            Spacer()
            Group {
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        CatalogItemView(label: "shops") {
                            Color(.coralPink)
                        }
                        CatalogItemView(label: "food") {
                            Image(.foodBackground)
                                .resizable()
                        }
                    }
                    HStack(spacing: 8) {
                        CatalogItemView(label: "entertainment") {
                            Image(.entertainmentBackground)
                                .resizable()
                        }
                        
                        CatalogItemView(label: "services") {
                            Image(.servicesBackground)
                                .resizable()
                        }
                    }
                    HStack(spacing: 8) {
                        CatalogItemView(label: "sport") {
                            Image(.sportBackground)
                                .resizable(resizingMode: /*@START_MENU_TOKEN@*/.stretch/*@END_MENU_TOKEN@*/)
                        }
                        CatalogItemView(label: "cinema") {
                            Color(.blue)
                        }
                    }
                }
                .environment(\.isLandscape, isLandscape)
            }
            .padding([.leading, .trailing], 24)
            .padding(.top, 32)
            .padding(.bottom, !isLandscape ? 122 : 32)
        }
    }
}

#Preview("Light") {
    CatalogView()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    CatalogView()
        .preferredColorScheme(.dark)
}
