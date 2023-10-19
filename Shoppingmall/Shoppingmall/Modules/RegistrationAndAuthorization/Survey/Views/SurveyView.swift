//
//  SurveyView.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 19.10.2023.
//

import SwiftUI

struct SurveyView: View {
    
    @StateObject private var viewModel = SurveyViewModel()
    
    var body: some View {
        VStack {
            Text("survey")
                .padding(.vertical, 40)
            Group {
                HStack {
                    Text("1. ")
                        .font(.custom("GraphikTrial-Semibold", size: 16))
                    Text("birtday")
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 16)
                Button {
                    withAnimation(.easeInOut) {
                        viewModel.showDatePicker.toggle()
                    }
                } label: {
                    Text("\(viewModel.date.formatted(date: .long, time: .omitted))")
                        .frame(maxWidth: .infinity)
                        .font(.custom("GraphikTrial-Regular", size: 14))
                        .padding(.vertical, 8.5)
                        .padding(.horizontal, 16)
                        .clipShape(.rect(cornerRadius: 8))
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.primary)
                .padding(.bottom, 16)
                if viewModel.showDatePicker {
                    DatePicker("", selection: $viewModel.date, in: Date.now.addingTimeInterval(-3155760000)...Date.now, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }
                HStack {
                    Text("2. ")
                        .font(.custom("GraphikTrial-Semibold", size: 16))
                    Text("children")
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 16)
                .padding(.top, 48)
                Picker("", selection: $viewModel.haveChildren) {
                    Text("yes").tag(SurveyViewModel.Children.yes)
                    Text("no").tag(SurveyViewModel.Children.no)
                }
                .pickerStyle(.segmented)
                if !viewModel.showDatePicker {
                    BlueButton {
                        
                    } label: {
                        Text("save")
                    }
                    .padding(.top, 48)
                }
            }
            .labelsHidden()
            .padding(.horizontal, 24)
            Spacer()
        }
        .font(.custom("GraphikTrial-Regular", size: 16))
    }
}

#Preview("US") {
    SurveyView()
        .environment(\.locale, Locale(identifier: "us"))
}

#Preview("RU") {
    SurveyView()
        .environment(\.locale, Locale(identifier: "ru"))
}
