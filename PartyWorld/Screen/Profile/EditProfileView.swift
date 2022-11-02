//
//  EditProfileView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 10/06/22.
//

import SwiftUI

struct EditProfileView: View {
    
    @StateObject private var viewModel = EditProfileViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isBack = false{
        didSet {
            if isBack == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    @State var isEditSuccess = false
    @State var profileImg = String()
    @State var fullName = String()
    @State var emailAdd = String()
    @State var mobileNum = String()
    @State var gender = String()
    
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
                        Text("Edit Profile")
                            .font(.custom("Satoshi-Bold", size: 20))
                            .foregroundColor(.white)
                        Spacer()
                        Button(action:{
                            
                        }){
                            Image("")
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
                    Image("\(profileImg)")
                        .resizable()
                        .frame(width: 140, height: 140, alignment: .center)
                        .overlay(
                            Button(action:{
                                
                            }){
                                Image("cameraIcon")
                            }.frame(width: 140, height: 140, alignment: .center)
                        )
                    ScrollView{
                        VStack{
                            Spacer().frame(height:30)
                            Text("Full Name")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("dark"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            HStack{
                                TextField("", text: $fullName)
                                    .padding([.leading,.trailing],10)
                            }.frame(width:UIScreen.main.bounds.width-30,height:45,alignment: .leading)
                                .background(Rectangle().fill(Color.white))
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                            Spacer().frame(height:30)
                            Text("Email")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("dark"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            HStack{
                                TextField("", text: $emailAdd)
                                    .padding([.leading,.trailing],10)
                            }.frame(width:UIScreen.main.bounds.width-30,height:45,alignment: .leading)
                                .background(Rectangle().fill(Color.white))
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                        }
                        VStack{
                            Spacer().frame(height:30)
                            Text("Mobile Number")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("dark"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            HStack{
                                TextField("", text: $mobileNum)
                                    .padding([.leading,.trailing],10)
                            }.frame(width:UIScreen.main.bounds.width-30,height:45,alignment: .leading)
                                .background(Rectangle().fill(Color.white))
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                            Spacer().frame(height:30)
                            Text("Gender")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("dark"))
                                .frame(width:UIScreen.main.bounds.width-30,alignment: .leading)
                            HStack{
                                TextField("", text: $gender)
                                    .padding([.leading,.trailing],10)
                            }.frame(width:UIScreen.main.bounds.width-30,height:45,alignment: .leading)
                                .background(Rectangle().fill(Color.white))
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("lightGray"), lineWidth: 1))
                        }
                        Spacer().frame(height:50)
                        Button(action:{
                            isEditSuccess.toggle()
                        }){
                            Text("Save")
                                .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                                .background(Color("rosa"))
                                .cornerRadius(8)
                                .font(.custom("Satoshi-Medium", size: 18))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }.frame(width:UIScreen.main.bounds.width)
                Spacer()
            }.ignoresSafeArea()
        }.ignoresSafeArea()
            .navigationBarHidden(true)
            .onAppear {
                self.profileImg = viewModel.model.profileImage
                self.fullName = viewModel.model.userName
                self.emailAdd = viewModel.model.userEmail
                self.mobileNum = viewModel.model.userMobile
                self.gender = viewModel.model.userGender
            }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
