//
//  HttpRouter.swift
//  AppServices
//
//  Created by Yadar Tulayathamrong on 12/1/2567 BE.
//

import Alamofire
import RxAlamofire
import RxSwift

public protocol HttpRouter{
    var baseUrl: URL {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var headers: HTTPHeaders? {get}
    var parameters:Parameters? {get}
    
    func body() throws -> Data?
    
    func request(usingHttpService httpService: HttpService) throws -> DataRequest
    
}

extension HttpRouter {
   public var parameters: Parameters? {return nil}
   public func body() throws -> Data? {return nil}
    
    func asURLRequest() -> URLRequest {
        
        var url = baseUrl
        url.appendPathComponent(path)
        // using try! Program maybe crash, Need to refactor
        var request = try! URLRequest(url: url , method: method, headers: headers)
        request.httpBody = try! body()
        
        return request
    }
    
    public func request(usingHttpService httpService: HttpService) throws -> DataRequest {
        return httpService.request(asURLRequest())
    }
}

protocol ReactiveHttpRouter: HttpRouter,ReactiveCompatible{}

extension Reactive where Base:ReactiveHttpRouter {
    func request<Service: ReactiveHttpService>(withService service: Service) -> Observable<DataRequest> {
        return service.rx.request(base.asURLRequest())
    }
}
