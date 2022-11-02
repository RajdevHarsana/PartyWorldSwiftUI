//
//  MyAddressView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 10/06/22.
//

import SwiftUI

struct MyAddressView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isBack = false{
        didSet {
            if isBack == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    var body: some View {
        VStack{
            ZStack(alignment:.top){
                HStack(alignment:.center){
                    Spacer().frame(width:15)
                    Button(action:{
                        isBack.toggle()
                    }){
                        Image("backWhite")
                    }.frame(width: 24, height: 24, alignment: .center)
                    Spacer()
                    Text("My Address")
                        .font(.custom("Satoshi-Bold", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Button(action:{
                        
                    }){
                        Image("")
                    }.frame(width: 24, height: 24, alignment: .center)
                    Spacer().frame(width:15)
                }.padding(.top,86)
                    .background(Color("rosa"))
                    .ignoresSafeArea()
                    .frame(width:UIScreen.main.bounds.width,height: 90)
                    .padding(.top,52)
                Spacer()
            }
            .background(Color("rosa"))
            .padding(.top,0)
            Spacer().frame(height:30)
            ScrollView{
                ForEach(0..<3){ list in
                    VStack(alignment:.leading){
                        HStack{
                            Text("Address01")
                                .font(.custom("Satoshi-Bold", size: 16))
                            Spacer()
                            Button(action:{
                                
                            }){
                                Image("menuIcon")
                            }
                        }.padding()
                        Text("Khobar North, P.O.Box: 4817 Postal Code: 31952")
                            .font(.custom("Satoshi-Regular", size: 14))
                            .foregroundColor(Color("greyish"))
                            .padding([.leading,.trailing])
                            .multilineTextAlignment(.leading)
                    }.padding(.bottom)
                        .cornerRadius(10)
                        .background(Color.white).cornerRadius(10)
                        .frame(width:UIScreen.main.bounds.width-30)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
                    Spacer().frame(height:15)
                }
            }
            Button(action:{
                
            }){
                Text("New Delivery Address")
                    .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                    .background(Color("rosa"))
                    .cornerRadius(8)
                    .font(.custom("Satoshi-Medium", size: 18))
                    .foregroundColor(.white)
            }
            Spacer().frame(height:35)
        }.ignoresSafeArea()
            .background(Color(.sRGB, red: 243/255, green: 243/255, blue: 243/255, opacity: 100))
    }
}

struct MyAddressView_Previews: PreviewProvider {
    static var previews: some View {
        MyAddressView()
    }
}
