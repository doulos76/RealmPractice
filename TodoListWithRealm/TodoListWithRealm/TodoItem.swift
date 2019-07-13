//
//  TodoItem.swift
//  TodoListWithRealm
//
//  Created by dave76 on 14/07/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class TodoItem: Object {
  enum Property: String {
    case id, text, isCompleted
  }
  
  dynamic var id = UUID().uuidString
  dynamic var text = ""
  dynamic var isCompleted = false
  
  override static func primaryKey() -> String {
    return TodoItem.Property.id.rawValue
  }
  
  convenience init(_ text: String) {
    self.init()
    self.text = text
  }
}
