//
//  ShoppingOnboardingView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 04.10.2023.
//

import SwiftUI

struct SimpleOnboardingView: View {
    
    private let image: Image
    private let label: LocalizedStringKey
    private let backgroundColor: Color
    
    init(image: Image, label: LocalizedStringKey, backgroundColor: Color) {
        self.image = image
        self.label = label
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(backgroundColor)
                .padding([.leading, .trailing], 24)
            VStack {
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .padding(.top, 24)
                Text(label)
                    .font(
                        Font.custom("GraphikTrial-Regular", size: 32)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .padding(.horizontal, 82)
                    .padding(.top, 24)
                    .padding(.bottom, 48)
            }
        }
    }
}

#Preview {
    SimpleOnboardingView(image: Image("ShoppingOnboardingImage"), 
                         label: "shoppingAndRecreation",
                         backgroundColor: Color(red: 0.24, green: 0.23, blue: 1))
}

#Preview {
    SimpleOnboardingView(image: Image("SpecialPrivilegesImage"),
                         label: "specialPrivileges",
                         backgroundColor: Color(red: 0.95,
                                                green: 0.69,
                                                blue: 0.67))
}
