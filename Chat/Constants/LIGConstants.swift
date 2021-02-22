//
//  LIGConstants.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import UIKit

import UIKit

struct LIGReference {
  static let appDelegate = UIApplication.shared.delegate as! AppDelegate
}

struct LIGConstants {
  static let DEFAULT_CORNER_RADIUS: CGFloat = 5.0
}

public enum DebugInfoKey: String {
  case realmDb = "[REALMDB]>>"
  case messaging = "[MESSAGING]>>"
}

struct LIGRequestError {
    var errorCode: Int = 0
    var errorMessage: String = ""
}

enum LIGResponse<T> {
    case succeed(T)
    case failed(LIGRequestError)
}
