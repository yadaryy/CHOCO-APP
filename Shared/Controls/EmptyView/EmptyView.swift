//
//  EmptyView.swift
//  EmptyView
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import UIKit

public final class EmptyView : UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emptySubTitle: UILabel!
    @IBOutlet weak var emptyTitle: UILabel!
    @IBOutlet weak var emptyImageView: UIImageView!
    
    public override init(frame:CGRect){
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(){
        Bundle(for: type(of: self)).loadNibNamed("EmptyView", owner: self, options: nil)
        backgroundColor = .clear
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    public func configure(image:UIImage,title:String, subtitle: String) {
        self.emptyImageView.image = image
        self.emptyTitle.text = title
        self.emptySubTitle.text = subtitle
    }
}
