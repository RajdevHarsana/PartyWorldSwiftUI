//
//  MyProfileView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 10/06/22.
//

import SwiftUI

struct MyProfileView: View {
    
    var model : MyProfileModel = MyProfileModel(profileImage: "userProfile", userName: "Ahmed Abdulrahman", userEmail: "ahmedabdulrahman@gmail.com", userMobile: "705-970-1609", userGender: "Male")
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isBack = false{
        didSet {
            if isBack == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    @State private var isEdit = false
    
    var body: some View {
        NavigationView{
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
                        Text("My Profile")
                            .font(.custom("Satoshi-Bold", size: 20))
                            .foregroundColor(.white)
                        Spacer()
                        Button(action:{
                            isEdit.toggle()
                        }){
                            Image("editIcon")
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
                VStack{
                    Spacer().frame(height:30)
                    Image("\(model.profileImage)")
                        .resizable()
                        .frame(width: 140, height: 140, alignment: .center)
                    ScrollView{
                        VStack{
                            Spacer().frame(height:30)
                            Text("Full Name")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("greyish"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            Spacer().frame(height:10)
                            Text("\(model.userName)")
                                .font(.custom("Satoshi-Medium", size: 16))
                                .foregroundColor(Color("dark"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            Spacer().frame(height:30)
                            Text("Email")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("greyish"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            Spacer().frame(height:10)
                            Text("\(model.userEmail)")
                                .font(.custom("Satoshi-Medium", size: 16))
                                .foregroundColor(Color("dark"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                        }
                        VStack{
                            Spacer().frame(height:30)
                            Text("Mobile Number")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("greyish"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            Spacer().frame(height:10)
                            Text("\(model.userMobile)")
                                .font(.custom("Satoshi-Medium", size: 16))
                                .foregroundColor(Color("dark"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            Spacer().frame(height:30)
                            Text("Gender")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("greyish"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            Spacer().frame(height:10)
                            Text("\(model.userGender)")
                                .font(.custom("Satoshi-Medium", size: 16))
                                .foregroundColor(Color("dark"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                        }
                    }
                    Spacer().frame(height:100)
                }.frame(width:UIScreen.main.bounds.width)
                Spacer()
            }.ignoresSafeArea()
        }.ignoresSafeArea()
            .navigationBarHidden(true)
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
