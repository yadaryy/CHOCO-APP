//
//  Presenter.swift
//  Window
//
//  Created by Yadar Tulayathamrong on 24/12/2566 BE.
//

import Foundation

protocol Routing {
    func routingLanding()
    func routingLogIn()
    func routingMainTabBar()
}
class Presenter : Presentation {
    
    private var router : Routing
    
    init(router:Routing){
        self.router = router
        process()
    }
}

private extension Presenter {
    func process() {
        self.router.routingLanding()
    }
}
