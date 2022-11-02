//
//  WalkTroughView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 30/05/22.
//

import SwiftUI

struct WalkThroughModel{
    let image: String
    let description: String
}

private let WalkThroughData = [ WalkThroughModel(image: "walkThrough1", description: "One stop destination where you get to buy customized gifts made just for you!"),
                                WalkThroughModel(image: "walkThrough2", description: "Surprise your friends and love ones with personalized gifts and amazing decoration from us"),
                                WalkThroughModel(image: "walkThrough3", description: "Safe and quick deliveries with our safe hands.")
]

struct WalkTroughView: View {
    
    @State private var currentStep = 0
    @State var isComplete = false
    
    var body: some View {
        NavigationView{
            VStack{
                TabView(selection:$currentStep){
                    ForEach(0..<WalkThroughData.count){ list in
                        VStack{
                            Image(WalkThroughData[list].image)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: 416)
                            Text(WalkThroughData[list].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 58)
                                .padding(.top, 50)
                                .font(.custom("Satoshi-Medium", size: 20))
                                .foregroundColor(Color("dark"))
                        }
                        .tag(list)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(spacing: 10){
                    ForEach(0..<WalkThroughData.count){ it in
                        if it == currentStep{
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(Color("rosa"))
                            
                        }else{
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color("lightGray"))
                        }
                    }
                }
                .padding(.bottom, 24)
                
                NavigationLink(destination: WelcomeView(), isActive: $isComplete){
                    Button(action:{
                        isComplete = true
                    }){
                        Text(currentStep < WalkThroughData.count - 1 ? "Skip" : "Get Started")
                            .padding(16)
                            .frame(width: 165, height: 50, alignment: .center)
                            .background(Color("rosa"))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    }
                }
                Spacer().frame(height: 50)
            }
        }.navigationBarHidden(true)
    }
}

struct WalkTroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkTroughView()
    }
}
