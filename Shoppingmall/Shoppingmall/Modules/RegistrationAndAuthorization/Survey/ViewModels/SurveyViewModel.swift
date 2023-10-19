//
//  SurveyViewModel.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 19.10.2023.
//

import Foundation
import Combine

class SurveyViewModel: ObservableObject {

    enum Children: String, CaseIterable, Identifiable {
        case yes, no
        var id: Self { self }
    }
    
    @Published var date: Date = Date()
    @Published var haveChildren: Children = .no
    @Published var showDatePicker = false
}
