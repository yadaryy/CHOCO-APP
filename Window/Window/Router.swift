//
//  Router.swift
//  Window
//
//  Created by Yadar Tulayathamrong on 24/12/2566 BE.
//

import Foundation
import UIKit

class Router {
    private unowned let window : UIWindow
    private let submodules: Submodules
    typealias Submodules = (
        landingModule: (_ onStart: @escaping() ->Void) -> UIViewController,
        logInModule: (_ onLogIn: @escaping()->Void) -> UIViewController,
        mainTabBarModule: () -> UIViewController
        
    )
    
    init(window: UIWindow,submodules:Submodules){
        self.window = window
        self.submodules = submodules
    }
}

extension Router : Routing {
    
    func routingLanding() {
        let landingView = self.submodules.landingModule{ [weak self] in
            self?.routingLogIn()
        }
        self.window.rootViewController = landingView
        self.window.makeKeyAndVisible()
    }
    
    func routingLogIn() {
        let logInView = self.submodules.logInModule{ [weak self] in
            print("route to tabBar")
            self?.routingMainTabBar()
        }
        self.window.rootViewController = logInView
        self.window.makeKeyAndVisible()
    }
    
    func routingMainTabBar() {
        print("routtotabbar")
        let mainTabBarView = self.submodules.mainTabBarModule()
        self.window.rootViewController = mainTabBarView
        self.window.makeKeyAndVisible()
    }

}
