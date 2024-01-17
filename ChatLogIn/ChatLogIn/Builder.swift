//
//  Builder.swift
//  ChatLogIn
//
//  Created by Yadar Tulayathamrong on 7/1/2567 BE.
//

import UIKit
import Utility
import UseCases

public final class Builder {
    public static func build(onLogIn: @escaping () -> Void) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "ChatLogIn", bundle: Bundle.init(for: self))
        let view = ChatLogInViewController.instantiate(from: storyboard)
        let accountInteractor = UseCasesInstances.accountsInteractor
        
        let router = Router(viewController: view, onLogIn: onLogIn)
        view.presenterProducer = { input in
            Presenter(
                input: input,
                useCases:(
                    logIn: accountInteractor.logIn,()
                ),
                router: router)
        }
        return view
    }
}
