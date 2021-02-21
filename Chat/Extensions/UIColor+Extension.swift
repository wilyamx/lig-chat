//
//  UIColor+Extension.swift
//  Chat
//
//  Created by William S. Rena on 2/20/21.
//

import UIKit

extension UIColor {
  struct Theme {
    static var lightGreen: UIColor  { return UIColor(red: 0.62, green: 0.87, blue: 0.27, alpha: 1.0) }
    static var darkGreen: UIColor  { return UIColor(red: 0.44, green: 0.63, blue: 0.19, alpha: 1.0) }
    
    static var gray: UIColor  { return UIColor(red: 0.4, green: 0.47, blue: 0.52, alpha: 1.0) }
    static var darkGray: UIColor  { return UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0) }
    
    static var textBgColor: UIColor  { return UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1.0) }
    static var red: UIColor  { return UIColor(red: 0.74, green: 0.25, blue: 0.23, alpha: 1.0) }
  }
}
