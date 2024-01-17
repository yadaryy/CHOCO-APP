//
//  Router.swift
//  ChatRoom
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import Foundation
import UIKit

protocol Routing {
    
}

class Router {
    
    typealias Submodules = ()
    private weak var viewController : UIViewController?
    private let submodules : Submodules
    
    init(viewController: UIViewController , submodules:Submodules) {
        self.viewController = viewController
        self.submodules = submodules
    }
}

extension Router :Routing {
    
}
