//
//  CodeView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 10.10.2023.
//

import SwiftUI
import Combine

struct CodeView: View {
    
    private var title: LocalizedStringKey
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = CodeViewModel()
    
    init(title: LocalizedStringKey) {
        self.title = title
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text(title)
                    .font(.custom("GraphikTrial-Regular", size: 16))
                    .padding(.vertical, 40)
                    .multilineTextAlignment(.center)
                Group {
                    Text("enterCode")
                        .font(.custom("GraphikTrial-Regular", size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    LightGrayRoundedTextField("012345", text: $viewModel.code)
                        .foregroundStyle(viewModel.isCodeValid ? (colorScheme == .light ? .black : .white) : .red)
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .padding(.top, 16)
                        .onReceive(Just(viewModel.code)) { newValue in
                            var filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered.count >= 6 {
                                filtered = String(filtered.prefix(6))
                            }
                            if filtered != newValue {
                                viewModel.code = filtered
                            }
                        }
                        .disabled(viewModel.codeSended)
                    Group {
                        if viewModel.isCodeValid {
                            if viewModel.sendButtonDisabled {
                                Text("repeatedCode \(viewModel.timeLeft)")
                                    .foregroundStyle(Color(.customLightGray))
                            }
                        } else {
                            Text("incorrectCode")
                                .foregroundStyle(.red)
                        }
                    }
                    .font(.custom("GraphikTrial-Regular", size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 8)
                    BlueButton {
                        viewModel.getCode(seconds: 15)
                    } label: {
                        if viewModel.isInitialCodeSend {
                            Text("sendAgain")
                        } else {
                            Text("send")
                        }
                    }
                    .disabled(viewModel.sendButtonDisabled || viewModel.codeSended)
                    .padding(.top, 48)
                }
                .padding(.horizontal, 24)
                Spacer()
            }
            if viewModel.codeSended {
                ProgressView()
            }
        }
    }
}

#Preview {
    CodeView(title: "registration")
}
