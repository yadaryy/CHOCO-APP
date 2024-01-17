//
//  Router.swift
//  ChatLogIn
//
//  Created by Yadar Tulayathamrong on 8/1/2567 BE.
//

import UIKit

class Router {
    private weak var viewController:UIViewController?
    private let onLogIn:()->Void
    
    init(viewController: UIViewController , onLogIn: @escaping()-> Void){
        self.viewController = viewController
        self.onLogIn = onLogIn
    }
}

extension Router:Routing{
    func routingWindow() {
        onLogIn()
    }
}
