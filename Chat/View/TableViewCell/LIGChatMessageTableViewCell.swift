//
//  LIGChatMessageTableViewCell.swift
//  Chat
//
//  Created by William S. Rena on 2/22/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import UIKit

class LIGChatMessageTableViewCell: UITableViewCell {

  @IBOutlet weak var viewBubble: UIView!
  @IBOutlet weak var lblMessage: UILabel!
  @IBOutlet weak var lblUsername: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
      
    self.viewBubble.layer.cornerRadius = LIGConstants.DEFAULT_CORNER_RADIUS
    self.viewBubble.backgroundColor = UIColor.Theme.lightGreen
    self.lblMessage.textColor = .white
    self.lblMessage.font = UIFont.setRegular(fontSize: 16)
    
    self.lblUsername.textColor = UIColor.Theme.gray
    self.lblUsername.font = UIFont.setRegular(fontSize: 14)
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
}

  func configureViewCell(displayObject: LIGDisplayObject, loginUserId: Int32) {
    if let data = displayObject as? LIGChatMessageDO,
       data.userId == loginUserId {
      self.lblUsername.text = "You"
    }
  }
}
