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
                .tabItem { Text("Home") }
            CatalogView()
                .tabItem { Text("Catalog") }
            BonusView()
                .tabItem { Text("Bonus") }
            MenuView()
                .tabItem { Text("Menu") }
        }
    }
}

#Preview {
    MainTabView()
}
