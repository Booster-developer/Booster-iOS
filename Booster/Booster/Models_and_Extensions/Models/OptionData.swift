//
//  OptionData.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import Alamofire

struct OptionData: Codable {
  var status: Int
  var success: Bool
  var message: String
  var data: OptionList
  
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
    data = (try? values.decode(OptionList.self, forKey: .data)) ?? OptionList.init(file_color: "흑백", file_direction: "세로", file_sided_type: "단면", file_collect: 1, file_copy_number: 1, file_range: "전체 페이지")
  }
}

struct OptionList: Codable {
  var file_color : String
  var file_direction: String
  var file_sided_type: String
  var file_collect: Int
  var file_copy_number: Int
  var file_range: String
  
}
