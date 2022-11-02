//
//  viewModel.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 06/06/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var otpField = "" {
        didSet {
            guard otpField.count <= 5,
                  otpField.last?.isNumber ?? true else {
                      otpField = oldValue
                      return
                  }
        }
    }
    var otp1: String {
        guard otpField.count >= 1 else {
            return ""
        }
        return String(Array(otpField)[0])
    }
    var otp2: String {
        guard otpField.count >= 2 else {
            return ""
        }
        return String(Array(otpField)[1])
    }
    var otp3: String {
        guard otpField.count >= 3 else {
            return ""
        }
        return String(Array(otpField)[2])
    }
    var otp4: String {
        guard otpField.count >= 4 else {
            return ""
        }
        return String(Array(otpField)[3])
    }
    
    var otp5: String {
        guard otpField.count >= 5 else {
            return ""
        }
        return String(Array(otpField)[4])
    }
    
    @Published var isVerified = false
    
    @Published var borderColor: Color = .black
    @Published var isTextFieldDisabled = false
    var successCompletionHandler: (()->())?
    
    @Published var showResendText = false
    @Published var timerExpired = false
    @Published var timeStr = ""
    @Published var timeRemaining = 60
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func startTimer() {
        timeRemaining = 60
        timerExpired = false
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    func countDownString() {
        guard (timeRemaining > 0) else {
            self.timer.upstream.connect().cancel()
            timerExpired = true
            timeStr = String(format: "%02d:%02d", 00,  00)
            return
        }
        
        timeRemaining -= 1
        timeStr = String(format: "%02d:%02d", 00, timeRemaining)
    }
    
    func resendOtpRequest(phoneNum:String,is_resend:Int,otp_for:Int){
        
        let paramDict = ["phone_or_email":phoneNum,"is_resend":is_resend,"otp_for":otp_for] as [String : Any]
        
        APIManager.shared.resendOtpApi(baseUrl: Config().API_URL + "/api/user/send_otp", parameter: paramDict, token: "") { response in
            print(response)
            
            let data = response as? [String:Any]
            if data?["status"] as? Int == 1 {
                self.startTimer()
            }else {
                
            }
            
        }
    }
    
    func verifyOtpRequest(userID:Int,oTP:String){
        
        let paramDict = ["user_id":userID,"otp":oTP] as [String : Any]
        
        APIManager.shared.verifyOtpApi(baseUrl: Config().API_URL + "/api/user/verify_otp", parameter: paramDict, token: "") { response in
            print(response)
            
            let data = response as? [String:Any]
            if data?["status"] as? Int == 1 {
                self.isVerified.toggle()
            }else {
                
            }
            
        }
    }
    
    
}
