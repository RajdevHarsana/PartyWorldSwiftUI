//
//  SignUpView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 03/06/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullName = String()
    @State private var emailAdd = String()
    @State private var mobileNum = String()
    @State private var password = String()
    @State private var confirmPassword = String()
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @State private var isSignIn = false
    @State var isContinue = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isBack = false{
        didSet {
            if isBack == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    @ObservedObject private var viewModel: SignUpViewModel
      
      init(viewModel: SignUpViewModel = SignUpViewModel()) {
          self.viewModel = viewModel
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
                        
                        Text("Sign Up")
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
                ScrollView{
                    VStack(alignment: .leading){
                        Text("Full Name")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("dark"))
                        HStack{
                            TextField("", text: $viewModel.userName)
                                .padding([.leading,.trailing],10)
                        }.frame(height:45)
                            .background(Rectangle().fill(Color.white))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                        Spacer().frame(height:25)
                        
                        Text("Email")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("dark"))
                        HStack{
                            TextField("", text: $viewModel.userEmail)
                                .padding([.leading,.trailing],10)
                                .keyboardType(.emailAddress)
                        }.frame(height:45)
                            .background(Rectangle().fill(Color.white))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                        Spacer().frame(height:25)
                        Text("Mobile Number")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("dark"))
                        HStack{
                            TextField("", text: $viewModel.userMobileNo)
                                .keyboardType(.numbersAndPunctuation)
                                .padding([.leading,.trailing],10)
                        }.frame(height:45)
                            .background(Rectangle().fill(Color.white))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                        Spacer().frame(height:25)
                        VStack(alignment: .leading){
                            Text("Password")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("dark"))
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
                            Spacer().frame(height:25)
                            Text("Confirm Password")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("dark"))
                            HStack {
                                if showConfirmPassword {
                                    TextField("",text: $viewModel.userRepeatedPassword)
                                        .padding(.leading,10)
                                } else {
                                    SecureField("",text: $viewModel.userRepeatedPassword)
                                        .padding(.leading,10)
                                }
                                Button(action: { self.showConfirmPassword.toggle()}) {
                                    Image("eye")
                                        .foregroundColor(.secondary)
                                }.padding(.trailing,5)
                            }   .frame(height:45)
                                .background(Rectangle().fill(Color.white))
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                        }
                    }.frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                        .padding(.bottom,10)
                    Spacer().frame(height:20)
                    VStack(alignment:.center){
                        GroupBox(content: {
                            VStack{
                                Text("By registering your account, you are ")
                                    .foregroundColor(Color("lightGray"))
                            }
                            VStack{
                                Text("agree to our ")
                                    .foregroundColor(Color("lightGray")) +
                                Text(" Terms & Conditions ")
                                    .foregroundColor(Color("rosa")) +
                                Text(" & ")
                                    .foregroundColor(Color("lightGray")) +
                                Text(" Privacy Policy ")
                                    .foregroundColor(Color("rosa"))
                            }
                        }).groupBoxStyle(TransparentGroupBox())
                        
                        
                        Spacer().frame(height:15)
                        NavigationLink(destination: VerificationView(isComeFrom: .constant(false), phoneOrEmail: viewModel.userMobileNo, userID: viewModel.userId), isActive: $viewModel.isSignUp){
                            Button(action:{
                                if viewModel.formIsValid && viewModel.formIsValid2 {
                                    self.signUpUser()
//                                    UserDefaults.standard.set(viewModel.userMobileNo, forKey: "Mobile")
                                }
                                
                            }){
                                Text("Continue")
                                    .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                                    .background(Color("rosa"))
                                    .cornerRadius(8)
                                    .font(.custom("Satoshi-Medium", size: 18))
                                    .foregroundColor(.white)
                            }
                        }.background(Color("rosa"))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .opacity(buttonOpacity)
                            .disabled(!viewModel.formIsValid && !viewModel.formIsValid2)
                        Spacer().frame(height:20)
                        HStack{
                            Text("Already have an account?")
                                .foregroundColor(Color("dark"))
                                .font(.custom("Satoshi-Medium", size: 14))
                            Spacer().frame(width:3)
                            NavigationLink(destination: LoginView(isComeFrom: false), isActive: $isSignIn){
                                Button(action:{
                                    isSignIn.toggle()
                                }){
                                    Text("Sign In")
                                        .underline()
                                        .frame(alignment:.center)
                                        .foregroundColor(Color("rosa"))
                                        .font(.custom("Satoshi-Medium", size: 14))
                                }.frame(alignment:.center)
                            }
                        }
                        
                    }
                }
//                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
    var buttonOpacity: Double {
        return viewModel.formIsValid && viewModel.formIsValid2 ? 1 : 0.5
      }
    private func signUpUser() {
        viewModel.signUpApiRequest(full_name: $viewModel.userName.wrappedValue, phoneNum: $viewModel.userMobileNo.wrappedValue, email: $viewModel.userEmail.wrappedValue, password: $viewModel.userPassword.wrappedValue, device_type: 2, device_token: "save_rajesh_device")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}



struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .multilineTextAlignment(.center)
            .frame(width: UIScreen.main.bounds.width - 30,alignment: .center)
            .padding([.leading,.trailing],50)
            .font(.custom("Satoshi-Regular", size: 14))
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
            .overlay(configuration.label.padding(.leading, 4), alignment: .center)
    }
}
