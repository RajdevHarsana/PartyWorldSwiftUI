//
//  SettingView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 14/06/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct SettingView: View {
    
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
                    Text("Settings")
                        .font(.custom("Satoshi-Bold", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Button(action:{
                        
                    }){
                        
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
            ChangeLanguage()
            Spacer().frame(height:15)
            SettingListView()
            
            Spacer()
        }.ignoresSafeArea()
            .background(Color(.sRGB, red: 243/255, green: 243/255, blue: 243/255, opacity: 100))
    }
}

@available(iOS 15.0, *)
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct ChangeLanguage : View {
    @State var isSelectedEN = true
    @State var isSelectedAR = false
    var body: some View {
        VStack{
            HStack{
                Spacer().frame(width:15)
                VStack(alignment:.leading){
                    HStack{
                        Text("Change Language")
                            .font(.custom("Satoshi-Medium", size: 16))
                            .foregroundColor(Color("dark"))
                        Spacer()
                        HStack{
                            Button(action:{
                                isSelectedEN = true
                                isSelectedAR = false
                            }){
                                Text("EN")
                                    .frame(width: 45, height: 22, alignment: .center)
                                    .foregroundColor( isSelectedEN ? Color.white : Color("dark"))
                                    .font(.custom("Satoshi-Regular", size: 12))
                                
                            }.background(isSelectedEN ? Color("rosa") : Color("whiteFour"))
                                .cornerRadius(11, corners: [.topLeft, .bottomLeft])
                            Spacer().frame(width:0)
                            Button(action:{
                                isSelectedAR = true
                                isSelectedEN = false
                            }){
                                Text("AR")
                                    .frame(width: 45, height: 22, alignment: .center)
                                    .foregroundColor( isSelectedAR ? Color.white : Color("dark"))
                                    .font(.custom("Satoshi-Regular", size: 12))
                                
                            }.background(isSelectedAR ? Color("rosa") : Color("whiteFour"))
                                .cornerRadius(11, corners: [.topRight, .bottomRight])
                        }.overlay(Capsule(style: .circular).stroke(Color.clear))
                        Spacer().frame(width:15)
                    }.padding(.leading,5)
                    Spacer().frame(height:8)
                    //                        VStack{
                    Text("Change language of the app")
                        .kerning(1.0)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Satoshi-Medium", size: 12))
                        .lineSpacing(5)
                        .foregroundColor(Color("greyish"))
                        .padding([.leading,.trailing],5)
                    //                        }
                }
            }.padding([.bottom,.top],20)
                .cornerRadius(10)
                .background(Color.white).cornerRadius(10)
                .frame(width:UIScreen.main.bounds.width-30)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
        }
    }
}

@available(iOS 15.0, *)
struct SettingListView : View {
    var model :[SettingdsModel] = [SettingdsModel(name: "Change Password"),SettingdsModel(name: "Help & Support"),SettingdsModel(name: "FAQ"),SettingdsModel(name: "Terms & Conditions"),SettingdsModel(name: "Privacy Policy"),SettingdsModel(name: "Contact Us"),]
    var body: some View {
        VStack{
            List{
                ForEach(0..<6){ list in
                    HStack{
                        Text("\(model[list].name)")
                            .font(.custom("Satoshi-Medium", size: 16))
                            .foregroundColor(Color("dark"))
                        Spacer()
                        Image("arrowRight")
                    }.padding([.top,.bottom],10)
                    .listRowSeparator(.hidden)
                }
            }
        }
    }
}
