//
//  RegisterOnboardingView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 05.10.2023.
//

import SwiftUI

struct RegisterOnboardingView: View {
    
    @State private var isLoginViewPresented = false
    @State private var isRegisterViewPresented = false
    @Binding var isOnboardingPresented: Bool
    
    var body: some View {
        ZStack {
            Color.customDarkGray
            VStack {
                Image(.registerOnboarding)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .padding(.top, 51)
                Group {
                    Text("registration")
                        .font(
                            Font.custom("GraphikTrial-Regular", size: 32)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .padding(.horizontal, 57)
                        .padding(.top, 2)
                    Text("bePart")
                        .font(
                            Font.custom("GraphikTrial-Regular", size: 16)
                        )
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal, 24)
                        .padding(.top, 12)
                }
                .multilineTextAlignment(.center)
                Group {
                    Button {
                        isRegisterViewPresented = true
                    } label: {
                        Text("signUp")
                            .font(
                                Font.custom("GraphikTrial-Regular", size: 16)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color(.customBlue))
                            .padding(.vertical, 8)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: 8))
                    }
                    .padding(.top, 32)
                    Button {
                        isLoginViewPresented = true
                    } label: {
                        Text("signIn")
                            .font(
                                Font.custom("GraphikTrial-Regular", size: 14)
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 64)
                }
                .padding(.horizontal, 24)
            }
        }
        .fullScreenCover(isPresented: $isRegisterViewPresented) {
            PhoneNumberView(title: "registration", subTitle: "one-timeCode", isPresented: $isRegisterViewPresented)
                .onDisappear {
                    dismissOnboarding()
                }
        }
        .fullScreenCover(isPresented: $isLoginViewPresented) {
            PhoneNumberView(title: "authorization", subTitle: "one-timeCode", isPresented: $isLoginViewPresented)
                .onDisappear {
                    dismissOnboarding()
                }
        }
    }
    
    private func dismissOnboarding() {
        isOnboardingPresented = false
        UserDefaults.standard.hasOnboarded = true
    }
}

#Preview {
    RegisterOnboardingView(isOnboardingPresented: .constant(true))
}
