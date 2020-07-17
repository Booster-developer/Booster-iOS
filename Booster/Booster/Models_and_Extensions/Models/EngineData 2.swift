//
//  engineData.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import Alamofire

struct EngineData: Codable {
  var status: Int
  var success: Bool
  var message: String
  var data: engineList
  
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
    data = (try? values.decode(engineList.self, forKey: .data)) ?? engineList.init(engine_point: 0,
                                                                                   engine_list: [engines.init()])
  }
}

struct engineList: Codable {
  var engine_point: Int
  var engine_list: [engines]
}

struct engines: Codable {
  var engine_sign: Int
  var engine_cost: Int
  var engine_time: String
  var engine_store_name: String
  
  init() {
    self.engine_sign = 0
    self.engine_cost = 0
    self.engine_time = " "
    self.engine_store_name = " "
  }
}
