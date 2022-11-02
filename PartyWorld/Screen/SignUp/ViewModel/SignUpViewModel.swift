//
//  SignUpViewModel.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 17/06/22.
//

import SwiftUI
import Combine

final class SignUpViewModel: ObservableObject {
    
    // Input values from View
    @Published var userName = ""
    @Published var userEmail = ""
    @Published var userMobileNo = ""
    @Published var userPassword = ""
    @Published var userRepeatedPassword = ""
    
    // Output subscribers
    @Published var formIsValid = false
    @Published var formIsValid2 = false
    @Published var isSignUp = false
    
    private var publishers = Set<AnyCancellable>()
    private var publishers2 = Set<AnyCancellable>()
    
    var paramDict = [String:Any]()
    
    @Published var userId: Int {
            didSet {
                UserDefaults.standard.set(userId, forKey: "userId")
            }
        }
    
    init() {
        self.userId = UserDefaults.standard.object(forKey: "userId") as? Int ?? 0
        isSignUpFormValid2
            .receive(on: RunLoop.main)
            .assign(to: \.formIsValid2, on: self)
            .store(in: &publishers2)
        isSignupFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.formIsValid, on: self)
            .store(in: &publishers)
        self.paramDict = ["full_name":userName,"phone":userMobileNo,"email":userEmail,"password":userPassword,"device_type":2,"device_token":"save_abhi_device"]
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    func signUpApiRequest(full_name:String,phoneNum:String,email:String,password:String,device_type:Int,device_token:String){
        let paramDict = ["full_name":full_name,"phone":phoneNum,"email":email,"password":password,"device_type":device_type,"device_token":device_token,"language":1] as [String : Any]
        
        APIManager.shared.signUpApi(baseUrl: Config().API_URL + "/api/user/register", parameter: paramDict, token: "") { response in
            print(response)
            
            let data = response as? [String:Any]
            if data?["status"] as? Int == 1 {
                
                let Dict = data?["data"] as? [String:Any] ?? [:]
                self.userId = Dict["id"] as? Int ?? 0
                
                self.isSignUp.toggle()
            }else {
                
            }
            
        }
    }
}

// MARK: - Setup validations
private extension SignUpViewModel {
    
    var isUserNameValidPublisher: AnyPublisher<Bool, Never> {
        $userName
            .map { name in
                return name.count >= 5
            }
            .eraseToAnyPublisher()
    }
    
    var isUserEmailValidPublisher: AnyPublisher<Bool, Never> {
        $userEmail
            .map { email in
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    var isUserMobileValidPublisher: AnyPublisher<Bool, Never> {
        $userMobileNo
            .map { mobile in
                let mobilePredicate = NSPredicate(format:"SELF MATCHES %@", "^[6-9]\\d{9}$")
                return mobilePredicate.evaluate(with: mobile)
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
    
    
    var passwordMatchesPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($userPassword, $userRepeatedPassword)
            .map { password, repeated in
                return password == repeated
            }
            .eraseToAnyPublisher()
    }
    
    var isSignupFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(
            isUserNameValidPublisher,
            isPasswordValidPublisher,
            passwordMatchesPublisher)
            .map { isNameValid, isPasswordValid, passwordMatches in
                return isNameValid && isPasswordValid && passwordMatches
            }
            .eraseToAnyPublisher()
        
    }
    var isSignUpFormValid2: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isUserMobileValidPublisher, isUserEmailValidPublisher)
            .map { isMobileValid, isEmailValid in
                return isMobileValid && isEmailValid
            }
            .eraseToAnyPublisher()
    }
}


