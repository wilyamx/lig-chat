//
//  LIGIndexViewController.swift
//  Chat
//
//  Created by William S. Rena on 2/20/21.
//

import UIKit

class LIGIndexViewController: LIGViewController {

  @IBOutlet weak var viewContainer: UIView!
  @IBOutlet weak var imgvLogo: UIImageView!
  @IBOutlet weak var lblApp: UILabel!
  @IBOutlet weak var btnSignup: UIButton!
  @IBOutlet weak var btnLogin: UIButton!
  
  // MARK: - View Controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.viewContainer.backgroundColor = .clear
    
    self.lblApp.textColor = UIColor.Theme.darkGray
    self.lblApp.font = UIFont.setBold(fontSize: 18.0)
    self.lblApp.backgroundColor = .clear
    
    self.btnSignup.setTitleColor(.white, for: .normal)
    self.btnSignup.setTitle("Sign up", for: .normal)
    self.btnSignup.backgroundColor = UIColor.Theme.darkGreen
    self.btnSignup.layer.cornerRadius = LIGConstants.DEFAULT_CORNER_RADIUS
    self.btnSignup.titleLabel?.font = UIFont.setBold(fontSize: 18.0)
    
    self.btnLogin.setTitleColor(.white, for: .normal)
    self.btnLogin.setTitle("Login", for: .normal)
    self.btnLogin.backgroundColor = UIColor.Theme.lightGreen
    self.btnLogin.layer.cornerRadius = LIGConstants.DEFAULT_CORNER_RADIUS
    self.btnLogin.titleLabel?.font = UIFont.setBold(fontSize: 18.0)
  }

  // MARK: - Actions
  
  @IBAction func signupAction(_ sender: Any) {
    LIGStoryboardManager.authenticateUser(operationName: "Sign up",
                                          changeViewName: "Login")
  }
  
  @IBAction func loginAction(_ sender: Any) {
    LIGStoryboardManager.authenticateUser(operationName: "Login",
                                          changeViewName: "Sign up")
  }
  
}

