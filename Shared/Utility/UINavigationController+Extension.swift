//
//  UINavigationController+Extension.swift
//  Utility
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import UIKit

public typealias NavigationFactory = (UIViewController) -> UINavigationController

extension UINavigationController {
    public static func build(rootView: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let textStyleAttributes: [NSAttributedString.Key:Any] = [
            .foregroundColor: UIColor.deepBlue,
            .font : UIFont(name:"ArialRoundedMTBold", size: 20.0)!
            
        ]
        
        let largeTextStyleAttributes: [NSAttributedString.Key:Any] = [
            .foregroundColor: UIColor.deepBlue,
            .font : UIFont(name:"ArialRoundedMTBold", size: 36.0)!
        ]
        
        navigationController.navigationBar.titleTextAttributes = textStyleAttributes
        navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        
        return navigationController
    }
}
