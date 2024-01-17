//
//  LandingViewController.swift
//  Landing
//
//  Created by Yadar Tulayathamrong on 24/12/2566 BE.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    var onStart: (()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func onStartTapped(_ sender: Any) {
        onStart?()
    }
    
}


private extension LandingViewController {
    func setup(){
        logoImageView.image = UIImage(named: "logo", in: Bundle(for:LandingViewController.self),with: nil)
        
    }
}
