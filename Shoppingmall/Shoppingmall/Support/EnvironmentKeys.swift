//
//  EnvironmentKeys.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 04.10.2023.
//

import SwiftUI

private struct IsLandscapeKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isLandscape: Bool {
        get { self[IsLandscapeKey.self] }
        set { self[IsLandscapeKey.self] = newValue }
    }
}
