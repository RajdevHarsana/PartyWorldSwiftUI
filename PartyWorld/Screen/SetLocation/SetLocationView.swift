//
//  SetLocationView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 06/06/22.
//

import SwiftUI

struct SetLocationView: View {
    
    @State private var currentLocation = String()
    @State private var otherLocation = String()
    @State private var showLocation = false
    @StateObject private var mapViewModel = MapViewModel()
    
    var body: some View {
        VStack{
            ZStack(alignment:.top){
                
                Color("rosa")
                Button(action:{
                    
                }){
                    Image("backWhite")
                }
                .frame(width: 26, height: 26)
                .padding(.top,95)
                .position(x: 25, y: 55)
                
                VStack{
                    
                    Text("Set Location")
                        .font(.custom("Satoshi-Bold", size: 26))
                        .foregroundColor(.white)
                    //                        .padding()
                    Spacer().frame(height:15)
                    VStack{
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been")
                            .kerning(1.2)
                            .multilineTextAlignment(.center)
                            .padding([.trailing,.leading], 30)
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
                Text("Current Location")
                    .font(.custom("Satoshi-Regular", size: 16))
                HStack {
                        TextField("",text: $currentLocation)
                            .padding(.leading,10)
                    Button(action: {
                        
                    }) {
                        Image("locationCurrent")
                            .foregroundColor(.secondary)
                    }.padding(.trailing,15)
                }   .frame(height:45)
                    .background(Rectangle().fill(Color.white))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                Spacer().frame(height:25)
                Text("Other Location")
                    .font(.custom("Satoshi-Regular", size: 16))
                HStack {
                        TextField("",text: $otherLocation)
                            .padding(.leading,10)
                }   .frame(height:45)
                    .background(Rectangle().fill(Color.white))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
            }.frame(width:UIScreen.main.bounds.width-30,alignment: .leading)

            Spacer().frame(height:40)
            
            Button(action:{
                
            }){
                Text("Continue")
                    .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                    .background(Color("rosa"))
                    .cornerRadius(8)
                    .font(.custom("Satoshi-Medium", size: 18))
                    .foregroundColor(.white)
            }
            .onAppear {
                mapViewModel.checkIfLocationServicesEnable()
            }
            
            Spacer()
        }
    }
}

struct SetLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SetLocationView()
    }
}
