//
//  ChooseLanguage.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 30/05/22.
//

import SwiftUI

struct ChooseLanguage: View {
    
    @State var isLinkActive = false
    @State var isSelectedEN = false
    @State var isSelectedAR = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                ZStack(alignment: .top){
                    Color("rosa")
                    
                    VStack{
                        Text("Choose your Language")
                            .font(.custom("Satoshi-Bold", size: 26))
                            .foregroundColor(.white)
                            .padding()
                        VStack{
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been")
                                .kerning(1.2)
                                .multilineTextAlignment(.center)
                                .padding([.trailing,.leading], 34)
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color.white)
                        }
                        
                    }
                    .padding(.top,82)
                    
                }
                .listRowBackground(Color("rosa"))
                .ignoresSafeArea()
                .frame(height: 240)
                .padding(.top,0)
                
                Spacer()
                
                VStack{
                    HStack(spacing:15){
                        
                        Button {
                            isSelectedEN = true
                            isSelectedAR = false
                        } label: {
                            VStack(alignment: .leading){
                                Text("Hello! I'm Ahmad")
                                    .foregroundColor(Color("dark"))
                                    .font(.custom("Satoshi-Bold", size: 20))
                                    .kerning(1.2)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer().frame(height:47)
                                
                                HStack{
                                    Text("English")
                                        .foregroundColor(Color("dark"))
                                        .font(.custom("Satoshi-Medium", size: 16))
                                    
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        Image(isSelectedEN ? "selectedRound" : "unselectedRound")
                                    }.frame(width: 26, height: 26, alignment: .trailing)
                                    
                                }
                                
                            }
                            
                            
                        }.frame(width: 155.0, height: 155.0, alignment: .leading)
                            .padding()
                            .background(Color("offWhite"))
                            .cornerRadius(20)
                            .overlay(isSelectedEN ? RoundedRectangle(cornerRadius:20).stroke(Color("rosa"), lineWidth: 1) : RoundedRectangle(cornerRadius: 20).stroke(Color("lightGray"), lineWidth: 1))
                        //                    }
                        
                        Button {
                            isSelectedAR = true
                            isSelectedEN = false
                        } label: {
                            VStack(alignment: .trailing){
                                Text("أهلا! انا احمد")
                                    .foregroundColor(Color("dark"))
                                    .font(.custom("Satoshi-Bold", size: 20))
                                    .kerning(5)
                                    .multilineTextAlignment(.trailing)
                                
                                Spacer().frame(height:47)
                                
                                HStack{
                                    Text("Arabic")
                                        .foregroundColor(Color("dark"))
                                        .font(.custom("Satoshi-Medium", size: 16))
                                    
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        Image(isSelectedAR ? "selectedRound" : "unselectedRound")
                                    }.frame(width: 26, height: 26, alignment: .trailing)
                                    
                                }
                                
                            }
                            
                        }.frame(width: 155.0, height: 155.0, alignment: .trailing)
                            .padding()
                            .background(Color("offWhite"))
                            .cornerRadius(20)
                            .overlay(isSelectedAR ? RoundedRectangle(cornerRadius:20).stroke(Color("rosa"), lineWidth: 1) : RoundedRectangle(cornerRadius: 20).stroke(Color("lightGray"), lineWidth: 1))
                        
                    }
                    .padding(.top,30)
                    NavigationLink(destination: WalkTroughView(), isActive: $isLinkActive){
                        Button(action:{
                            if isSelectedEN || isSelectedAR == true{
                                isLinkActive.toggle()
                            }
                            
                        }){
                            Text("Continue")
                                .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                                .background(Color("rosa"))
                                .cornerRadius(8)
                                .font(.custom("Satoshi-Medium", size: 18))
                                .foregroundColor(.white)
                        }
                        .padding(.top,40)
                    }
                    Spacer()
                    //                    Color.red
                }
                
            }
            .navigationBarHidden(true)
        }
        //        .position(x: 0, y: 0)
        
    }
}

struct ChooseLanguage_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLanguage()
    }
}
