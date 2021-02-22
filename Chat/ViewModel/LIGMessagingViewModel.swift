//
//  LIGMessagingViewModel.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import Foundation

class LIGMessagingViewModel: LIGViewModel {
  private var messages = [LIGChatMessageDO]()
  
  func logout(
    onSuccess: @escaping () -> Void) {
    
    LIGUserManager.shared.logoutUser()
    onSuccess()
  }
  
  func getLoginUser() -> LIGUserSchema? {
    return LIGUserManager.shared.getLoginUser()
  }
  
  func getMessages(completion: @escaping ([LIGChatMessageDO]) -> Void) {
    self.messages.removeAll()
    self.messages.append(LIGChatMessageDO(userId: 0, name: "May", message: "Hi Ken, I just sent the document to you on mail. Plz check it!"))
    self.messages.append(LIGChatMessageDO(userId: 1, name: "Williamx", message: "Thank you May! It was great."))
    self.messages.append(LIGChatMessageDO(userId: 1, name: "Williamx", message: "I just checked it. Thanks!"))
    self.messages.append(LIGChatMessageDO(userId: 0, name: "Mark", message: "Hi guys, what's up?"))
    self.messages.append(LIGChatMessageDO(userId: 0, name: "April", message: "Hi Mark, I stay Cebu now"))
   
    completion(self.messages)
  }
}
