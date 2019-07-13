//
//  TodoListController.swift
//  TodoListWithRealm
//
//  Created by dave76 on 14/07/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit
import RealmSwift

class TodoListController: UITableViewController {
  
  // MARK:- Properties
  let cellId = "cellId"
  
  // MARK:- View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
}


extension TodoListController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodoTableViewCell
    
    return cell
  }
}
