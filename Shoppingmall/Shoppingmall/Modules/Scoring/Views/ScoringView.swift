//
//  ScoringView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 13.10.2023.
//

import SwiftUI

struct ScoringView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color(.customDarkGray))
                .padding(.horizontal, 24)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.white)
                            .overlay {
                                Image(.cross)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(4)
                            }
                    }
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .padding(.trailing, 48)
                    .padding(.top, 23)
                }
                Spacer()
                ZStack {
                    VStack(spacing: 55) {
                        ScroingLabelView(backgroundColor: .white,
                                         foregroundColor: Color(.customBlue))
                        
                        .scaleEffect(CGSize(width: 0.75, height: 0.75))
                        .blur(radius: 3)
                        .rotationEffect(.degrees(-4.53))
                        ScroingLabelView(backgroundColor: .white,
                                         foregroundColor: Color(.customBlue))
                        
                        .scaleEffect(CGSize(width: 0.88, height: 0.88))
                        .blur(radius: 2)
                        .rotationEffect(.degrees(8.43))
                        .padding(.leading, 60)
                    }
                    .padding(.leading, -230)
                    VStack {
                        ScroingLabelView(backgroundColor: .white,
                                         foregroundColor: Color(.customBlue))
                        
                        .scaleEffect(CGSize(width: 0.88, height: 0.88))
                        .blur(radius: 2)
                        .rotationEffect(.degrees(7.03))
                        .padding(.top, 40)
                        ScroingLabelView(backgroundColor: .white,
                                         foregroundColor: Color(.customBlue))
                        .scaleEffect(CGSize(width: 0.58, height: 0.58))
                        .blur(radius: 4)
                        .rotationEffect(.degrees(-8.73))
                        .padding(.top, 40)
                    }
                    .padding(.top, 25)
                    .padding(.trailing, -250)
                    ScroingLabelView(backgroundColor: Color(.customBlue),
                                     foregroundColor: .white)
                    .padding(.horizontal, 83)
                }
                Spacer()
                Group {
                    Text("inClub")
                        .font(.custom("GraphikTrial-Regular", size: 32))
                        .foregroundStyle(.white)
                    Text("gift")
                        .font(.custom("GraphikTrial-Regular", size: 16))
                        .foregroundStyle(Color(.customLightGray))
                        .padding(.top, 12)
                        .padding(.bottom, 44)
                }
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 99)
            }
        }
        .padding(.vertical, 40)
        .shadow(radius: 12)
    }
}

#Preview {
    ScoringView()
}
