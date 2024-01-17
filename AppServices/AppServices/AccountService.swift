//
//  AccountService.swift
//  AppServices
//
//  Created by Yadar Tulayathamrong on 12/1/2567 BE.
//

import Foundation
import RxSwift
import Models

public protocol AccountAPI {
    func logIn(username: String , password: String) -> Single<User>

}

public final class AccountService {
    private let httpService : ChatRoomHTTPService = ChatRoomHTTPService.shared
    private  init() {}
}

extension AccountService : AccountAPI {
    public func logIn(username: String, password: String) -> Single<User>{
        AccountHTTPRouter.logIn(user: User(username: username, password: password))
            .rx.request(withService: httpService)
            .responseJSON()
            .map { (result) in
                guard let data = result.data else {
                    throw ChatRoomError.parsingFailed
                }
                if result.response?.statusCode == 200 {
                    return try
                    
                }else {
                    throw ChatRoomError.internalError
                }
            }
            .map({ $0.})
            .asSingle()
    }
}
