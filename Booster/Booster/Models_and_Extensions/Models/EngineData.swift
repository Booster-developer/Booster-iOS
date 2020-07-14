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
  var engine_sign: Bool
  var engine_cost: Int
  var engine_time: String
  var engine_store_name: String
  
  init(engine_sign: Bool = true, engine_cost: Int = 0, engine_time: String = " ",
       engine_store_name: String = " ") {
    self.engine_sign = engine_sign
    self.engine_cost = engine_cost
    self.engine_time = engine_time
    self.engine_store_name = engine_store_name
  }
}
