//
//  ListNode.swift
//  LinkedList+Rx
//
//  Created by Miguel on 2018/7/23.
//  Copyright © 2018年 Miguel. All rights reserved.
//

import Foundation

class ListNode<T> {
  var value: T
  var next: ListNode?
  var previous: ListNode?

  init(value: T) {
    self.value = value
  }

}
