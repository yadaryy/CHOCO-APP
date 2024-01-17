//
//  ChatRoomViewController.swift
//  ChatRoom
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import UIKit
import EmptyView

class ChatRoomViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private lazy var createChatRoomButton: UIButton = {
        let button = UIButton(type: .custom) as UIButton
        
        let yPosition = self.view.frame.height - 157
        let xPosition = self.view.frame.width - 80
        let image = UIImage(systemName: "plus")
        button.setImage(image, for: .normal)
        button.tintColor = .deepBlue
        button.frame = CGRect(x: xPosition , y:yPosition , width: 80,height: 80)
        button.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        
        button.layer.zPosition = 1
        
        return button
    }()
    
    private var presenter : Presentation!
    var presenterProducer: Presentation.Producer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = presenterProducer(())
        setupUI()
        setupBinding()
    }
}

private extension ChatRoomViewController {
    func setupUI() {
        self.view.addSubview(createChatRoomButton)
        let emptyImage = UIImage(systemName: "message")!
        let emptyView = EmptyView(frame: .zero)
        emptyView.configure(image:emptyImage,title: "Oh No!", subtitle: "Lets start your chat")
        self.tableView.backgroundView = emptyView
    }
    func setupBinding() {
        
    }
    
}
