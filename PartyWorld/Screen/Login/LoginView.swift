//
//  LoginView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 01/06/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailAdd = String()
    @State private var password = String()
    @State private var showPassword = false
    @State private var isSignUp = false
    @State private var isForgotPassword = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isBack = false{
        didSet {
            if isBack == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    @ViewBuilder
    var destinationView: some View {
        if isComeFrom == true {
            NewPasswordView()
        }else {
            LoginView(isComeFrom: true)
        }
    }
    
    @StateObject var viewModel = LoginViewModel()
    
    var isComeFrom: Bool
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment:.top){
                    
                    Color("rosa")
                    Button(action:{
                        isBack.toggle()
                    }){
                        Image( isComeFrom ? "backWhite" : "")
                    }
                    .frame(width: 26, height: 26)
                    .padding(.top,95)
                    .position(x: 25, y: 55)
                    
                    VStack{
                        
                        Text("Sign In")
                            .font(.custom("Satoshi-Bold", size: 26))
                            .foregroundColor(.white)
                        //                        .padding()
                        Spacer().frame(height:15)
                        VStack{
                            Text("Please fill your information below")
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
                .frame(height: 140)
                .padding(.top,0)
                
                Spacer().frame(height:30)
                
                VStack(alignment: .leading){
                    Text("Email Address/Mobile Number")
                        .font(.custom("Satoshi-Regular", size: 16))
                    HStack{
                        TextField("", text: $viewModel.userEmailMobile)
                            .padding([.leading,.trailing],10)
                    }.frame(height:45)
                        .background(Rectangle().fill(Color.white))
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                    Spacer().frame(height:25)
                    Text("Password")
                        .font(.custom("Satoshi-Regular", size: 16))
                    HStack {
                        if showPassword {
                            TextField("",text: $viewModel.userPassword)
                                .padding(.leading,10)
                        } else {
                            SecureField("",text: $viewModel.userPassword)
                                .padding(.leading,10)
                        }
                        Button(action: { self.showPassword.toggle()}) {
                            Image("eye")
                                .foregroundColor(.secondary)
                        }.padding(.trailing,5)
                    }   .frame(height:45)
                        .background(Rectangle().fill(Color.white))
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                    
                }.frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                    .padding()
                Spacer().frame(height:30)
                VStack(alignment:.center){
                    NavigationLink(destination: ForgotPasswordView(), isActive: $isForgotPassword){
                        Button(action:{
                            isForgotPassword.toggle()
                        }){
                            Text("Forgot Password?")
                                .frame(alignment:.center)
                                .foregroundColor(Color("rosa"))
                                .font(.custom("Satoshi-Regular", size: 14))
                        }.frame(alignment:.center)
                    }
                    
                    Spacer().frame(height:40)
                    NavigationLink(destination: TabBarView(), isActive: $viewModel.isSignIn){
                        Button(action:{
                            if viewModel.formIsValid {
                                signInUser()
                            }
                            
                        }){
                            Text("Sign In")
                                .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                                .background(Color("rosa"))
                                .cornerRadius(8)
                                .font(.custom("Satoshi-Medium", size: 18))
                                .foregroundColor(.white)
                        }.background(Color("rosa"))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .opacity(buttonOpacity)
                            .disabled(!viewModel.formIsValid)
                    }
                    Spacer().frame(height:20)
                    HStack{
                        Text("Don't have an account?")
                            .foregroundColor(Color("dark"))
                            .font(.custom("Satoshi-Medium", size: 14))
                        NavigationLink(destination: SignUpView(), isActive: $isSignUp){
                            Button(action:{
                                isSignUp.toggle()
                            }){
                                Text("Sign Up")
                                    .frame(alignment:.center)
                                    .foregroundColor(Color("rosa"))
                                    .font(.custom("Satoshi-Regular", size: 14))
                            }.frame(alignment:.center)
                        }
                    }
                    
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
    var buttonOpacity: Double {
        return viewModel.formIsValid ? 1 : 0.5
    }
    private func signInUser() {
        viewModel.loginApi(userEmailMob: $viewModel.userEmailMobile.wrappedValue, password: $viewModel.userPassword.wrappedValue)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isComeFrom: true)
    }
}
