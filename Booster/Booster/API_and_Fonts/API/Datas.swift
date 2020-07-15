//
//  Datas.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
struct LogInData : Codable{
  var status : Int
  var success:Bool
  var message : String
  var data : TokenData?
  s
  enum CodingKeys:String, CodingKey {
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
    data = (try? values.decode(TokenData.self, forKey: .data)) ?? nil
    }
  }

struct TokenData:Codable{
  var accessToken : String
}

struct IDCheckData : Codable {
  var status : Int
  var success:Bool
  var message : String
  
  enum CodingKeys:String, CodingKey {
    case status = "status"
    case success = "success"
    case message = "message"
  }
  init(from decoder: Decoder) throws{
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = (try? values.decode(Int.self, forKey: .status)) ?? -1
    success = (try? values.decode(Bool.self, forKey: .success)) ?? false
    message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct SignUpData : Codable {
  var status : Int
  var success:Bool
  var message : String
  
  enum CodingKeys:String, CodingKey {
    case status = "status"
    case success = "success"
    case message = "message"
  }
  init(from decoder: Decoder) throws{
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = (try? values.decode(Int.self, forKey: .status)) ?? -1
    success = (try? values.decode(Bool.self, forKey: .success)) ?? false
    message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

