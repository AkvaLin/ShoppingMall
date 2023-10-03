//
//  ContentView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 02.10.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Text("home") }
            CatalogView()
                .tabItem { Text("catalog") }
            BonusView()
                .tabItem { Text("bonus") }
            MenuView()
                .tabItem { Text("menu") }
        }
    }
}

#Preview("Eng") {
    MainTabView()
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("Rus") {
    MainTabView()
        .environment(\.locale, .init(identifier: "ru"))
}
