//
//  ChatRoomService.swift
//  AppServices
//
//  Created by Yadar Tulayathamrong on 12/1/2567 BE.
//

import RxSwift
import RxAlamofire
import Alamofire

class ChatRoomHTTPService: ReactiveHttpService {
    public static let shared : ChatRoomHTTPService = ChatRoomHTTPService()
    var session: Session
    
    private init() {
        self.session = Session.default
    }
    func request(_ urlRequest: Alamofire.URLRequestConvertible) -> Alamofire.DataRequest {
        self.session.request(urlRequest)
    }
}
