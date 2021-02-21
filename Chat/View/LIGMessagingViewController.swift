//
//  LIGMessagingViewController.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import UIKit

class LIGMessagingViewController: LIGViewController {

  // MARK: - View Controller Life Cycle
  
  public lazy var viewModel = LIGMessagingViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
        
    let logoutButton = UIButton(type: .custom)
    logoutButton.frame = CGRect(x: logoutButton.frame.origin.x,
                                y: logoutButton.frame.origin.y,
                                width: 65,
                                height: 30)
    logoutButton.setTitle("Log out", for: .normal)
    logoutButton.setTitleColor(.white, for: .normal)
    logoutButton.backgroundColor = UIColor.Theme.gray
    logoutButton.layer.cornerRadius = LIGConstants.DEFAULT_CORNER_RADIUS
    logoutButton.titleLabel?.font = UIFont.setBold(fontSize: 14.0)
    logoutButton.addTarget(self, action: #selector(logoutHandler), for: .touchUpInside)
    
    let addButton: UIBarButtonItem = UIBarButtonItem(customView: logoutButton)
    
    self.navigationItem.rightBarButtonItem = addButton
  }
  
  // MARK: - Handlers
  
  @objc private func logoutHandler(sender: AnyObject) {
    self.viewModel.logout(onSuccess: {
      LIGStoryboardManager.authenticateUser(
        operationName: "Sign up",
        changeViewName: "Login")
    })
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
