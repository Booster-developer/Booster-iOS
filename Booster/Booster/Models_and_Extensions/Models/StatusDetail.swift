//
//  StatusDetail.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/17.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation

struct StatusDetail: Codable {
  var status: Int
  var success: Bool
  var message: String
  var data: OrderFile
  
  enum CodingKeys: String, CodingKey {
    case status = "status"
    case success = "success"
    case message = "message"
    case data = "data"
  }
}
struct OrderFile: Codable {
  var order_idx: Int
  var order_store_name: String
  var order_state: Int
  var order_time: String
  var order_price: Int
  var order_comment: String
  var order_file_list: [Files]
}

struct Files: Codable {
  var file_thumbnail_path: String
}
