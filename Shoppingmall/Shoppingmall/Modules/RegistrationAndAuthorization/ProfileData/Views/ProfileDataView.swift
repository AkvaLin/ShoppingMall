//
//  ProfileDataView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 10.10.2023.
//

import SwiftUI

struct ProfileDataView: View {
    
    enum FocusField {
        case name, surname, email
    }
    
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var viewModel = ProfileDataViewModel()
    
    @FocusState var focusedField: FocusField?
    
    var body: some View {
        VStack {
            Text("registration")
                .font(.custom("GraphikTrial-Regular", size: 16))
                .padding(.vertical, 40)
                .multilineTextAlignment(.center)
            Group {
                Group {
                    Text("name")
                    LightGrayRoundedTextField("john", text: $viewModel.form.name)
                        .textContentType(.name)
                        .focused($focusedField, equals: .name)
                    if viewModel.showNameError {
                        Text("incorrectData")
                            .font(.custom("GraphikTrial-Regular", size: 14))
                            .foregroundStyle(.red)
                    }
                    Text("surname")
                    LightGrayRoundedTextField("johnson", text: $viewModel.form.surname)
                        .textContentType(.familyName)
                        .focused($focusedField, equals: .surname)
                    if viewModel.showSurnameError {
                        Text("incorrectData")
                            .font(.custom("GraphikTrial-Regular", size: 14))
                            .foregroundStyle(.red)
                    }
                    Text("e-mail")
                    LightGrayRoundedTextField("emailPlaceholder \("@")", text: $viewModel.form.email)
                        .focused($focusedField, equals: .email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    if viewModel.showEmailError {
                        Text("incorrectData")
                            .font(.custom("GraphikTrial-Regular", size: 14))
                            .foregroundStyle(.red)
                    }
                }
                .autocorrectionDisabled()
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.custom("GraphikTrial-Regular", size: 16))
                .padding(.top, 8)
                BlueButton {
                    
                } label: {
                    Text("save")
                }
                .padding(.top, 48)
                .disabled(viewModel.saveButtonDisabled)
            }
            .padding(.horizontal, 24)
            Spacer()
        }
        .onAppear {
            focusedField = .name
        }
        .onSubmit {
            if focusedField == .name {
                focusedField = .surname
            } else if focusedField == .surname {
                focusedField = .email
            } else if focusedField == .email {
                focusedField = nil
            }
        }
        .onChange(of: focusedField) { _ in
            print(focusedField)
            viewModel.checkFieldError()
            switch focusedField {
            case .name:
                viewModel.showNameError = false
                viewModel.previousFocusedField = "name"
            case .surname:
                viewModel.showSurnameError = false
                viewModel.previousFocusedField = "surname"
            case .email:
                viewModel.showEmailError = false
                viewModel.previousFocusedField = "email"
            case nil:
                break
            }
        }
    }
}

#Preview {
    ProfileDataView()
}
