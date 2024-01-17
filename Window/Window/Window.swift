//
//  Window.swift
//  Window
//
//  Created by Yadar Tulayathamrong on 24/12/2566 BE.
//

import UIKit

protocol Presentation {
    
}
class Window : UIWindow {
    
    var presenter : Presentation?
    
    override init(windowScene: UIWindowScene){
        super.init(windowScene: windowScene)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
