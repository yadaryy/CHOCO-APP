//
//  Builder.swift
//  ChatRoom
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import UIKit
import Utility
public final class Builder {
   public static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
       let storyboard = UIStoryboard.init(name: "Profile", bundle: Bundle.init(for: self))
       let view = ProfileViewController.instantiate(from: storyboard)
       view.title = "Profile"
       let submodules: Router.Submodules = ()
       let router = Router(viewController: view, submodules: submodules)
       
       view.presenterProducer = { input in
           Presenter(input: input, dependencies:(
           router: router,
           usecases: (
            input:(),
            output:()
                )
           ))
       }
       return factory(view)
    }
}
