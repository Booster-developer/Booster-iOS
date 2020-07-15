//
//  MyEngineData.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/15.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation

struct MyEngineData: Codable {
  var status: Int
  var success: Bool
  var message: String
  var data: Point
  
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
    data = (try? values.decode(Point.self, forKey: .data)) ?? Point.init(user_name: " ",
                                                                         univ_idx: 0, user_id: " ", user_point: 0)
  }
}

struct Point: Codable {
  var user_name: String
  var univ_idx: Int
  var user_id: String
  var user_point: Int
}
