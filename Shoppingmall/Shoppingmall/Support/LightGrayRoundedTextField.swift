//
//  LightGrayRoundedTextField.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 10.10.2023.
//

import SwiftUI

struct LightGrayRoundedTextField: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @Binding var text: String
    private var title: LocalizedStringKey
    
    init(_ title: LocalizedStringKey, text: Binding<String>) {
        self._text = text
        self.title = title
    }
    
    var body: some View {
        TextField(title, text: $text)
            .font(.custom("GraphikTrial-Regular", size: 14))
            .padding(.vertical, 8.5)
            .padding(.horizontal, 16)
            .background(colorScheme == .light ? Color(red: 0.96,
                                                      green: 0.96,
                                                      blue: 0.96) : .clear)
            .clipShape(.rect(cornerRadius: 8))
    }
}
