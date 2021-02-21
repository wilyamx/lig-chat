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
  
  static func authenticateUser(operationName: String, changeViewName: String) {
    let nc = LIGStoryboardManager.getAuthenticationNC()
    nc.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.setBold(fontSize: 18.0)]
    if let vc = nc.viewControllers.first as? LIGAuthenticationViewController {
      vc.title = "Chat app"
      vc.operationName = operationName
      vc.changeViewName = changeViewName
    }
    
    if let scene = UIApplication.shared.connectedScenes.first,
       let delegate = scene.delegate as? SceneDelegate,
       let window = delegate.window {
      window.rootViewController = nc
    }
  }
  
}
