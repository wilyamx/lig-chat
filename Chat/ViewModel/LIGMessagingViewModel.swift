//
//  LIGMessagingViewModel.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import Foundation

class LIGMessagingViewModel: LIGViewModel {
  func logout(
    onSuccess: @escaping () -> Void) {
    
    LIGUserManager.shared.logoutUser()
    onSuccess()
  }
}
