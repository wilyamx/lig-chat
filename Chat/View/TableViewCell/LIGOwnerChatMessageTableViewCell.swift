//
//  LIGOwnerChatMessageTableViewCell.swift
//  Chat
//
//  Created by William S. Rena on 2/22/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import UIKit

class LIGOwnerChatMessageTableViewCell: LIGChatMessageTableViewCell {

  override func awakeFromNib() {
      super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
  }
    
  override func configureViewCell(
    displayObject: LIGDisplayObject,
    loginUserId: Int32) {
    guard let data = displayObject as? LIGChatMessageDO else { return }
    
    self.lblMessage.text = data.message
    self.lblUsername.text = data.name
    
    super.configureViewCell(displayObject: displayObject,
                            loginUserId: loginUserId)
  }
}
