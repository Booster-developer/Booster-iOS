//
//  PaymentData.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/15.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation

// MARK: - PaymentData
struct PaymentData: Codable {
  let status: Int
  let success: Bool
  let message: String
  let data: DataClass
  
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
    data = (try? values.decode(DataClass.self, forKey: .data)) ?? DataClass.init(store_name: " ", store_idx: 0, fileOption: [FileOption.init()], order_price: 0, user_point: 0, user_remain_point: 0)
  }
}

// MARK: - DataClass
struct DataClass: Codable {
  var store_name: String
  var store_idx: Int
  var fileOption: [FileOption]
  var order_price: Int
  var user_point: Int
  var user_remain_point: Int
  
}

// MARK: - FileOption
struct FileOption: Codable {
  var file_name: String
  var file_extension: String
  var file_color: String
  var file_direction: String
  var file_sided_type: String
  var file_collect: Int
  var file_copy_number: Int
  var file_price: Int
  var file_range: String
  
  enum CodingKeys: String, CodingKey {
    case file_name = "file_name"
    case file_extension = "file_extension"
    case file_color = "file_color"
    case file_direction = "file_direction"
    case file_sided_type = "file_sided_type"
    case file_collect = "file_collect"
    case file_copy_number = "file_copy_number"
    case file_price = "file_price"
    case file_range = "file_range"
  }
  
  init() {
    self.file_name = " "
    self.file_extension = " "
    self.file_color = " "
    self.file_direction = " "
    self.file_sided_type = " "
    self.file_collect = 0
    self.file_copy_number = 0
    self.file_price = 0
    self.file_range = " "
  }
}

