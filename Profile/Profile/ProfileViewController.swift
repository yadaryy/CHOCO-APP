//
//  ProfileViewController.swift
//  Profile
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    private var presenter : Presentation!
    var presenterProducer: Presentation.Producer!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter = presenterProducer(())
        setupUI()
    }

}

private extension ProfileViewController {
    func setupUI(){
        profileImageView.image = UIImage(named: "person")
    }
}
