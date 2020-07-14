//
//  NetworkResult.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
enum NetworkResult<T> {
  case success(T)
  case requestErr(T)
  case pathErr
  case serverErr
  case networkFail
}
