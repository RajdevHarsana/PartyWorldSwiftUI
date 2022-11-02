//
//  ForgotViewModel.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 22/06/22.
//

import SwiftUI
import Combine

final class ForgotViewModel: ObservableObject {
    
    @Published var userMobileEmail = ""
    @State var isForgot = false
    
    func forgotRequest(phoneNum:String,is_resend:Int,otp_for:Int){
        
        let paramDict = ["phone_or_email":phoneNum,"is_resend":is_resend,"otp_for":otp_for] as [String : Any]
        
        APIManager.shared.resendOtpApi(baseUrl: Config().API_URL + "/api/user/send_otp", parameter: paramDict, token: "") { response in
            print(response)
            
            let data = response as? [String:Any]
            if data?["status"] as? Int == 1 {
                self.isForgot.toggle()
            }else {
                
            }
            
        }
    }
}


