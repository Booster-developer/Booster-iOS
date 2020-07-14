//
//  Services.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import Alamofire


struct LoginService {
  static let shared = LoginService()
  
  private func makeParameter(_ id:String, _ pwd:String) ->Parameters{
    return ["user_id":id, "user_pw":pwd]
  }
  
  func login(id:String,pwd :String, completion : @escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["Content-Type":"application/json"]
    let dataRequest = Alamofire.request(APIConstraints.logIn, method: .post, parameters: makeParameter(id, pwd), encoding: JSONEncoding.default, headers: header)
    
    
    dataRequest.responseData { dataResponse in
      switch dataResponse.result {
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        let networkResult = judge(by: statusCode, value)
        completion(networkResult)
      case .failure: completion(.networkFail)
      }
    }
    
  }
}
func isUser(by data: Data) -> NetworkResult<Any> {
  let decoder = JSONDecoder()
  guard let decodedData = try? decoder.decode(LogInData.self, from: data) else { return .pathErr }
  guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
  return .success(tokenData.accessToken)
}
func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
  switch statusCode {
  case 200: return isUser(by: data)
  case 400: return .pathErr
  case 500: return .serverErr
  default: return .networkFail
    
  }
}

struct idCheckService{
  static let shared = idCheckService()
  private func makeParameter(_ id: String)->Parameters{
    return ["user_id" : id]
  }
  func checkID(id:String, completion:@escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["Content-Type":"application/json"]
    let dataRequest = Alamofire.request(APIConstraints.idCheck, method: .post, parameters: makeParameter(id), encoding: JSONEncoding.default, headers: header)
    dataRequest.responseData { dataResponse in
      switch dataResponse.result{
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        var networkResult:NetworkResult<Any>?
        print(statusCode)
        switch statusCode{
        case 200:
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(IDCheckData.self, from: value) else { return networkResult = .pathErr }
          
          print(decodedData.status)
          
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





struct SignUpService {
  static let shared = SignUpService()
  
  private func makeParameter(_ name:String, _ univ:Int, _ id: String, _ pw: String)->Parameters{
    return ["user_name" : name, "user_university" : univ, "user_id" : id,"user_pw" : pw]
  }
  func signup(_ name:String, _ univ:Int, _ id: String, _ pw: String, completion : @escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["Content-Type":"application/json"]
    let dataRequest = Alamofire.request(APIConstraints.signUp, method: .post, parameters: makeParameter(name, univ, id, pw), encoding: JSONEncoding.default, headers: header)
    
    dataRequest.responseData { dataResponse in
      switch dataResponse.result{
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        var networkResult:NetworkResult<Any>?
        switch statusCode{
        case 200  :
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(SignUpData.self, from: value) else { return networkResult = .pathErr }
          if decodedData.status == 200 && decodedData.success{
            networkResult = .success(decodedData.message)
          }
          else if decodedData.status == 400{
            networkResult = .requestErr(decodedData.message)
          }
          else {
            networkResult = .serverErr
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
