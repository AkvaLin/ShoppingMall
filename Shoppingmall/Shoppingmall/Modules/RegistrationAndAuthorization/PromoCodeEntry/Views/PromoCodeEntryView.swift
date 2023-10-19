//
//  PromoCodeEntryView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 19.10.2023.
//

import SwiftUI

struct PromoCodeEntryView: View {
    
    @StateObject private var viewModel = PromoCodeEntryViewModel()
    
    var body: some View {
        VStack {
            Text("getPointsFromFriend")
                .font(.custom("GraphikTrial-Regular", size: 16))
                .padding(.top, 40)
                .padding(.bottom, 48)
            Group {
                Text("enterPromoCode")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 16)
                LightGrayRoundedTextField("", text: $viewModel.promoCode)
                    .padding(.bottom, 8)
                Text("getItFromFriend")
                    .font(.custom("GraphikTrial-Regular", size: 14))
                    .foregroundStyle(.customLightGray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 48)
                BlueButton {
                    
                } label: {
                    Text("getPoints")
                }
                .padding(.bottom, 16)
                Button("noPromoCode") {
                    
                }
                .foregroundStyle(.customBlue)
                .font(.custom("GraphikTrial-Regular", size: 14))
            }
            .padding(.horizontal, 24)
            Spacer()
        }
    }
}

#Preview {
    PromoCodeEntryView()
}
