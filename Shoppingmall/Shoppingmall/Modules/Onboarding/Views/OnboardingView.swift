//
//  OnboardingView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 04.10.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        VStack {
            Image(.shoppingmallLabel)
                .padding([.leading, .trailing], 24)
                .padding(.top, 40)
            TabView {
                SimpleOnboardingView(image: Image(.shoppingOnboarding),
                                     label: "shoppingAndRecreation",
                                     backgroundColor: Color(.blue))
                SimpleOnboardingView(image: Image(.specialPrivileges),
                                     label: "specialPrivileges",
                                     backgroundColor: Color(.coralPink))
                NotificationOnboardingView()
            }
            .shadow(radius: 10)
            .tabViewStyle(.page)
            .padding(.top, 24)
            Button {
                
            } label: {
                HStack {
                    Spacer()
                    Text("skip")
                        .font(
                            Font.custom("GraphikTrial-Regular", size: 14)
                        )
                        .foregroundStyle(Color(red: 0.75, green: 0.75, blue: 0.75))
                }
            }
            .buttonStyle(.plain)
            .padding([.leading, .trailing], 24)
            .padding(.bottom, 51)
            .padding(.top, 16)
        }
    }
}

#Preview {
    OnboardingView()
}
