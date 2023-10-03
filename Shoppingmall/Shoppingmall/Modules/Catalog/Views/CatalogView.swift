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
            Text("Каталог")
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
                            Color(red: 0.95, green: 0.69, blue: 0.67)
                        }
                        CatalogItemView(label: "food") {
                            Image("FoodBackground")
                                .resizable()
                        }
                    }
                    HStack(spacing: 8) {
                        CatalogItemView(label: "entertainment") {
                            Image("EntertainmentBackground")
                                .resizable()
                        }
                        
                        CatalogItemView(label: "services") {
                            Image("ServicesBackground")
                                .resizable()
                        }
                    }
                    HStack(spacing: 8) {
                        CatalogItemView(label: "sport") {
                            Image("SportBackground")
                                .resizable(resizingMode: /*@START_MENU_TOKEN@*/.stretch/*@END_MENU_TOKEN@*/)
                        }
                        CatalogItemView(label: "cinema") {
                            Color(red: 0.24, green: 0.23, blue: 1)
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

#Preview {
    CatalogView()
}
