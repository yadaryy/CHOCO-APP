//
//  AuthResponse.swift
//  Models
//
//  Created by Yadar Tulayathamrong on 15/1/2567 BE.
//

import Foundation

public struct AuthResponse: Codable {
    public let message : String
    public let user : User
}
