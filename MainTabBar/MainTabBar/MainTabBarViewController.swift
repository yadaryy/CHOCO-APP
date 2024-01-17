//
//  MainTabBarViewController.swift
//  MainTabBar
//
//  Created by Yadar Tulayathamrong on 10/1/2567 BE.
//

import UIKit

typealias MainTabBar = (
    chatroom:UIViewController,
    friend:UIViewController,
    profile:UIViewController

)

protocol Presentation {
    
}

protocol MainTabBarView : AnyObject {
    
}

class MainTabBarViewController: UITabBarController {
    var presenter : Presentation?
    
    init(tabBar: MainTabBar){
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = [tabBar.profile,tabBar.chatroom,tabBar.friend]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MainTabBarViewController : MainTabBarView {
    
}
