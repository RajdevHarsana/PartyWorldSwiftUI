//
//  ProductInfoView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 17/06/22.
//

import SwiftUI

struct ProductInfoView: View {
    @Binding var show: Bool
    
    var body: some View{
        ZStack{
            if show {
                // PopUp background color
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)

                // PopUp Window
                VStack(alignment: .center, spacing: 0) {
                    Spacer().frame(height:30)
                    Image("SuccessIcon")
                    Spacer().frame(height:20)
                    Text("New Password Set Successfully!")
                        .kerning(1.0)
                        .multilineTextAlignment(.center)
                        .frame(alignment: .center)
                        .font(.custom("Satoshi-Bold", size: 24))
                    Spacer().frame(height:15)
                    Text("Please sign in to your 3alamalhaflat account using new sign in credentials.")
                        .kerning(1.0)
                        .multilineTextAlignment(.center)
                        .font(.custom("Satoshi-Regular", size: 16))
                        .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
                    Spacer().frame(height:30)
                    Button(action: {
                        // Dismiss the PopUp
                        withAnimation(.linear(duration: 0.3)) {
                            show = false
                        }
                    }, label: {
                        Text("Sign In Now")
                            .frame(height: 50, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(Color("rosa"))
                            .font(.custom("Satoshi-Medium", size: 18))
                            .padding([.leading,.trailing],130)
                    }).background(Color("rosa"))
                        .cornerRadius(8)
                    Spacer().frame(height:30)
                }
                .frame(width: UIScreen.main.bounds.width-30)
                .background(Color.white)
                .cornerRadius(20)
            }
        }
    }
}

struct ProductInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProductInfoView(show: .constant(true))
    }
}
