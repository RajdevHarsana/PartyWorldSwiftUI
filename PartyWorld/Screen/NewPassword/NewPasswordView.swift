//
//  NewPasswordView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 06/06/22.
//

import SwiftUI

struct NewPasswordView: View {
    
    @State private var password = String()
    @State private var confirmPassword = String()
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isBack = false{
        didSet {
            if isBack == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    @ObservedObject private var viewModel: NewPasswordViewModel
    
    @State private var showPopUp: Bool = false
    @State private var isDismissPopUp: Bool = false
    
    
    init(viewModel: NewPasswordViewModel = NewPasswordViewModel()){
        self.viewModel = viewModel
        isDismissPopUp = UserDefaults.standard.object(forKey: "Show") as? Bool ?? false
    }
    
    var body: some View {
        ZStack{
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
                            
                            Text("New Password")
                                .font(.custom("Satoshi-Bold", size: 26))
                                .foregroundColor(.white)
                            //                        .padding()
                            Spacer().frame(height:15)
                            VStack{
                                Text("Your new password must be different from pervious used passwords.")
                                    .kerning(1.2)
                                    .multilineTextAlignment(.center)
                                    .padding([.trailing,.leading], 60)
                                    .font(.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(Color.white)
                            }
                            
                        }.padding(.top,86)
                    }
                    .listRowBackground(Color("rosa"))
                    .ignoresSafeArea()
                    .frame(height: 170)
                    .padding(.top,0)
                    
                    Spacer().frame(height:30)
                    
                    VStack(alignment: .leading){
                        Text("Password")
                            .font(.custom("Satoshi-Regular", size: 16))
                        HStack {
                            if showPassword {
                                TextField("",text: $password)
                                    .padding(.leading,10)
                            } else {
                                SecureField("",text: $password)
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
                        HStack {
                            if showConfirmPassword {
                                TextField("",text: $confirmPassword)
                                    .padding(.leading,10)
                            } else {
                                SecureField("",text: $confirmPassword)
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
                    }.frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                    
                    Spacer().frame(height:40)
                    NavigationLink(destination: LoginView(isComeFrom: false), isActive: $showPopUp){
                        Button(action:{
                            withAnimation(.linear(duration: 0.3)) {
                                showPopUp.toggle()
                            }
                        }){
                            Text("Set a New Password")
                                .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                                .background(Color("rosa"))
                                .cornerRadius(8)
                                .font(.custom("Satoshi-Medium", size: 18))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }.navigationBarHidden(true)
                    
            }.navigationBarHidden(true)
//            NewPasswordPopUpView(show: $showPopUp)
        }
        
    }
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView()
    }
}
