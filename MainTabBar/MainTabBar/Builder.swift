//
//  Builder.swift
//  MainTabBar
//
//  Created by Yadar Tulayathamrong on 10/1/2567 BE.
//

import UIKit
import Utility
import Friend
import Profile
import ChatRoom

public final class Builder {
    public static func build() -> UITabBarController {
        let submodules : Router.SubModules = (
            chatroom:ChatRoom.Builder.build(usingNavigationFactory:
                UINavigationController.build),
            friend:Friend.Builder.build(usingNavigationFactory: UINavigationController.build),
            profile:Profile.Builder.build(usingNavigationFactory: UINavigationController.build)
        )
        
        let tabs: MainTabBar = Router.tabs(usingSubModules: submodules)
        
        let presenter = Presenter(useCases: ())
        let view  = MainTabBarViewController(tabBar: tabs)
        presenter.view = view
        view.presenter = presenter
       return view
    }
}
