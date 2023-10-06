//
//  ContentView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 02.10.2023.
//

import SwiftUI
import Combine

struct MainTabView: View {
    
    @StateObject private var viewModel = MainTabViewModel()
    
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
                .environment(\.isLandscape, viewModel.isLandscape)
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
        .onAppear(perform: {
            UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont(name: "GraphikTrial-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)], for: [])
        })
        .onInterfaceOrientationChange { orientation in
            viewModel.isLandscape = orientation.isLandscape
        }
        .fullScreenCover(isPresented: $viewModel.showOnboarding) {
            OnboardingView(isPresented: $viewModel.showOnboarding)
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

#Preview("Dark") {
    MainTabView()
        .preferredColorScheme(.dark)
}
