//
//  LIGStoryboardManager.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import UIKit

class LIGStoryboardManager {
  static let shared = LIGStoryboardManager()
  static let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
  
  private init(){}
    
  static func getAuthenticationVC() -> LIGAuthenticationViewController {
    return mainStoryboard.instantiateViewController(withIdentifier: "LIGAuthenticationViewController") as! LIGAuthenticationViewController
  }
  
  static func getAuthenticationNC() -> UINavigationController {
    return mainStoryboard.instantiateViewController(withIdentifier: "LIGAuthenticationNavigationController") as! UINavigationController
  }
}
