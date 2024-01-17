//
//  Builder.swift
//  Window
//
//  Created by Yadar Tulayathamrong on 24/12/2566 BE.
//

import UIKit
import Landing
import ChatLogIn
import MainTabBar

public final class Builder {
    
   public static func build(windowScene: UIScene) -> UIWindow {
       let window = Window(windowScene: windowScene as! UIWindowScene)
       let landingModule = Landing.Builder.build
       let logInModule = ChatLogIn.Builder.build
       let mainTabBarModule = MainTabBar.Builder.build
       let router = Router(
        window: window,
        submodules: (
            landingModule : landingModule,
            logInModule : logInModule,
            mainTabBarModule : mainTabBarModule
          )
       )
       
        let presenter = Presenter(router: router)
        
        window.presenter = presenter
        return window
    }
}
