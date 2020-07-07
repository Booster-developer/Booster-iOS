//
//  StatusInformation.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/07.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

struct StatusInformation {
  var orderNum: Int
  var storeName: String
  var date: String
  var docsName: String
  var status : Status
  
  init(orderNum: Int, storeName: String, date: String, docsName: String, status: Status) {
    self.orderNum = orderNum
    self.storeName = storeName
    self.date = date
    self.docsName = docsName
    self.status = status
  }
}

enum Status {
  case order
  case printing
  case done
  
  func getImageName() -> String {
    switch self {
    case .order: return "progressSlider1"
    case .printing: return "progressSlider2"
    case .done: return "progressSlider3"
    }
  }
}

