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
  
  init(orderNum: Int, storeName: String, date: String, docsName: String) {
    self.orderNum = orderNum
    self.storeName = storeName
    self.date = date
    self.docsName = docsName
  }
}
