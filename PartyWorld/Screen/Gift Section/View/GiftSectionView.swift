//
//  GiftSectionView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 15/06/22.
//

import SwiftUI

struct GiftSectionView: View {
    
    @State var gridLayout : [GridItem] = [GridItem()]
    
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
                    Image("filterIcon")
                        .resizable()
                        .frame(width: 24, height: 24)
                }.padding()
            }
            .frame(height:90)
            .padding(.top,50)
            .background(LinearGradient(gradient: Gradient(colors: [Color("rosa"), Color("darkishPink")]), startPoint: .leading, endPoint: .trailing))
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2), alignment: .center, spacing: 10){
                        ForEach(Cards){ card in
                            GiftCardView(card: card)
                        }.padding(.all,10)
                            .animation(.interactiveSpring())
                    }.frame(width:UIScreen.main.bounds.width - 10)
                }
            }
        }
        .background(Color.black.opacity(0.05)).ignoresSafeArea(.all,edges: .all)
    }
}

struct GiftSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GiftSectionView()
    }
}

struct GiftCardView : View{
    
    var card : CardModel
    
    var body: some View{
        VStack{
            
            HStack{
                VStack(alignment: .leading){
                    Image(card.cafeImage)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .background(Color.white)
                        .frame(minWidth:0,maxWidth:.infinity)
                        .frame(height:120)
                        .cornerRadius(10, corners: [.topLeft, .topRight])
                        .padding(.top,0)
                    Spacer()
                    Text(card.cafeName)
                        .font(.custom("Satoshi-Bold", size: 14))
                        .multilineTextAlignment(.leading)
                        .padding(.leading,10)
                    Spacer().frame(height:10)
                    HStack{
                        StarsView(rating: card.cafeRating)
                            .padding(.leading,10)
                        Text("(135)")
                            .font(.custom("Satoshi-Regular", size: 12))
                    }
                    Spacer()
                }.padding(.top,0)
                .frame(height:220)
                .background(Color.white)
                .foregroundColor(Color("dark"))
            }
        }
        
        .cornerRadius(10)
    }
}

struct CardModel : Identifiable {
    var id : Int
    var cafeName : String
    var cafeImage : String
    var cafeRating : Float
    var count : Int
}

var Cards = [
    CardModel(id: 1, cafeName: "Cake Hut - Sweets & Pastries", cafeImage: "cafeIcon", cafeRating: 4.5, count: 135),
    CardModel(id: 2, cafeName: "Grass Florist", cafeImage: "cafeIcon2", cafeRating: 4.0, count: 130)
]
