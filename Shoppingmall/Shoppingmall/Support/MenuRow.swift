//
//  MenuRow.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 20.10.2023.
//

import SwiftUI

struct MenuRow<Destination>: View where Destination : View {
    
    private let image: Image
    private let title: LocalizedStringKey
    private let destination: Destination
    
    init(image: Image, title: LocalizedStringKey, @ViewBuilder destination: () -> Destination) {
        self.image = image
        self.title = title
        self.destination = destination()
    }
    
    var body: some View {
        NavigationLink(destination: {
            destination
        }, label: {
            Label(
                title: {
                    Text(title)
                        .font(.custom("GraphikTrial-Regular", size: 16))
                },
                icon: {
                    image
                        .foregroundStyle(.customBlue)
                        .padding([.vertical, .trailing], 8)
                }
            )
        })
    }
}

#Preview {
    MenuRow(image: Image(.diamond), title: "bonus") { BonusView() }
}
