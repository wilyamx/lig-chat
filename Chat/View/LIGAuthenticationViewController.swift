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
  @IBOutlet weak var txtUsername: UITextField!
  @IBOutlet weak var lblUsernameError: UILabel!
  
  @IBOutlet weak var viewPassword: UIView!
  @IBOutlet weak var viewPasswordError: UIView!
  @IBOutlet weak var viewPasswordErrorHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var txtPassword: UITextField!
  @IBOutlet weak var lblPasswordError: UILabel!
  
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
  
  // Explicit
  var operationName: String = "Login"
  var changeViewName: String = "Sign up"
  
  // MARK: - Actions
  
  @IBAction func operationAction(_ sender: Any) {
    
  }
  
  @IBAction func changeViewAction(_ sender: Any) {
    if self.changeViewName == "Login" {
      LIGStoryboardManager.authenticateUser(operationName: "Login", changeViewName: "Sign up")
    }
    else if self.changeViewName == "Sign up" {
      LIGStoryboardManager.authenticateUser(operationName: "Sign up", changeViewName: "Login")
    }
  }
  
  // MARK: - View Controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.viewUsername.layer.cornerRadius = LIGConstants.DEFAULT_CORNER_RADIUS
    self.viewUsername.backgroundColor = UIColor.Theme.textBgColor
    
    self.viewPassword.layer.cornerRadius = LIGConstants.DEFAULT_CORNER_RADIUS
    self.viewPassword.backgroundColor = UIColor.Theme.textBgColor
    
    self.viewUsernameError.backgroundColor = .clear
    self.viewPasswordError.backgroundColor = .clear
    self.lblUsernameError.textColor = UIColor.Theme.red
    self.lblPasswordError.textColor = UIColor.Theme.red
    self.lblUsernameError.font = UIFont.setRegular(fontSize: 14.0)
    self.lblPasswordError.font = UIFont.setRegular(fontSize: 14.0)
    
    self.btnOperation.layer.cornerRadius = LIGConstants.DEFAULT_CORNER_RADIUS
    
    self.txtUsername.textColor = UIColor.Theme.gray
    self.txtUsername.font = UIFont.setRegular(fontSize: 16.0)
    self.txtPassword.textColor = UIColor.Theme.gray
    self.txtPassword.font = UIFont.setRegular(fontSize: 16.0)
    
    self.lblTerms.textColor = UIColor.Theme.gray
    self.lblTerms.font = UIFont.setRegular(fontSize: 14.0)
    
    self.btnOperation.setTitleColor(.white, for: .normal)
    self.btnOperation.setTitle(self.operationName, for: .normal)
    self.btnOperation.backgroundColor = UIColor.Theme.lightGreen
    self.btnOperation.layer.cornerRadius = LIGConstants.DEFAULT_CORNER_RADIUS
    self.btnOperation.titleLabel?.font = UIFont.setBold(fontSize: 18.0)
    
    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 14),
      .foregroundColor: UIColor.Theme.gray,
      .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
    let attributeString = NSMutableAttributedString(
      string: self.changeViewName,
      attributes: attributes)
    self.btnChangeView.setAttributedTitle(attributeString, for: .normal)
    
    self.isValidUsername = false
    self.isValidPassword = false
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
