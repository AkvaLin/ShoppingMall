//
//  NotificationOnboardingView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 05.10.2023.
//

import SwiftUI

struct NotificationOnboardingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.blue)
                VStack {
                    Image(.notificationOnboarding)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    Group {
                        Text("findOutFirst")
                            .font(
                                Font.custom("GraphikTrial-Regular", size: 32)
                                    .weight(.medium)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .padding(.horizontal, 74)
                            .padding(.top, 2)
                        Text("allowNotifications")
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
                                Text("allow")
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
                        NavigationLink {
                            RegisterOnboardingView()
                                .navigationBarHidden(true)
                        } label: {
                            Text("later")
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
        .clipShape(.rect(cornerRadius: 16))
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .padding([.leading, .trailing], 24)
    }
}

#Preview {
    NotificationOnboardingView()
}