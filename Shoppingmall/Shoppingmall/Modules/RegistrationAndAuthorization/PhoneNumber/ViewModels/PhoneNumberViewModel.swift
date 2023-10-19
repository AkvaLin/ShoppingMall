//
//  PhoneNumberViewModel.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 07.10.2023.
//

import Combine

class PhoneNumberViewModel: ObservableObject {
    
    @Published var phoneNumber = ""
    @Published var isDoneButtonActive = false
    @Published var isPhoneTextFieldEditing = false
    @Published var showInvalidNumberAlert = false
    @Published var isCodeViewPresented = false

    public var validNumber = ""
    
    public func setNumber(_ number: String) {
        validNumber = number
    }
}
