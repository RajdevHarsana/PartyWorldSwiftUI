//
//  NotificationView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 14/06/22.
//

import SwiftUI

struct NotificationView: View {
    
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
                    Text("Notifications")
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
            ScrollView{
                NewNotification()
                Spacer().frame(height:20)
                OldNotification()
            }
            Spacer()
        }.ignoresSafeArea()
            .background(Color(.sRGB, red: 243/255, green: 243/255, blue: 243/255, opacity: 100))
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

struct NewNotification: View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("New")
                        .font(.custom("Satoshi-Bold", size: 18))
                        .foregroundColor(Color("dark"))
                    Text("2")
                        .frame(width:18,height: 18)
                        .font(.custom("Satoshi-Medium", size: 12))
                        .foregroundColor(Color.white)
                        .background(Color("rosa"))
                        .cornerRadius(9)
                        .overlay(Circle().stroke(Color("rosa")))
                    
                }.padding([.leading,.top])
            }.frame(width:UIScreen.main.bounds.width,alignment: .leading)
            ForEach(0..<2){ list in
                HStack{
                    Spacer().frame(width:15)
                    Image("notiNew1")
                        .resizable()
                        .frame(width: 40, height: 40)
                    VStack(alignment:.leading){
                        Spacer().frame(height:10)
                        HStack{
                            Text("Claudia Blake")
                                .font(.custom("Satoshi-Bold", size: 14))
                                .foregroundColor(Color("dark"))
                            Spacer()
                            Text("2 hours ago")
                                .font(.custom("Satoshi-Regular", size: 12))
                                .foregroundColor(Color("greyish"))
                                .padding(.trailing,10)
                        }.padding(.leading,5)
                        Spacer().frame(height:8)
//                        VStack{
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting")
                                .kerning(1.0)
                                .multilineTextAlignment(.leading)
                                .font(.custom("Satoshi-Medium", size: 12))
                                .lineSpacing(5)
                                .foregroundColor(Color("greyish"))
                                .padding([.leading,.trailing],5)
//                        }
                    }
                }.padding(.bottom,20)
                    .cornerRadius(10)
                    .background(Color.white).cornerRadius(10)
                    .frame(width:UIScreen.main.bounds.width-30)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
                Spacer().frame(height:15)
            }
        }
    }
}

struct OldNotification: View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Earlier")
                        .font(.custom("Satoshi-Bold", size: 18))
                        .foregroundColor(Color("dark"))
//                    Text("2")
//                        .frame(width:18,height: 18)
//                        .font(.custom("Satoshi-Medium", size: 12))
//                        .foregroundColor(Color.white)
//                        .background(Color("rosa"))
//                        .cornerRadius(9)
//                        .overlay(Circle().stroke(Color("rosa")))
                }.padding([.leading,.top])
            }.frame(width:UIScreen.main.bounds.width,alignment: .leading)
            ForEach(0..<2){ list in
                HStack{
                    Spacer().frame(width:15)
                    Image("notiNew2")
                        .resizable()
                        .frame(width: 40, height: 40)
                    VStack(alignment:.leading){
                        Spacer().frame(height:10)
                        HStack{
                            Text("Cynthia Lamb")
                                .font(.custom("Satoshi-Bold", size: 14))
                                .foregroundColor(Color("dark"))
                            Spacer()
                            Text("2 hours ago")
                                .font(.custom("Satoshi-Regular", size: 12))
                                .foregroundColor(Color("greyish"))
                                .padding(.trailing,10)
                        }.padding(.leading,5)
                        Spacer().frame(height:8)
//                        VStack{
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting")
                                .kerning(1.0)
                                .multilineTextAlignment(.leading)
                                .font(.custom("Satoshi-Medium", size: 12))
                                .lineSpacing(5)
                                .foregroundColor(Color("greyish"))
                                .padding([.leading,.trailing],5)
//                        }
                    }
                }.padding(.bottom,20)
                    .cornerRadius(10)
                    .background(Color.white).cornerRadius(10)
                    .frame(width:UIScreen.main.bounds.width-30)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
                Spacer().frame(height:15)
            }
        }
    }
}
