//
//  ProfileDataViewModel.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 10.10.2023.
//

import Foundation

class ProfileDataViewModel: ObservableObject {
    
    @Published var form = Form()
    @Published var showNameError = false
    @Published var showSurnameError = false
    @Published var showEmailError = false
    public var previousFocusedField = "name"
    
    var saveButtonDisabled: Bool {
        !form.isValid
    }
    
    public func checkFieldError() {
        switch previousFocusedField {
        case "name":
            checkNameError()
        case "surname":
            checkSurnameError()
        case "email":
            checkEmailError()
        default:
            break
        }
    }
    
    private func checkNameError() {
        showNameError = !form.nameIsValid
    }
    
    private func checkSurnameError() {
        showSurnameError = !form.surnameIsValid
    }
    
    private func checkEmailError() {
        showEmailError = !form.emailIsValid
    }
}

struct Form {
    var name = ""
    var surname = ""
    var email = ""
    
    var nameIsValid: Bool {
        guard !name.isEmpty else { return false }
        return isValidName(name: name)
    }
    
    var surnameIsValid: Bool {
        guard !surname.isEmpty else { return false }
        return isValidName(name: surname)
    }
    
    var emailIsValid: Bool {
        guard !email.isEmpty else { return false }
        if email.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    var isValid: Bool {
        nameIsValid &&
        surnameIsValid &&
        emailIsValid
    }
    
    private func isValidName(name: String) -> Bool {
        let nameFormat = "(?:\\p{Lu}\\p{Ll}+)"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameFormat)
        return namePredicate.evaluate(with: name)
    }
}
