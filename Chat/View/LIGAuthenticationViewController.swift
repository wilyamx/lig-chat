//
//  LIGAuthenticationViewController.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import UIKit

class LIGAuthenticationViewController: LIGViewController {

  let ERROR_HEIGHT: CGFloat = 30.0
  
  @IBOutlet weak var viewUsername: UIView!
  @IBOutlet weak var viewUsernameError: UIView!
  @IBOutlet weak var viewUserNameErrorHeightConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var viewPassword: UIView!
  @IBOutlet weak var viewPasswordError: UIView!
  @IBOutlet weak var viewPasswordErrorHeightConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var btnOperation: UIButton!
  @IBOutlet weak var btnChangeView: UIButton!
  @IBOutlet weak var lblTerms: UILabel!
  
  var isValidUsername: Bool? = true {
    didSet {
      if let isValid = isValidUsername,
         isValid == true {
        self.viewUserNameErrorHeightConstraint.constant = 0
        self.viewUsernameError.isHidden = true
      }
      else {
        self.viewUserNameErrorHeightConstraint.constant = ERROR_HEIGHT
        self.viewUsernameError.isHidden = false
      }
    }
  }
  
  var isValidPassword: Bool? = true {
    didSet {
      if let isValid = isValidPassword,
         isValid == true {
        self.viewPasswordErrorHeightConstraint.constant = 0
        self.viewPasswordError.isHidden = true
      }
      else {
        self.viewPasswordErrorHeightConstraint.constant = ERROR_HEIGHT
        self.viewPasswordError.isHidden = false
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.isValidUsername = true
    self.isValidPassword = true
  }
    

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */

}
