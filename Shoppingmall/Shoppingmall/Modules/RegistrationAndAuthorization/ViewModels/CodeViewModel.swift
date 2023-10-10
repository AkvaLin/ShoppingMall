//
//  CodeViewModel.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 10.10.2023.
//

import Foundation
import Combine

class CodeViewModel: ObservableObject {
    
    @Published var isInitialCodeSend = false
    @Published var sendButtonDisabled = false
    @Published var codeSended = false
    @Published var code = "" {
        didSet {
            if code.count == 6 {
                sendCode()
            }
        }
    }
    @Published var isCodeValid = true
    @Published var timeLeft = "0:15"
    @Published var secondsLeft: Int = 15 {
        didSet {
            self.timeLeft = "\(Int(secondsLeft / 60)):\(secondsLeft >= 10 ? "\(Int(secondsLeft % 60))" : "0\(Int(secondsLeft % 60))" )"
        }
    }
    
    private var storage: Set<AnyCancellable> = []
    
    private func startTimer(seconds: Int) {
        isInitialCodeSend = true
        secondsLeft = seconds
        sendButtonDisabled.toggle()
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        timer.sink { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.secondsLeft -= 1
            if strongSelf.secondsLeft == 0 {
                strongSelf.stopTimer(timer: timer)
            }
        }
        .store(in: &storage)
    }
    
    private func stopTimer(timer: Publishers.Autoconnect<Timer.TimerPublisher>) {
        timer.upstream.connect().cancel()
        sendButtonDisabled.toggle()
    }
    
    public func getCode(seconds: Int) {
        startTimer(seconds: 15)
    }
    
    public func sendCode() {
        codeSended = true
    }
}
