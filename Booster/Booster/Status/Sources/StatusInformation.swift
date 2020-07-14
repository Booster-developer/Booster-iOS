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
  var status : Int
  
  init(orderNum: Int, storeName: String, date: String, docsName: String, status: Int) {
    self.orderNum = orderNum
    self.storeName = storeName
    self.date = date
    self.docsName = docsName
    self.status = status
  }
  func getImageName() -> String {
    switch self.status {
    case 1: return "progressSlider1"
    case 2: return "progressSlider2"
    case 3: return "progressSlider3"
    default: return "progressSlider1"
    }
    
  }
}


