//
//  HomeView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 08/06/22.
//

import SwiftUI

struct HomeView: View {
    
    var catModel:[CategoryModel] = [CategoryModel(id: 1, catName: "Decoration Section", catImage: "categoryIcon"),CategoryModel(id: 2, catName: "Gifts Section", catImage: "categoryIcon2"),CategoryModel(id: 3, catName: "Cards Section", catImage: "categoryIcon3")]
    var cafeModel:[CafeModel] = [CafeModel(id: 1, cafeName: "Cake Hut - Sweets & Pastries", cafeImage: "cafeIcon", cafeRating: 4.5, count: 135),
                                 CafeModel(id: 2, cafeName: "Grass Florist", cafeImage: "cafeIcon2", cafeRating: 4.0, count: 130)]
    
    @State private var searchTxt = String()
    @State private var currentStep = 0
    @State var isComplete = false
    
    var body: some View {
        ZStack{
            VStack{
                ZStack(alignment:.top){
                    LinearGradient(gradient: Gradient(colors: [Color("rosa"), Color("darkishPink")]), startPoint: .leading, endPoint: .trailing)
                    Button(action:{
//                        isBack.toggle()
                    }){
                        Image("homeLocation")
                        Text("Al Rawdah Dist")
                            .font(.custom("Satoshi-Medium", size: 16))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 26)
                    .padding(.top,80)
                    .position(x: 90, y: 55)
                    
                    VStack{
                        HStack {
                            TextField("Search",text: $searchTxt)
                                .padding(.leading,10)
                            Button(action: {
                                
                            }) {
                                Image("searchIcon")
                                    .foregroundColor(.secondary)
                            }.padding(.trailing,15)
                        }   .frame(width: UIScreen.main.bounds.width - 40,height:45)
                            .background(Rectangle().fill(Color.white))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                    }.padding(.top,115)
                    
                }
                .listRowBackground(Color("rosa"))
                .ignoresSafeArea()
                .frame(height: 180)
                .padding(.top,0)
                Spacer().frame(height:0)
                VStack{
                    TabView(selection:$currentStep){
                        ForEach(0..<3){ list in
                            VStack{
                                Image("homeBack")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width, height: 170)
                            }
                            .tag(list)
                        }
                    }.frame(width: UIScreen.main.bounds.width, height: 170)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .overlay(HStack(spacing: 10){
                    ForEach(0..<3){ it in
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
                }.padding(),alignment: .bottom)
                VStack(alignment: .leading){
                    Text("Browse By Category")
                        .font(.custom("Satoshi-Bold", size: 20))
                        .foregroundColor(Color("dark"))
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(0..<catModel.count){ it in
                                Image("\(catModel[it].catImage)")
                                    .resizable()
                                    .frame(width: 130, height: 140, alignment: .leading)
                                    .cornerRadius(8)
                                    .padding(.trailing,8)
                                    .overlay(
                                        Text("\(catModel[it].catName)").padding()
                                            .multilineTextAlignment(.leading)
                                            .font(.custom("Satoshi-Medium", size: 16))
                                            .foregroundColor(Color.white)
                                        ,alignment: .topLeading
                                    )
                            }
                        }
                        
                    }
                }.frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                Spacer().frame(height:20)
                VStack(alignment: .leading){
                    HStack{
                        Text("Recommended Vendors")
                            .font(.custom("Satoshi-Bold", size: 20))
                            .foregroundColor(Color("dark"))
                        Spacer()
                        Button(action:{
                            
                        }){
                            Text("See All")
                                .foregroundColor(Color("rosa"))
                                .font(.custom("Satoshi-Regular", size: 14))
                        }
                    }
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(0..<cafeModel.count){ it in
                                VStack(alignment: .leading){
                                    Image("\(cafeModel[it].cafeImage)")
                                        .resizable()
                                        .frame(width: 240, height: 130, alignment: .leading)
                                        .cornerRadius(10, corners: [.topLeft, .topRight])
                                    Spacer().frame(height:10)
                                    Text("\(cafeModel[it].cafeName)")
                                        .font(.custom("Satoshi-Bold", size: 14))
                                        .padding(.leading,10)
                                    Spacer().frame(height:11)
                                    HStack{
                                        StarsView(rating: cafeModel[it].cafeRating)
                                            .padding(.leading,10)
                                        Text("(135)")
                                            .font(.custom("Satoshi-Regular", size: 12))
                                    }
                                    Spacer().frame(height:10)
                                }
                                .background(Color.white)
                                .cornerRadius(10)
                            }
                        }
                        
                    }
                }.frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                
                
                Spacer()
                    
            }.ignoresSafeArea()
                .background(Color("whiteTwo"))
                .padding(.bottom,40)
                
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


