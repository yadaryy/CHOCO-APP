//
//  Presenter.swift
//  ChatLogIn
//
//  Created by Yadar Tulayathamrong on 8/1/2567 BE.
//

import Foundation
import RxSwift
import RxCocoa

protocol Routing {
    func routingWindow()
}
class Presenter: Presentation {
    
    typealias UseCases = (
        logIn: (_ username: String, _ password:String) -> Single<()>,()
    )
    var input: Input
    var output: Output
    
    private let bag = DisposeBag()
    private let useCases: UseCases
    private let router:Routing
    
    init(input: Input, useCases: UseCases, router: Routing) {
        self.input = input
        self.router = router
        self.output = Presenter.output(input: self.input)
        self.useCases = useCases
        self.process()
    }
}

private extension Presenter {
    static func output(input:Input) -> Output {
        let enableLogInDriver = Driver.combineLatest(
            input.username.map({
            $0.isValidEmail()
        }), input.password.map({
            !$0.isEmpty
        })
        ).map({$0 && $1})
        
        return(
            enableLogIn:enableLogInDriver,()
        )
    }
    func process() {
        self.input.logIn.withLatestFrom(Driver.combineLatest(self.input.username,self.input.password))
            .asObservable()
            .flatMap({ [useCases] (username,password) in
                useCases.logIn(username,password)
            })
            .map({ [router] in
                router.routingWindow()
            })
            .asDriver(onErrorDriveWith: .never())
            .drive()
            .disposed(by: bag)
    }
}
