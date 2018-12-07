//
//  LinkedList.swift
//  LinkedList+Rx
//
//  Created by Miguel on 2018/7/23.
//  Copyright © 2018年 Miguel. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LinkedList<T> {

  public typealias Node = ListNode<T>
  let countVariable = BehaviorRelay<Int>(value: 0)
  private var head: Node?
  private var tail: Node?

  var isEmpty: Bool {
    return head == nil
  }

  var first: Node? {
    return head
  }

  var last: Node? {
    return tail
  }

  // MARK: - Public Methods

  func append(_ value: T) {
    let newNode = Node(value: value)
    if let tailNode = tail {
      newNode.previous = tailNode
      tailNode.next = newNode
    } else {
      tail = newNode
    }
    countVariable.accept(countVariable.value + 1)
  }

  func removeAll() {
    head = nil
    countVariable.accept(0)
  }

  func removeFirst() -> T {
    #if DEBUG
    assert(!isEmpty, "Remove first object should not be nil.")
    #endif
    return remove(node: head!)
  }

  func removeLast() -> T {
    #if DEBUG
    assert(!isEmpty, "Remove last object should not be nil.")
    #endif
    return remove(node: last!)
  }

  // MARK: - Private Methods

  private func remove(node: Node) -> T {
    let prev = node.previous
    let next = node.next

    if let prev = prev {
      prev.next = next
    } else {
      head = next
    }

    next?.previous = prev

    if next == nil {
      tail = prev
    }

    node.previous = nil
    node.next = nil
    countVariable.accept(countVariable.value - 1)
    return node.value
  }

}
