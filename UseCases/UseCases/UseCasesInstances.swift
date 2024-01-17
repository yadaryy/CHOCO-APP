//
//  UseCasesInstances.swift
//  UseCases
//
//  Created by Yadar Tulayathamrong on 8/1/2567 BE.
//

import Foundation
import AppServices

public final class UseCasesInstances {
    
    private static let url = "http://localhost:8080"
    private static let webSocketService = WebSocketService(socketURL: url)
    public static let accountsInteractor : AccountInteractor = AccountInteractor(webSocketService: webSocketService)
}
