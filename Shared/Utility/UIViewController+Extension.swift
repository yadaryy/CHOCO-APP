//
//  UIViewController+Extension.swift
//  Utility
//
//  Created by Yadar Tulayathamrong on 24/12/2566 BE.
//

import UIKit

public extension UIViewController {
    class func instantiate<T:UIViewController>(from storyboard: UIStoryboard , identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func instantiate(from storyboard: UIStoryboard) -> Self {
        return instantiate(from: storyboard, identifier: String(describing: self))
    }
    
    class func instantiate() -> Self {
        let className = String(describing: self)
        return instantiate(from:UIStoryboard(name: className, bundle: Bundle(for: self)), identifier: className)
    }
    
}

