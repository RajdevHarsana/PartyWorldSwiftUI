//
//  TabBarView.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 08/06/22.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selection: Int = 0
    @State private var isPresented: Bool = false
    
//    init() {
//        let appearance = UITabBarAppearance()
//        appearance.configureWithTransparentBackground()
//        appearance.backgroundColor = UIColor.systemGray6
//        UITabBar.appearance().standardAppearance = appearance
//    }
    
    var body: some View {
        NavigationView{
        TabView (selection: $selection){
            HomeView()
                .tabItem {
                    if selection == 0 {
                        Image("HomeFill")
                    }else{
                        Image("HomeUnfill")
                    }
                    Text("Home")
                        .font(.custom("Satoshi-Medium", size: 12))
                        .foregroundColor(Color("rosa"))
                }.tag(0)
            Text("My Order Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    if selection == 1 {
                        Image("MyOrderFill")
                    }else{
                        Image("MyOrderUnfill")
                    }
                    Text("My Order")
                        .font(.custom("Satoshi-Medium", size: 12))
                        .foregroundColor(Color("rosa"))
                }.tag(1)
            
            Text("Offers Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    if selection == 2 {
                        Image("OfferFill")
                    }else{
                        Image("OfferUnfill")
                    }
                    Text("Offers")
                        .font(.custom("Satoshi-Medium", size: 12))
                        .foregroundColor(Color("rosa"))
                }.tag(2)
            
            Text("Favorite Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    if selection == 3 {
                        Image("FavoriteFill")
                    }else{
                        Image("FavoriteUnfill")
                    }
                    Text("Favorite")
                        .font(.custom("Satoshi-Medium", size: 12))
                        .foregroundColor(Color("rosa"))
                }.tag(3)
            
            ProfileView()
                .tabItem {
                    if selection == 4 {
                        Image("ProfileFill")
                    }else{
                        Image("ProfileUnfill")
                    }
                    Text("Profile")
                        .font(.custom("Satoshi-Medium", size: 12))
                        .foregroundColor(Color("rosa"))
                }.tag(4)
        }.accentColor(Color("rosa"))
            .background(Color.white)
            .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

struct TabBarAccessor: UIViewControllerRepresentable {
    var callback: (UITabBar) -> Void
    private let proxyController = ViewController()

    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarAccessor>) ->
                              UIViewController {
        proxyController.callback = callback
        return proxyController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TabBarAccessor>) {
    }
    
    typealias UIViewControllerType = UIViewController

    private class ViewController: UIViewController {
        var callback: (UITabBar) -> Void = { _ in }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let tabBar = self.tabBarController {
                self.callback(tabBar.tabBar)
            }
        }
    }
}
