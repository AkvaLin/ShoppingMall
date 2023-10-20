//
//  BonusView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 03.10.2023.
//

import SwiftUI

struct BonusView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("bonus")
                        .font(.custom("GraphikTrial-Regular", size: 24))
                    Spacer()
                    ScroingLabelView(backgroundColor: .customBlue, foregroundColor: .white)
                        .scaleEffect(CGSize(width: 0.60, height: 0.60))
                        .padding(.trailing, -38)
                        .frame(height: 8)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 35)
                List {
                    MenuRow(image: Image(.diamond), title: "giftCatalog") { SurveyView() }
                    MenuRow(image: Image(.diamond), title: "pointsForFriends") { SurveyView() }
                    MenuRow(image: Image(.diamond), title: "myGifts") { SurveyView() }
                    MenuRow(image: Image(.diamond), title: "historyOfOperations") { SurveyView() }
                }
                .listStyle(.plain)
                .padding(.horizontal, 24)
                Spacer()
            }
        }
    }
}

#Preview {
    BonusView()
}
