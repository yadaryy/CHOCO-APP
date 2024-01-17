//
//  AccountInteractor.swift
//  UseCases
//
//  Created by Yadar Tulayathamrong on 8/1/2567 BE.
//

import RxSwift
import RxRelay
import AppServices
import Models

public final class AccountInteractor {
    private let webSocketService : WebSocketAPI
    private let userRelay:BehaviorRelay<User?> = BehaviorRelay(value:nil)
    public lazy var user: Observable<User?> = self.userRelay.asObservable()
    init(webSocketService:WebSocketAPI){
        self.webSocketService = webSocketService
    }
}

public extension AccountInteractor {
    func logIn(username: String,password:String)-> Single<()>{
        self.webSocketService.logIn(username: username, password: password)
       
        return self.webSocketService.socketResponse
            .debug("WebSocket Login",trimOutput: false)
        .filter({
            guard case .loggedIn = $0 else {return false}
            return true
        })
        .map{ (result) -> User in
            guard case .loggedIn(let username , let password) = result else { return
                User(username: "", password: "") }
            return User(username:username, password: password)
        }
        .take(1)
        .flatMap(saveUser(user:))
        .asSingle()
        .do(onSubscribed:{ [weak self] in
            self?.webSocketService.logIn(username: username, password: password)
            
        })
    }
}

private extension AccountInteractor {
    func saveUser(user:User) -> Single<()> {
        self.userRelay.accept(user)
        return .just(())
    }
}
