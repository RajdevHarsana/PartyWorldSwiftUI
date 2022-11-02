//
//  ProfileModel.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 09/06/22.
//

import SwiftUI

struct ProfileModel {
    var profileImage : String
    var userName : String
    var userEmail : String
    var listData : [ProfileList]
}

struct ProfileList {
    var image : String
    var name : String
    var icon : String
}
