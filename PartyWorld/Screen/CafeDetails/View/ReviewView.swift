//
//  ReviewView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 20/06/22.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        VStack{
            HStack{
                Button(action:{
                }){
                    Image("backWhite")
                        .resizable()
                        .frame(width: 24, height: 24)
                }.padding()
                Spacer(minLength: 0)
                VStack(alignment: .center, spacing: 10){
                    Text("Gifts Section")
                        .foregroundColor(Color.white)
                        .font(.custom("Satoshi-Bold", size: 20))
                }
                Spacer(minLength: 0)
                Button(action:{
                }){
                    Image("")
                        .resizable()
                        .frame(width: 24, height: 24)
                }.padding()
            }
            .frame(height:90)
            .padding(.top,50)
            .background(LinearGradient(gradient: Gradient(colors: [Color("rosa"), Color("darkishPink")]), startPoint: .leading, endPoint: .trailing))
            
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    ForEach(0..<4) { list in
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
                            
                        Divider().frame(width:UIScreen.main.bounds.width-30)
                    }
                    
                }.frame(width:UIScreen.main.bounds.width)
            }.padding(.bottom,80)
            
            
            Spacer(minLength: 0)
        }.background(Color.black.opacity(0.05)).ignoresSafeArea(.all,edges: .all)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
