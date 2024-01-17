//
//  User.swift
//  Models
//
//  Created by Yadar Tulayathamrong on 8/1/2567 BE.
//

import Foundation

//Need to Make Authen Response Model

public struct User : Codable {
    public let username:String
    public let password:String?
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password

    }
}
