//
//  ForgotPasswordView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 06/06/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var emailMobile = String()
    @State private var isVerification = false
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isBack = false{
        didSet {
            if isBack == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    @StateObject var viewModel = ForgotViewModel()
    
    var userId = Int()
    
    init(){
        userId = UserDefaults.standard.object(forKey: "userId") as? Int ?? 0
    }
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment:.top){
                    
                    Color("rosa")
                    Button(action:{
                        isBack.toggle()
                    }){
                        Image("backWhite")
                    }
                    .frame(width: 26, height: 26)
                    .padding(.top,95)
                    .position(x: 25, y: 55)
                    
                    VStack{
                        
                        Text("Forgot Password?")
                            .font(.custom("Satoshi-Bold", size: 26))
                            .foregroundColor(.white)
                        //                        .padding()
                        Spacer().frame(height:15)
                        VStack{
                            Text("Enter your Email Address/Mobile Number and we will help you recover your password.")
                                .kerning(1.2)
                                .multilineTextAlignment(.center)
                                .padding([.trailing,.leading], 34)
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color.white)
                        }
                        
                    }.padding(.top,86)
                }
                .listRowBackground(Color("rosa"))
                .ignoresSafeArea()
                .frame(height: 220)
                .padding(.top,0)
                Spacer().frame(height:30)
                VStack(alignment: .leading){
                    Text("Email Address/Mobile Number")
                        .font(.custom("Satoshi-Regular", size: 16))
                    HStack{
                        TextField("", text: $viewModel.userMobileEmail)
                            .padding([.leading,.trailing],10)
                    }.frame(height:45)
                        .background(Rectangle().fill(Color.white))
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                    
                }.frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                    .padding()
                Spacer().frame(height:40)
                VStack(alignment:.center){
                    NavigationLink(destination: VerificationView(isComeFrom: .constant(true), phoneOrEmail: $viewModel.userMobileEmail.wrappedValue, userID: userId), isActive: $viewModel.isForgot){
                        Button(action:{
                            forgotPassword()
                        }){
                            Text("Get Verification Code")
                                .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                                .background(Color("rosa"))
                                .cornerRadius(8)
                                .font(.custom("Satoshi-Medium", size: 18))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer().frame(height:20)
                    HStack{
                        Text("Don't have an account?")
                            .foregroundColor(Color("dark"))
                            .font(.custom("Satoshi-Medium", size: 14))
                        Button(action:{
                            
                        }){
                            Text("Sign Up")
                                .frame(alignment:.center)
                                .foregroundColor(Color("rosa"))
                                .font(.custom("Satoshi-Regular", size: 14))
                        }.frame(alignment:.center)
                    }
                    
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
    private func forgotPassword(){
        viewModel.forgotRequest(phoneNum: $viewModel.userMobileEmail.wrappedValue, is_resend: 2, otp_for: 2)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
