//
//  ChatRoomError.swift
//  Models
//
//  Created by Yadar Tulayathamrong on 15/1/2567 BE.
//

import Foundation

public enum ChatRoomError : Error{
    case notFound
    case mandatoryMissing
    case internalError
    case unauthorize
    case parsingFailed
    case custom(error:String)
}
