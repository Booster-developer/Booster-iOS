//
//  EditProfileData.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/16.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
struct EditProfileData: Codable {
  var status: Int
  var success: Bool
  var message: String
  var data: ProfileData
  
  enum CodingKeys: String, CodingKey {
    case status = "status"
    case success = "success"
    case message = "message"
    case data = "data"
  }
  
  init(from decoder: Decoder) throws{
  let values = try decoder.container(keyedBy: CodingKeys.self)
  status = (try? values.decode(Int.self, forKey: .status)) ?? -1
  success = (try? values.decode(Bool.self, forKey: .success)) ?? false
  message = (try? values.decode(String.self, forKey: .message)) ?? ""
    data = (try? values.decode(ProfileData.self, forKey: .data)) ?? ProfileData.init(user_name: " ", user_university: 0, user_pw: " ")
  }
}

struct ProfileData: Codable {
  var user_name: String
  var user_university: Int
  var user_pw: String
}
