//
//  ChatLogInViewController.swift
//  ChatLogIn
//
//  Created by Yadar Tulayathamrong on 7/1/2567 BE.
//

import UIKit
import RxSwift
import RxCocoa

protocol Presentation {
    typealias Input = (
        username: Driver<String>,
        password:Driver<String>,
        logIn:Driver<Void>
    )
    
    typealias Output = (
        enableLogIn: Driver<Bool>,()
    )
    typealias Producer = (Presentation.Input) -> Presentation
    
    var input : Input {get}
    var output : Output{get}
}
class ChatLogInViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    private var presenter:Presentation!
    private let bag = DisposeBag()
    var presenterProducer:Presentation.Producer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = presenterProducer((
            username: usernameTextField.rx.text.orEmpty.asDriver(),
            password:passwordTextField.rx.text.orEmpty.asDriver(),
            logIn: logInButton.rx.tap.asDriver()
        ))
        setup()
        setupBinding()
    }

}

private extension ChatLogInViewController {
    func setup() {
        logoImageView.image = UIImage(named: "logo", in: Bundle(for:ChatLogInViewController.self),with: nil)
        avatarImageView.image = UIImage(named: "avatar",in: Bundle(for:ChatLogInViewController.self),with: nil)
        
    }
    
    func setupBinding() {
        presenter.output.enableLogIn
            .drive(logInButton.rx.isEnabled)
            .disposed(by: bag)
    }
}
