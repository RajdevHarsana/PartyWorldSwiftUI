//
//  CurrentLocationMapView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 06/06/22.
//
import CoreLocationUI
import MapKit
import SwiftUI

struct CurrentLocationMapView: View {
    
    @StateObject private var mapViewModel = MapViewModel()
    @State var isActive:Bool = false
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                Map(coordinateRegion: $mapViewModel.region, showsUserLocation: true)
                    .ignoresSafeArea()
                    .accentColor(Color("rosa"))
//                    .onAppear {
//                        mapViewModel.checkIfLocationServicesEnable()
//                    }
                VStack(alignment: .leading){
                    Button(action:{
                        
                    }){
                        Image("MapIcon")
                    }
                }.frame(width:UIScreen.main.bounds.width-30,alignment: .trailing)
            }
            Spacer().frame(height:30)
            
            VStack(alignment: .leading){
                Text("Current Location")
                    .font(.custom("Satoshi-Regular", size: 16))
                
                HStack {
                    if self.isActive{
                        TextField("",text: $mapViewModel.locationName)
                                .padding(.leading,10)
                    }
                }   .frame(height:45)
                    .background(Rectangle().fill(Color.white))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))

            }.frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
            Spacer().frame(height:30)
            Button(action:{
                
            }){
                Text("Continue")
                    .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                    .background(Color("rosa"))
                    .cornerRadius(8)
                    .font(.custom("Satoshi-Medium", size: 18))
                    .foregroundColor(.white)
            }.padding(.bottom,50)
            
        }
        
        .onAppear {
            // 6.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                // 7.
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct CurrentLocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationMapView()
    }
}


