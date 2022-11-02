//
//  ApiManager.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 21/06/22.
//

import SwiftUI
import Alamofire

public class APIManager {
    
    static var shared = APIManager()
    
    func signUpApi(baseUrl:String, parameter:[String:Any],token:String,completion:@escaping(_:Any)->Void){
        
        AF.request(URL(string: baseUrl)!, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                   print(jsonObject)
                   completion(jsonObject)
                    
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func resendOtpApi(baseUrl:String, parameter:[String:Any],token:String,completion:@escaping(_:Any)->Void){
        
        AF.request(URL(string: baseUrl)!, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                   print(jsonObject)
                   completion(jsonObject)
                    
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func verifyOtpApi(baseUrl:String, parameter:[String:Any],token:String,completion:@escaping(_:Any)->Void){
        
        AF.request(URL(string: baseUrl)!, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                   print(jsonObject)
                   completion(jsonObject)
                    
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loginRequestApi(baseUrl:String, parameter:[String:Any],token:String,completion:@escaping(_:Any)->Void){
        
        AF.request(URL(string: baseUrl)!, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                   let loginModal = try JSONDecoder().decode(LoginModel.self, from: response.data!)
                   print(jsonObject)
                   completion(loginModal)
                    
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
