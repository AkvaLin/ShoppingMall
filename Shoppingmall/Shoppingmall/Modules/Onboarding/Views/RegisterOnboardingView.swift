//
//  RegisterOnboardingView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 05.10.2023.
//

import SwiftUI

struct RegisterOnboardingView: View {
    var body: some View {
        ZStack {
            Color.darkGray
            VStack {
                Image(.registerOnboarding)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .padding(.top, 51)
                Group {
                    Text("registration")
                        .font(
                            Font.custom("GraphikTrial-Regular", size: 32)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .padding(.horizontal, 57)
                        .padding(.top, 2)
                    Text("bePart")
                        .font(
                            Font.custom("GraphikTrial-Regular", size: 16)
                                .weight(.medium)
                        )
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal, 24)
                        .padding(.top, 12)
                }
                .multilineTextAlignment(.center)
                Group {
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("signUp")
                                .font(
                                    Font.custom("GraphikTrial-Regular", size: 16)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(.blue))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(.white)
                        .clipShape(.rect(cornerRadius: 8))
                    }
                    .padding(.top, 32)
                    Button {
                        
                    } label: {
                        Text("signIn")
                            .font(
                                Font.custom("GraphikTrial-Regular", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 64)
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    RegisterOnboardingView()
}
