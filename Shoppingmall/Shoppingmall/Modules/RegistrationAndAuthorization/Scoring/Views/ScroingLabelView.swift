//
//  ScroingLabelView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 13.10.2023.
//

import SwiftUI

struct ScroingLabelView: View {
    
    private let backgroundColor: Color
    private let foregroundColor: Color
    
    init(backgroundColor: Color, foregroundColor: Color) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        Text("1500")
            .font(.custom("GraphikTrial-Regular", size: 30))
            .padding(.vertical, 18)
            .padding(.leading, 35)
            .padding(.trailing, 87.5)
            .overlay {
                HStack {
                    Spacer()
                    Image(.diamond)
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                }
                    .padding(.trailing, 35)
                    .padding(.vertical, 17.5)
            }
            .background { backgroundColor }
            .foregroundStyle(foregroundColor)
            .clipShape(.rect(cornerRadius: 17.5))
            .ignoresSafeArea()
    }
}

#Preview {
    ScroingLabelView(backgroundColor: Color(.customBlue),
                     foregroundColor: .white)
}
