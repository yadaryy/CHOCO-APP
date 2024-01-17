//
//  Presenter.swift
//  MainTabBar
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import Foundation

protocol Routing {
    
}
class Presenter : Presentation {
    
    typealias UseCases = ()
    
    weak var view : MainTabBarView?
    var useCases: UseCases
    
    init(useCases: UseCases) {
        self.useCases = useCases
    }
    
    
}
