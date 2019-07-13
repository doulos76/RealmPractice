//
//  TodoTableViewCell.swift
//  TodoListWithRealm
//
//  Created by dave76 on 14/07/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
  // MARK:- Properties
  private var onToggleCompleted: ((TodoItem) -> Void)?
  private var item: TodoItem?
  
  private let label: UILabel = {
    let label = UILabel()
    label.text = "Label"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 17)
    return label
  }()
  
  private let button: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("⏺", for: .normal)
    return button
  }()
  
  private func toggleCompleted() {
    guard let item = item else { fatalError("Missing Todo Item")}
    onToggleCompleted?(item)
  }
  
  // MARK:- Initializser
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureWith(_ item: TodoItem, onToggleCompleted: ((TodoItem) -> Void)? = nil) {
    self.item = item
    self.onToggleCompleted = onToggleCompleted
    label.attributedText = NSAttributedString(string: item.text, attributes: item.isCompleted ? [.strikethroughStyle: true] : [:])
    button.setTitle(item.isCompleted ? "☑️" : "⏺", for: .normal)
  }
  
  func setupView() {
    contentView.addSubview(label)
    contentView.addSubview(button)
  }
  
  func setupLayout() {
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: topAnchor),
      label.leadingAnchor.constraint(equalTo: leadingAnchor),
      label.bottomAnchor.constraint(equalTo: bottomAnchor),
      label.trailingAnchor.constraint(equalTo: button.leadingAnchor)
      ])
    
    NSLayoutConstraint.activate([
      button.topAnchor.constraint(equalTo: topAnchor),
      button.bottomAnchor.constraint(equalTo: bottomAnchor),
      button.trailingAnchor.constraint(equalTo: trailingAnchor),
      button.widthAnchor.constraint(equalToConstant: 40)
      ])
  
  }
}
