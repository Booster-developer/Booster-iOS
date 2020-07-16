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
  
  func getOption(fileidx:Int, completion: @escaping (NetworkResult<Any>)
    -> Void) {
    let header: HTTPHeaders = ["token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MSwiaWF0IjoxNTk0MDI1NzE2LCJleHAiOjE1OTc2MjU3MTYsImlzcyI6IkJvb3N0ZXIifQ.FtWfnt4rlyYH9ZV3TyOjLZXOkeR7ya96afmA0zJqTI8"]
    let index = APIIndex.init(index: .fileIdx(fileidx)).index.getIdx()
    
    let dataRequest = Alamofire.request(APIConstraints.orderRequest+index+"/options", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
    
    dataRequest.responseData { dataResponse in
      switch dataResponse.result {
      case .success :
        guard let statusCode = dataResponse.response?.statusCode else { return }
        guard let value = dataResponse.result.value else { return }
        var networkResult: NetworkResult<Any>?
        
        print(statusCode)
        
        switch statusCode {
        case 200:
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(OptionData.self, from: value) else {return networkResult = .pathErr}
          if decodedData.status == 200 {
            networkResult = .success(decodedData.data)
          }
          else if decodedData.status == 403 {
            networkResult = .requestErr(decodedData.message)
          }
          else {
            networkResult = .serverErr
          }
        case 400:
          networkResult = .pathErr
        case 500: networkResult = .serverErr
        default: networkResult = .networkFail
        }
        completion(networkResult!)
      case .failure : completion(.networkFail)
      }
    }
  }
}
