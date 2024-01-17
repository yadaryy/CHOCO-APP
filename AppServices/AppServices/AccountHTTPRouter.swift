//
//  AccountHTTPRouter.swift
//  AppServices
//
//  Created by Yadar Tulayathamrong on 12/1/2567 BE.
//

import Alamofire
import Models

enum AccountHTTPRouter{
    case logIn(user:User)
    case signUp(user:User)
}

extension AccountHTTPRouter:ReactiveHttpRouter{
    var baseUrl: URL {
        let url = "http:localhost:8080"
        let api = "/api"
        
        return URL(string: url+api)!
    }
    
    var path: String {
        switch self {
        case .logIn:
            return "/login"
        case .signUp:
            return "/signup"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var headers: Alamofire.HTTPHeaders? {
        return ["Content-Type":"application/json"]
    }
    public func body() throws -> Data? {
        switch self {
        case .logIn(let user):
            return nil
        case .signUp(let user):
            return nil
        }
    }
}
