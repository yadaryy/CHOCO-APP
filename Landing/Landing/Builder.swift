//
//  Builder.swift
//  Landing
//
//  Created by Yadar Tulayathamrong on 24/12/2566 BE.
//

import UIKit
import Utility

public final class Builder {
    
   public static func build(completion: @escaping() -> Void) -> UIViewController {
        
       let storyboard = UIStoryboard.init(name: "Landing", bundle: Bundle.init(for: self))
       let view = LandingViewController.instantiate(from: storyboard)
       view.onStart = completion
       return view
    }
}
