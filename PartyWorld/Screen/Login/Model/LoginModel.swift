//
//  LoginModel.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 23/06/22.
//

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let status: Bool?
    let message: String?
    let data: DataClass?
    let token: String?
    let addressCount: Int?
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int?
    let fullName, email: String?
    let countryCode, phone, otp: Int?
    let image: String?
    let gender, lang, status, isNotification: Int?
    let isSubscription, verifiedStatus: Int?
    let deviceToken: String?
    let deviceType: Int?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case email
        case countryCode = "country_code"
        case phone, otp, image, gender, lang, status
        case isNotification = "is_notification"
        case isSubscription = "is_subscription"
        case verifiedStatus = "verified_status"
        case deviceToken = "device_token"
        case deviceType = "device_type"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
