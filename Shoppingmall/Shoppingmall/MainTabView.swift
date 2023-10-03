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
                .tabItem { Label(
                    title: { Text("home") },
                    icon: { Image("HomeImage") }
                ) }
            CatalogView()
                .tabItem { Label(
                    title: { Text("catalog") },
                    icon: { Image("CatalogImage") }
                ) }
            BonusView()
                .tabItem { Label(
                    title: { Text("bonus") },
                    icon: { Image("BonusImage") }
                ) }
            MenuView()
                .tabItem { Label(
                    title: { Text("menu") },
                    icon: { Image("MenuImage") }
                ) }
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
