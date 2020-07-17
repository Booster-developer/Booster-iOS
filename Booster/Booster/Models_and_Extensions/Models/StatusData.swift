//
//  StatusData.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/15.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation

struct StatusData: Codable {
  var status: Int
  var success: Bool
  var message: String
  var data: StatusList
  
  enum CodingKeys: String, CodingKey {
    case status = "status"
    case success = "success"
    case message = "message"
    case data = "data"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = (try? values.decode(Int.self, forKey: .status)) ?? -1
    success = (try? values.decode(Bool.self, forKey: .success)) ?? false
    message = (try? values.decode(String.self, forKey: .message)) ?? ""
    data = (try? values.decode(StatusList.self, forKey: .data)) ?? StatusList.init(user_name:"",booster_count: 1, order_list: [orders.init()])
  }
}

struct StatusList: Codable {
  var user_name:String
  var booster_count: Int
  var order_list: [orders]
}

struct orders: Codable {
  var order_idx: Int
  var order_store_name: String
  var order_time: String
  var order_title: String
  var order_state: Int
  
  init() {
    self.order_idx = 0
    self.order_store_name = " "
    self.order_time = " "
    self.order_title = " "
    self.order_state = 1
  }
}
