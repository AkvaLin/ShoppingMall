//
//  BlueButton.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 10.10.2023.
//

import SwiftUI

struct BlueButton<Label>: View where Label : View {
    
    private var action: () -> Void
    private var label: Label
    
    init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
        self.action = action
        self.label = label()
    }
    
    var body: some View {
        Button(action: action) {
            label
                .font(.custom("GraphikTrial-Regular", size: 14))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 4)
        }
        .tint(Color(.customBlue))
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 8))
    }
}
