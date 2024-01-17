//
//  FriendViewController.swift
//  Friend
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import UIKit
import EmptyView

class FriendViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var presenter : Presentation!
    var presenterProducer: Presentation.Producer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.presenter = presenterProducer(())
    }

}

private extension FriendViewController {
    func setupUI() {
        let emptyImage = UIImage(systemName: "person.3")!
        let emptyView = EmptyView(frame: .zero)
        emptyView.configure(image:emptyImage,title: "Sigh!", subtitle: "No Friends No Problems")
        self.tableView.backgroundView = emptyView
    }
}
