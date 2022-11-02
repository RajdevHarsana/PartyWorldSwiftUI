//
//  ProfileView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 09/06/22.
//

import SwiftUI

struct ProfileView: View {
    var model : [ProfileModel] = [ProfileModel(profileImage: "userProfile", userName: "Ahmed Abdulrahman", userEmail: "ahmedabdulrahman@gmail.com", listData: [ProfileList(image: "profileIcon", name: "My Profile", icon: "arrowRight"),ProfileList(image: "addressIcon", name: "My Address", icon: "arrowRight"),ProfileList(image: "notificationIcon", name: "Notifications", icon: "arrowRight"),ProfileList(image: "settingIcon", name: "Settings", icon: "arrowRight"),ProfileList(image: "aboutIcon", name: "About Us", icon: "arrowRight"),ProfileList(image: "logoutIcon", name: "Log Out", icon: "arrowRight")])]
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment:.top){
                    VStack{
                        Image("\(model[0].profileImage)")
                            .resizable()
                            .frame(width: 110, height: 110, alignment: .center)
                        Spacer().frame(height:20)
                        Text("\(model[0].userName)")
                            .font(.custom("Satoshi-Bold", size: 18))
                            .foregroundColor(.white)
                        Spacer().frame(height:10)
                        Text("\(model[0].userEmail)")
                            .font(.custom("Satoshi-Medium", size: 14))
                            .foregroundColor(Color.white)
                    }.padding(.top)
                        .background(Color("rosa"))
                        .ignoresSafeArea()
                        .frame(width:UIScreen.main.bounds.width,height: 252)
                        .padding(.top,52)
                    Spacer()
                }
                .background(Color("rosa"))
                .padding(.top,0)
                ScrollView(.vertical,showsIndicators: false){
                    VStack{
                        ForEach(0..<model[0].listData.count) { list in
                            HStack{
                                Image("\(model[0].listData[list].image)")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .leading)
                                Spacer().frame(width:15)
                                Text("\(model[0].listData[list].name)")
                                Spacer()
                                Image("\(model[0].listData[list].icon)")
                                    .resizable()
                                    .frame(width: 24, height: 24, alignment: .leading)
                            }
                            .padding()
                            Divider().frame(width:UIScreen.main.bounds.width-30)
                        }
                        
                    }.frame(width:UIScreen.main.bounds.width)
                }.padding(.bottom,80)
                
                Spacer()
            }.ignoresSafeArea()
                .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

