//
//  String+Extension.swift
//  Utility
//
//  Created by Yadar Tulayathamrong on 8/1/2567 BE.
//

import Foundation

public extension String {
    func isValidEmail() -> Bool {
      let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
      let pattern = NSPredicate(format: "SELF MATCHES %@", regex)
      return pattern.evaluate(with: self)
    }
}
