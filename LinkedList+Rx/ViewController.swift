//
//  ViewController.swift
//  LinkedList+Rx
//
//  Created by Miguel on 2018/7/23.
//  Copyright © 2018年 Miguel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import RxSwiftExt

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let lists = LinkedList<String>()
    lists.countVariable
      .ignoreWhen{ $0 == 0 }
      .subscribe(onNext: { (count) in
      print("lists count change to \(count)。")
    }).disposed(by: rx.disposeBag)

    lists.append("First")
    lists.append("Second")
    lists.removeLast()
    lists.removeLast()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

