//
//  WelcomeView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 01/06/22.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var isSignIn = false
    @State private var isSignUp = false
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("WelcomePage")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                VStack{
                    Text("Welcome to 3alamalhaflat")
                        .font(.custom("Satoshi-Bold", size: 24))
                    //                    .padding(.top,80)
                        .padding(.bottom,10)
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been")
                        .kerning(1.2)
                        .multilineTextAlignment(.center)
                        .padding([.trailing,.leading], 34)
                        .font(.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("dark"))
                    Spacer().frame(height:40)
                    HStack{
                        NavigationLink(destination: SignUpView(), isActive: $isSignUp){
                            Button(action:{
                                isSignUp.toggle()
                            }){
                                Text("Sign Up")
                                    .frame(width: UIScreen.main.bounds.width/2-15, height: 50, alignment: .center)
                                    .background(Color("rosa"))
                                    .cornerRadius(8)
                                    .font(.custom("Satoshi-Medium", size: 18))
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer().frame(width:10)
                        NavigationLink(destination: LoginView(isComeFrom: true), isActive: $isSignIn){
                            Button(action:{
                                isSignIn.toggle()
                                    
                            }){
                                Text("Sign In")
                                    .frame(width: UIScreen.main.bounds.width/2-15, height: 50, alignment: .center)
                                    .background(Color("rosa"))
                                    .cornerRadius(8)
                                    .font(.custom("Satoshi-Medium", size: 18))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    Spacer().frame(height:15)
                    
                    Button(action:{
                        
                    }){
                        Text("Explore the App as Guest")
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50, alignment: .center)
                            .background(Color("dark"))
                            .cornerRadius(8)
                            .font(.custom("Satoshi-Medium", size: 18))
                            .foregroundColor(.white)
                    }
                }.padding(.top,UIScreen.main.bounds.height/2)
            }
        }.navigationBarHidden(true)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
