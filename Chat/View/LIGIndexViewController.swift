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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.viewContainer.backgroundColor = .clear
    
    self.lblApp.textColor = UIColor.Theme.darkGray
    
    self.btnSignup.setTitleColor(.white, for: .normal)
    self.btnSignup.setTitle("Sign up", for: .normal)
    self.btnSignup.backgroundColor = UIColor.Theme.darkGreen
    self.btnSignup.layer.cornerRadius = 5.0
    
    self.btnLogin.setTitleColor(.white, for: .normal)
    self.btnLogin.setTitle("Login", for: .normal)
    self.btnLogin.backgroundColor = UIColor.Theme.lightGreen
    self.btnLogin.layer.cornerRadius = 5.0
  }


}

