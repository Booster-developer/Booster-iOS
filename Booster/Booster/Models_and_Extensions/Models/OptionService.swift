//
//  OptionService.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import Alamofire

struct OptionService {
  static let shared = OptionService()
  
  func getOption(completion: @escaping (NetworkResult<Any>)
    -> Void) {
    let header: HTTPHeaders = ["token": "dhvksjndfljeoaifjhiewhdoiqwejfoijiu2367teuirgnlkdcmvlmnbdfvwru20i3epdfnjxmcvlksnbgfhsoifjvdsjv"]
    let a = APIIndex.init(index: .fileIdx(1))

  }
}
