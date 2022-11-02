//
//  SplashScreen.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 26/05/22.
//

import SwiftUI

struct SplashScreen: View {
    // 1.
        @State var isActive:Bool = false
        
        var body: some View {
            VStack {
                // 2.
                if self.isActive {
                    // 3.
//                    if #available(iOS 15.0, *) {
//                        SettingView()
//                    } else {
//                        // Fallback on earlier versions
//                    }
//                    NewPasswordView()
//                    CafeDetailView()
//                    GiftSectionView()
//                    NotificationView()
//                    MyAddressView()
//                    EditProfileView()
//                    MyProfileView()
//                    ProfileView()
//                    HomeView()
//                    TabBarView()
                    ChooseLanguage()
//                    LoginView(isComeFrom: false)
//                    SignUpView()
//                    VerificationView(isComeFrom: .constant(true))
//                    ForgotPasswordView()
//                    CurrentLocationMapView()
                } else {
                    // 4.
//                    Text("Awesome Splash Screen!")
//                        .font(Font.largeTitle)
                    Image("01Splash")
                        .resizable()
                }
            }.ignoresSafeArea()
            // 5.
            .onAppear {
                // 6.
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    // 7.
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
