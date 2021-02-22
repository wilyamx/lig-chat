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
  
  @IBOutlet weak var tblMessages: UITableView!
  
  public lazy var viewModel = LIGMessagingViewModel()
  
  private var messages: [LIGChatMessageDO] = [LIGChatMessageDO]()
  private var loginUserId: Int32 = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
        
    self.view.backgroundColor = .white
    
    // this will identify if message from owner or other member
    if let loginUser = self.viewModel.getLoginUser() {
      self.loginUserId = loginUser.id ?? 0
    }
    self.getChannelMessages()
   
    self.initializeUI()
  }
  
  // MARK: - Handlers
  
  @objc private func logoutHandler(sender: AnyObject) {
    self.viewModel.logout(onSuccess: {
      LIGStoryboardManager.authenticateUser(
        operationName: "Sign up",
        changeViewName: "Login")
    })
  }
  
  // MARK: - Private Methods
  
  private func initializeUI() {
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
    
    // ---
    
    self.tblMessages.register(UINib(nibName: "LIGOwnerChatMessageTableViewCell",
                             bundle: Bundle.main),
                    forCellReuseIdentifier: String(describing: LIGOwnerChatMessageTableViewCell.self))
    self.tblMessages.register(UINib(nibName: "LIGMemberChatMessageTableViewCell",
                             bundle: Bundle.main),
                    forCellReuseIdentifier: String(describing: LIGMemberChatMessageTableViewCell.self))
    
    self.tblMessages.rowHeight = UITableView.automaticDimension
    self.tblMessages.estimatedRowHeight = 10
    self.tblMessages.allowsMultipleSelection = false
    
    self.tblMessages.dataSource = self
    self.tblMessages.delegate = self
    self.tblMessages.tableHeaderView = UIView()
    self.tblMessages.tableFooterView = UIView()
    self.tblMessages.separatorStyle = .none
    self.tblMessages.backgroundColor = self.view.backgroundColor
  }
  
  private func getChannelMessages() {
    // request data for messages
    self.viewModel.getMessages(
      completion: { messages in
        LIGReference.appDelegate.log.info("\(DebugInfoKey.messaging.rawValue) first \(messages.count) message(s)")
        self.messages = messages
        
        DispatchQueue.main.async {
          self.tblMessages.reloadData()
        }
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

extension LIGMessagingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.messages.count
  }
 
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let data = self.messages[indexPath.row]
      
    // owned messages
    if data.userId == self.loginUserId {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: String(describing: LIGOwnerChatMessageTableViewCell.self),
        for: indexPath) as! LIGOwnerChatMessageTableViewCell
      
      cell.selectionStyle = .none
      cell.configureViewCell(displayObject: data,
                             loginUserId: self.loginUserId)
      return cell
    }
    
    // recipient messages
    else {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: String(describing: LIGMemberChatMessageTableViewCell.self),
        for: indexPath) as! LIGMemberChatMessageTableViewCell
      cell.selectionStyle = .none
      cell.configureViewCell(displayObject: data,
                             loginUserId: self.loginUserId)
      return cell
    }
  }
}

extension LIGMessagingViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let data = self.messages[indexPath.row]
//    DebugInfo.log(info: "\(DebugInfoKey.messaging.rawValue) selected a message \(data.message) (\(data.messageId)) at index (\(indexPath.row))")
  }
}
