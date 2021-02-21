//
//  LIGPopupManager.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import UIKit

class LIGPopupManager {
  static let shared = LIGPopupManager()
  
  public func popUpErrorDetails(
    presenter: UIViewController,
    title: String,
    message: String) {
    
    let okAction = UIAlertAction(
      title: "OK",
      style: .default,
      handler: { (action) -> Void in
         
      })
    
    let dialogMessage = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert)
    dialogMessage.addAction(okAction)
    
    presenter.present(dialogMessage, animated: true, completion: nil)
  }
}
