//
//  LoginViewModel.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 23/06/22.
//

import SwiftUI
import Combine

final class LoginViewModel : ObservableObject {
    
    @Published var userEmailMobile = ""
    @Published var userPassword = ""
    
    @Published var formIsValid = false
    @Published var isSignIn = false
    
    private var publishers = Set<AnyCancellable>()
    
    var paramDict = [String:Any]()
    
    @Published var userId: Int {
            didSet {
                UserDefaults.standard.set(userId, forKey: "userToken")
            }
        }
    @Published var userToken: String {
            didSet {
                UserDefaults.standard.set(userToken, forKey: "userToken")
            }
        }
    
    var model = [LoginModel]()
    
    init() {
        self.userId = UserDefaults.standard.object(forKey: "userId") as? Int ?? 0
        self.userToken = UserDefaults.standard.object(forKey: "userToken") as? String ?? ""
        isLoginFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.formIsValid, on: self)
            .store(in: &publishers)
        self.paramDict = ["phone_or_email":userEmailMobile,"password":userPassword,"device_type":2,"device_token":"save_abhi_device"]
    }
    
    func loginApi(userEmailMob:String,password:String){
        let paramDict = ["phone_or_email":userEmailMob,"password":password,"language":1] as [String : Any]
        
        APIManager.shared.loginRequestApi(baseUrl: Config().API_URL + "/api/user/login", parameter: paramDict, token: "") { response in
            print(response)
            
            let data = response as! LoginModel
            if data.status == true {
                
                let Dict = data.data
                self.userId = Dict?.id ?? 0
                self.userToken = data.token ?? ""
                self.model.append(response as! LoginModel)
                
                self.isSignIn.toggle()
            }else {
                
            }
            
        }
    }
    
}

// MARK: - Setup validations
private extension LoginViewModel {
        
    var isUserEmailValidPublisher: AnyPublisher<Bool, Never> {
        $userEmailMobile
            .map { emailMob in
                let emailPredicate = NSPredicate(format :"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                let mobilePredicate = NSPredicate(format : "SELF MATCHES %@", "^[6-9]\\d{9}$")
                return emailPredicate.evaluate(with: emailMob) || mobilePredicate.evaluate(with: emailMob)
            }
            .eraseToAnyPublisher()
    }
    
    
    var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $userPassword
            .map { password in
                return password.count >= 8
            }
            .eraseToAnyPublisher()
    }
        
    var isLoginFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(
            isUserEmailValidPublisher,
            isPasswordValidPublisher)
            .map { isUserEmailMobValid, isPasswordValid in
                return isUserEmailMobValid && isPasswordValid
            }
            .eraseToAnyPublisher()
        
    }
}
