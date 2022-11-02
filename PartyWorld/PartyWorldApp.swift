//
//  PartyWorldApp.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 26/05/22.
//

import SwiftUI
//import DeviceCheck

@main
struct PartyWorldApp: App {
    
//    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
//        .onChange(of: scenePhase) { (newScenePhase) in
//                    switch newScenePhase {
//                    case .active:
//                        let currentDevice = DCDevice.current
//                        if currentDevice.isSupported {
//                        currentDevice.generateToken(completionHandler: { (data, error) in
//                            if let tokenData = data {
//                                print("Token: \(tokenData)")
//                                Config().AppUserDefaults.set(tokenData, forKey: "device_token")
//                            } else {
//                                print("Error: \(error?.localizedDescription ?? "")")
//                            }
//                        })
//                        }
//                        print("scene is now active!")
//                    case .inactive:
//                        print("scene is now inactive!")
//                    case .background:
//                        print("scene is now in the background!")
//                    @unknown default:
//                        print("Apple must have added something new!")
//                    }
//                }
    }
}
