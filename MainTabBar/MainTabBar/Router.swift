//
//  Router.swift
//  MainTabBar
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import UIKit

class Router {
    typealias SubModules = (
        chatroom:UIViewController,
        friend:UIViewController,
        profile:UIViewController
    )
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}

extension Router {
    static func tabs(usingSubModules subModules:SubModules) -> MainTabBar  {
        
        let chatImage = UIImage(systemName: "message")
        let friendImage = UIImage(systemName: "person.3.fill")
        let profileImage = UIImage(systemName: "person.circle")
        
        let chatroomItem = UITabBarItem(title: "Chat", image: chatImage, tag: 100)
        let friendItem = UITabBarItem(title: "Friends", image: friendImage, tag: 101)
        let profile = UITabBarItem(title: "Profile", image: profileImage, tag: 101)
        
        subModules.chatroom.tabBarItem = chatroomItem
        subModules.friend.tabBarItem = friendItem
        subModules.profile.tabBarItem = profile
        
        
        return(
            chatroom: subModules.chatroom,
            friend: subModules.friend,
            profile:subModules.profile
        )
    }
}

extension Router : Routing {
    
}

