//
//  HttpService.swift
//  AppServices
//
//  Created by Yadar Tulayathamrong on 12/1/2567 BE.
//

import Alamofire
import RxAlamofire
import RxSwift
public protocol HttpService {
    
    var session: Session {get}
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}

public protocol ReactiveHttpService: HttpService,ReactiveCompatible{}

extension Reactive where Base:ReactiveHttpService {
    public func request(_ urlRequest: URLRequestConvertible) -> Observable<DataRequest> {
        return base.session.rx.request(urlRequest: urlRequest)
    }
}

