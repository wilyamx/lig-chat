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
    self.messages.append(LIGChatMessageDO(userId: 1, name: "May", message: "Hi Ken, I just sent the document to you on mail. Plz check it!"))
    self.messages.append(LIGChatMessageDO(userId: 4, name: "Evaluator", message: "Thank you May! It was great."))
    self.messages.append(LIGChatMessageDO(userId: 4, name: "Evaluator", message: "I just checked it. Thanks!"))
    self.messages.append(LIGChatMessageDO(userId: 2, name: "Mark", message: "Hi guys, what's up?"))
    self.messages.append(LIGChatMessageDO(userId: 3, name: "April", message: "Hi Mark, I stay Cebu now"))
    
    // testing the bubble auto-layout content
    self.messages.append(LIGChatMessageDO(userId: 1, name: "May", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."))
    self.messages.append(LIGChatMessageDO(userId: 1, name: "May", message: "Lorem Ipsum"))
    self.messages.append(LIGChatMessageDO(userId: 4, name: "Evaluator", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."))
    self.messages.append(LIGChatMessageDO(userId: 4, name: "Evaluator", message: "Lorem"))
   
    completion(self.messages)
  }
  
  func sendMessage(
    message: String,
    completion: @escaping (LIGChatMessageDO) -> Void) {
      if let loginUser = self.getLoginUser() {
        let newMessage = LIGChatMessageDO(
          userId: loginUser.id ?? 0,
          name: loginUser.username ?? "",
          message: message)
        
        completion(newMessage)
      }
  }
  
}
