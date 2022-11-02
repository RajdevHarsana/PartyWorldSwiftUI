//
//  CafeDetailView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 15/06/22.
//

import SwiftUI
import MapKit

extension HorizontalAlignment {
    private enum UnderlineLeading: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.leading]
        }
    }
    
    static let underlineLeading = HorizontalAlignment(UnderlineLeading.self)
}

var isSelected = 0

struct CafeDetailView: View {
    
    @State private var activeIdx: Int = 0
    @State private var w: [CGFloat] = [0, 0, 0]
    @State private var isAboutSelected = 0
    @State private var isProductSelected = false
    @State private var isGallerySelected = false
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 15){
                Button(action:{
                }){
                    Image("backWhite")
                        .resizable()
                        .frame(width: 24, height: 24)
                }.padding()
                Spacer().frame(height:20)
                Text("Cake Hut - Sweets & Pastries")
                    .foregroundColor(Color.white)
                    .font(.custom("Satoshi-Bold", size: 20))
                    .padding([.top,.leading])
                HStack{
                    StarsView(rating: 4.5)
                        .padding(.leading,15)
                    Text("(135)")
                        .font(.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color.white)
                    Spacer()
                    Text("Job Done : 150")
                        .font(.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color.white)
                        .padding(.trailing,15)
                }
                Spacer().frame(height:10)
            }
            .frame(width:UIScreen.main.bounds.width,height:200,alignment: .leading)
            .padding(.top,40)
            .background(Image("backGroundImg").resizable())
            VStack(alignment: .underlineLeading){
                HStack(alignment:.center){
                    Spacer().frame(width:20)
                    Button(action:{
                    }){
                        Text("About").modifier(MagicStuff(activeIdx: $activeIdx, widths: $w, idx: 0))
                            .padding(.all,20)
                            .font(.custom("Satoshi-Medium", size: 14))
                            .foregroundColor(isSelected == 0 ? Color("rosa") : Color("dark"))
                    }
                    
                    Spacer(minLength: 0)
                    Button(action:{
                    }){
                        Text("Products").modifier(MagicStuff(activeIdx: $activeIdx, widths: $w, idx: 1))
                            .padding()
                            .font(.custom("Satoshi-Medium", size: 14))
                            .foregroundColor(isSelected == 1 ? Color("rosa") : Color("dark"))
                    }
                    
                    Spacer(minLength: 0)
                    Button(action:{
                    }){
                        Text("Gallery").modifier(MagicStuff(activeIdx: $activeIdx, widths: $w, idx: 2))
                            .padding(.all,20)
                            .font(.custom("Satoshi-Medium", size: 14))
                            .foregroundColor(isSelected == 2 ? Color("rosa") : Color("dark"))
                    }
                    
                    Spacer().frame(width:20)
                    
                }.background(Color.white)
                    .frame(height:36)
                Rectangle()
                    .alignmentGuide(.underlineLeading) { d in d[.leading]  }
                    .frame(width: w[activeIdx],  height: 2)
                    .animation(.linear)
                    .foregroundColor(Color("rosa"))
            }
            ScrollView{
                VStack{
                    Spacer().frame(height:20)
                    if isSelected == 0 {
                        AboutView()
                    }else
                    if isSelected == 1{
                        ProductView()
                    }else
                    if isSelected == 2{
                        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2), alignment: .center){
                            ForEach(0..<4){_ in
                                GalleryView()
                            }.padding(.all,5)
                                .animation(.interactiveSpring())
                        }.frame(width:UIScreen.main.bounds.width - 10)
                    }
                }
            }.padding(.bottom,30)
            
            
            Spacer(minLength: 0)
            
        }.background(Color.black.opacity(0.05)).ignoresSafeArea(.all,edges: .all)
    }
}

struct CafeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CafeDetailView()
    }
}

struct MagicStuff: ViewModifier {
    @Binding var activeIdx: Int
    @Binding var widths: [CGFloat]
    let idx: Int
    
    func body(content: Content) -> some View {
        Group {
            if activeIdx == idx {
                content.alignmentGuide(.underlineLeading) { d in
                    DispatchQueue.main.async { self.widths[self.idx] = d.width }
                    return d[.leading]
                }.onTapGesture { self.activeIdx = self.idx
                    isSelected = self.idx
                }
                
            } else {
                content.onTapGesture { self.activeIdx = self.idx
                    isSelected = self.idx
                }
            }
        }
    }
}

enum CafeMapDetils{
    static let startingLocation = CLLocationCoordinate2D(latitude: 26.825140, longitude: 75.807540)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}
struct AboutView : View {
    
    @State private var isExpanded: Bool = false
    @State private var region = MKCoordinateRegion(center: CafeMapDetils.startingLocation, span: CafeMapDetils.defaultSpan)
    
    var body: some View{
        VStack{
                VStack(alignment: .leading){
                    Spacer().frame(height:15)
                    Text("About")
                        .foregroundColor(Color("dark"))
                        .font(.custom("Satoshi-Bold", size: 16))
                        .padding()
    //                    .frame(width: UIScreen.main.bounds.width - 30, height: .infinity, alignment: .leading)
                    Spacer().frame(height:10)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.custom("Satoshi-Regular", size: 14))
                        .lineLimit(isExpanded ? nil : 5)
                        .padding([.leading,.trailing],15)
                    GeometryReader { proxy in
                        Button(action: {
                            isExpanded.toggle()
                        }) {
                            Text(isExpanded ? "Less" : "Read More ")
                                .foregroundColor(Color("rosa"))
                                .font(.custom("Satoshi-Regular", size: 14))
                                .padding(.leading, 15.0)
                                .padding(.top, 4.0)
                                .background(Color.white)
                            Image(isExpanded ? "arrowUp" : "arrowDown")
                                .resizable()
                                .frame(width: 12, height: 7, alignment: .leading)
                                .padding(.top,5)
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height, alignment: .leading)
                    }.animation(.easeOut)
                    Spacer().frame(height:16)
                }.background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color(red: 185/255, green: 185/255, blue: 185/255).opacity(0.2), radius: 10, x: 0, y: 2)
                    .frame(width: UIScreen.main.bounds.width - 30, height: .infinity, alignment: .leading)
                
                
            Spacer().frame(height:15)
            VStack(alignment: .leading){
                Spacer().frame(height:15)
                Text("Address")
                    .foregroundColor(Color("dark"))
                    .font(.custom("Satoshi-Bold", size: 16))
                    .padding()
                
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .cornerRadius(10)
                    .frame(height: 185)
                    .padding([.leading,.trailing],15)
                    
                HStack{
                    Image("addressIcon")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text("Al Rashidiya 1, Ajman")
                        .foregroundColor(Color("dark"))
                        .font(.custom("Satoshi-Regular", size: 14))
                    
                }.padding()
                
            }.background(Color.white)
                .cornerRadius(10,corners: [.topLeft,.bottomLeft])
                .shadow(color: Color(red: 185/255, green: 185/255, blue: 185/255).opacity(0.2), radius: 10, x: 0, y: 2)
                .frame(width: UIScreen.main.bounds.width - 30, height: .infinity, alignment: .leading)

        }
    }
}

struct ProductView : View {
    
    var images = ["cupCake","cake"]
    @State private var showPopUp: Bool = false
    
    var body: some View{
        VStack{
            ForEach(0..<images.count){ list in
                HStack{
                    Image(images[list])
                        .resizable()
                        .frame(width: 120, height: 115)
                        .overlay(
                            Button(action:{
                                withAnimation(.linear(duration: 0.3)) {
                                    showPopUp.toggle()
                                }
                            }){
                                Image("infoIcon")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        )
                    VStack(alignment:.leading){
                        Text("6 Classic Vanilla Cup Cakes with Flower Design")
                            .kerning(1.2)
                            .multilineTextAlignment(.leading)
                            .font(.custom("Satoshi-Bold", size: 14))
                            .foregroundColor(Color("dark"))
                        Spacer().frame(height:10)
                        HStack{
                            Text("SAR 225")
                                .foregroundColor(Color("rosa"))
                                .font(.custom("Satoshi-Medium", size: 12))
                            Text("SAR 250")
                                .foregroundColor(Color("greyish"))
                                .font(.custom("Satoshi-Medium", size: 12))
                            Text("10% OFF")
                                .foregroundColor(Color("rosa"))
                                .font(.custom("Satoshi-Medium", size: 12))
                        }
                        Spacer().frame(height:10)
                        HStack{
                            Text("Next Day Delivery")
                                .font(.custom("Satoshi-Medium", size: 12))
                                .foregroundColor(Color("dark"))
                            Spacer()
                            Button(action:{
                                
                            }){
                                Image("heartFill")
                                    .resizable()
                                    .frame(width: 16.9, height: 15)
                            }
                        }
                    }.padding([.leading,.trailing],15)
                }
                .cornerRadius(10)
                .background(Color.white).cornerRadius(10)
                .frame(width:UIScreen.main.bounds.width-30)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
                Spacer().frame(height:15)
            }
//            InfoView(show: $showPopUp)
        }
    }
}

struct InfoView : View{
    
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

struct GalleryView : View {
    var body: some View{
        VStack{
            VStack(alignment: .center){
                Image("cake")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth:165,maxWidth:.infinity)
                    .frame(minHeight:165,maxHeight: .infinity)
                    .cornerRadius(10)
            }
        }
    }
}
