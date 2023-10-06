//
//  MainTabViewModel.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 06.10.2023.
//

import Foundation
import Combine

class MainTabViewModel: ObservableObject {
    @Published var isLandscape: Bool = false
    @Published var showOnboarding: Bool = !UserDefaults.standard.hasOnboarded
}
