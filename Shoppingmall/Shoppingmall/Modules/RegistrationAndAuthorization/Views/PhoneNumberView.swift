//
//  PhoneNumberView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 07.10.2023.
//

import SwiftUI
import iPhoneNumberField

struct PhoneNumberView: View {
    
    private var title: LocalizedStringKey
    private var subTitle: LocalizedStringKey
    
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var isFocused: Bool
    @StateObject private var viewModel = PhoneNumberViewModel()
    @Binding var isPresented: Bool
    
    init(title: LocalizedStringKey, subTitle: LocalizedStringKey, isPresented: Binding<Bool>) {
        self.title = title
        self.subTitle = subTitle
        self._isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(title)
                    .font(
                        Font.custom("GraphikTrial-Regular", size: 16)
                    )
                    .padding(.vertical, 40)
                    .multilineTextAlignment(.center)
                Group {
                    Text("enterPhoneNumber")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    iPhoneNumberField("(123) 456-78-90", text: $viewModel.phoneNumber, isEditing: $viewModel.isPhoneTextFieldEditing)
                        .font(UIFont(name: "GraphikTrial-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16))
                        .maximumDigits(10)
                        .clearButtonMode(.whileEditing)
                        .flagHidden(false)
                        .flagSelectable(true)
                        .onEdit(perform: { number in
                            viewModel.isDoneButtonActive = number.isValidNumber
                            if number.isValidNumber {
                                viewModel.setNumber(number.phoneNumber?.numberString ?? "")
                            }
                        })
                        .focused($isFocused)
                        .keyboardType(.phonePad)
                        .textContentType(.telephoneNumber)
                        .padding(.vertical, 8.5)
                        .padding(.horizontal, 16)
                        .background(colorScheme == .light ? Color(red: 0.96, green: 0.96, blue: 0.96) : .clear)
                        .clipShape(.rect(cornerRadius: 8))
                        .padding(.top, 16)
                    Text(subTitle)
                        .font(
                            Font.custom("GraphikTrial-Regular", size: 14)
                        )
                        .foregroundStyle(Color(.lightGray))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 8)
                    Button {
                        isPresented = false
                    } label: {
                        Text("done")
                            .frame(maxWidth: .infinity)
                    }
                    .tint(Color(.blue))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 8))
                    .disabled(!viewModel.isDoneButtonActive)
                    .padding(.top, 48)
                    .onTapGesture {
                        if !viewModel.isDoneButtonActive {
                            viewModel.showInvalidNumberAlert.toggle()
                        }
                    }
                }
                .padding(.horizontal, 24)
                Spacer()
            }
            .onAppear {
                isFocused = true
            }
            .alert("invalidNumber",
                   isPresented: $viewModel.showInvalidNumberAlert,
                   actions: { Button("OK", role: .cancel) { } },
                   message: { Text("enterValidNumber") })
        }
    }
}

#Preview {
    PhoneNumberView(title: "registration", subTitle: "one-timeCode", isPresented: .constant(true))
}
