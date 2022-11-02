//
//  EditProfileViewModel.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 10/06/22.
//

import SwiftUI

class EditProfileViewModel : NSObject, ObservableObject{
    
//    var view = EditProfileView()
    
    var model : MyProfileModel = MyProfileModel(profileImage: "userProfile", userName: "Ahmed Abdulrahman", userEmail: "ahmedabdulrahman@gmail.com", userMobile: "705-970-1609", userGender: "Male")
    
    func updateUi() {
//        view.profileImg = model.profileImage
//        view.fullName = model.userName
//        view.emailAdd = model.userEmail
//        view.mobileNum = model.userMobile
//        view.gender = model.userGender
    }
    
}
