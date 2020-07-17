//
//  PayActionService.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/17.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import Alamofire

struct PayActionService {
  static let shared = PayActionService()
  func makeParameter(_ user_comment: String?) -> Parameters {
    print(user_comment)
    return ["user_comment" : user_comment]
  }
  
  func postUserComment(order_idx: Int?, user_comment: String?, completion: @escaping(NetworkResult<Any>) -> Void) {
    let header: HTTPHeaders = ["token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MSwiaWF0IjoxNTk0MDI1NzE2LCJleHAiOjE1OTc2MjU3MTYsImlzcyI6IkJvb3N0ZXIifQ.FtWfnt4rlyYH9ZV3TyOjLZXOkeR7ya96afmA0zJqTI8"]
    
    let dataRequest = Alamofire.request(APIConstraints.orderRequest+"/"+String(order_idx!)+"/request", method: .post, parameters: makeParameter(user_comment), encoding: BodyStringEncoding(body: user_comment!), headers: header)
    
    dataRequest.responseData { dataResponse in
      switch dataResponse.result{
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        var networkResult:NetworkResult<Any>?
        switch statusCode{
        case 200:
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(PayActionData.self, from: value) else { return networkResult = .pathErr }
          
          print(decodedData)
          
          if decodedData.status == 200{
            networkResult = .success(decodedData.message)
          }
          else if decodedData.status == 400 {
            networkResult = .requestErr(decodedData.message)
          }
        case 400: networkResult = .pathErr
        case 500: networkResult = .serverErr
        default: networkResult = .networkFail
        }
        completion(networkResult!)
      case .failure : completion(.networkFail)
      }
    }
  }
}

struct BodyStringEncoding: ParameterEncoding {

    private let body: String

    init(body: String) { self.body = body }

    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        guard var urlRequest = urlRequest.urlRequest else { throw Errors.emptyURLRequest }
        guard let data = body.data(using: .utf8) else { throw Errors.encodingProblem }
        urlRequest.httpBody = data
        return urlRequest
    }
}
extension BodyStringEncoding {
    enum Errors: Error {
        case emptyURLRequest
        case encodingProblem
    }
}

extension BodyStringEncoding.Errors: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .emptyURLRequest: return "Empty url request"
            case .encodingProblem: return "Encoding problem"
        }
    }
}
