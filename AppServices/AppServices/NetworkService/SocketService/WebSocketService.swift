//
//  WebSocketService.swift
//  AppServices
//
//  Created by Yadar Tulayathamrong on 8/1/2567 BE.
//

import SocketIO
import RxSwift
import RxRelay
import Models


public protocol WebSocketAPI {
    var socketResponse:Observable<WebSocket.Response> {get}
    func logIn(username: String , password: String)
}

public class WebSocketService {
    private let socketURL: String
    private var socketManager: SocketManager!
    private var socket:SocketIOClient!
    
    private let socketResponseRelay: PublishRelay<WebSocket.Response> = PublishRelay()
    public lazy var socketResponse:Observable<WebSocket.Response> = self.socketResponse.asObservable()
    
    public init(socketURL:String){
        self.socketURL = socketURL
        self.setup(url: URL(string: self.socketURL)!)
    }
    
    deinit{
        self.socket.disconnect()
    }
}

extension WebSocketService: WebSocketAPI {
    public func logIn(username: String, password: String) {
    print("LogInRequestReceive : \(username) and \(password)")
        self.socket.emit(ChatSocket.Request.logInRequest, username,password)
    }
}

private extension WebSocketService {
    func setup(url:URL){
        self.socketManager = SocketManager(socketURL: url , config: [.forceWebsockets(true),.log(true), .compress])
        self.socket = self.socketManager.defaultSocket
        self.socket.connect()
        print(url)
        print("WebSocketService working")
        self.socket.on(ChatSocket.Response.logInResponse){ [weak self](data, socketAck) in
            print ("Log in success for user: \(data)")
            
            if let username = data[0] as? String, let password = data[1] as? String {
                self?.socketResponseRelay.accept(.loggedIn(username: username, password: password))
            }
        }
    }
}
