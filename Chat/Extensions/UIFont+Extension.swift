//
//  UIFont+Extension.swift
//  Chat
//
//  Created by William S. Rena on 2/20/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import UIKit

extension UIFont {
  static func getFontName() -> String {
    return "Arial"
  }
  
  static func setRegular(fontSize size:CGFloat) -> UIFont {
      return UIFont(name: "\(getFontName())-MT", size: size) ?? UIFont.boldSystemFont(ofSize: size)
  }
  
  static func setBold(fontSize size:CGFloat) -> UIFont {
      return UIFont(name: "\(getFontName())-BoldMT", size: size) ?? UIFont.boldSystemFont(ofSize: size)
  }
}
