//
//  LIGChatMessageVM.swift
//  Chat
//
//  Created by William S. Rena on 2/22/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import UIKit

class LIGChatMessageDO: LIGDisplayObject {
  var userId: Int32
  var name: String
  var message: String
  
  init(userId: Int32 = 0,
       name: String = "",
       message: String = "") {
    self.userId = userId
    self.name = name
    self.message = message
  }
}
