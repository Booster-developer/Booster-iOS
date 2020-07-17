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
  return .success(tokenData)
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

        switch statusCode{
        case 200:
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(IDCheckData.self, from: value) else { return networkResult = .pathErr }
          

          
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

struct storeListService{
  static let shared = storeListService()
  
  func getStoreList(_ univIdx:Int, completion : @escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["token" : UserDefaults.standard.string(forKey: "token")!]
    let url = APIConstraints.storeRequest + APIIndex.init(index: .univIdx(univIdx)).index.getIdx()+APIConstraints.list

    
    let dataRequest = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
    dataRequest.responseData {
      dataResponse in
      switch dataResponse.result {
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        var networkResult:NetworkResult<Any>?
        switch statusCode{
        case 200 :
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(StoreListData.self, from: value) else { return networkResult = .pathErr }
          if decodedData.status == 200 && decodedData.success{
            networkResult = .success(decodedData.data!)
          }
          else if decodedData.status == 400{
             networkResult = .requestErr(decodedData.message)
           }
           else {
             networkResult = .serverErr
           }
        case 400 : networkResult = .pathErr
        case 500 : networkResult = .serverErr
        default: networkResult = .networkFail
        }
        completion(networkResult!)
      case .failure : completion(.networkFail)
      }
    }
  }
}



struct univListService{
  static let shared = univListService()
  
  func getUnivList(completion : @escaping (NetworkResult<Any>) -> Void){
    let url = APIConstraints.univList
    let dataRequest = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
    dataRequest.responseData {
      dataResponse in
      switch dataResponse.result {
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        var networkResult:NetworkResult<Any>?
        switch statusCode{
        case 200 :
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(univListData.self, from: value) else { return networkResult = .pathErr }
          if decodedData.status == 200 && decodedData.success{
            networkResult = .success(decodedData.data!)
          }
          else if decodedData.status == 400{
             networkResult = .requestErr(decodedData.message)
           }
           else {
             networkResult = .serverErr
           }
        case 400 : networkResult = .pathErr
        case 500 : networkResult = .serverErr
        default: networkResult = .networkFail
        }
        completion(networkResult!)
      case .failure : completion(.networkFail)
      }
    }
  }
}

struct favoriteService {
    static let shared = favoriteService()
  
  func favorateToggle(_ storeIdx : Int, completion : @escaping (NetworkResult<Any>) -> Void){
    let url = APIConstraints.storeRequest + APIIndex.init(index: .storeIdx(storeIdx)).index.getIdx() + APIConstraints.favorate
    let header:HTTPHeaders = ["token" : UserDefaults.standard.string(forKey: "token")!]
    let dataRequest = Alamofire.request(url, method: .put, parameters: nil, encoding: JSONEncoding.default, headers: header)
    dataRequest.responseData {
      dataResponse in
      switch dataResponse.result {
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        var networkResult:NetworkResult<Any>?
        switch statusCode{
        case 200 :
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(favoriteData.self, from: value) else { return networkResult = .pathErr }
          if decodedData.status == 201 && decodedData.success{
            networkResult = .success(decodedData.message)
          }
          else if decodedData.status == 200{
             networkResult = .requestErr(decodedData.message)
           }
           else {
             networkResult = .serverErr
           }
        case 400 : networkResult = .pathErr
        case 500 : networkResult = .serverErr
        default: networkResult = .networkFail
        }
        completion(networkResult!)
      case .failure : completion(.networkFail)
      }
    }
  }
}


struct orderStoreListService{
  static let shared = orderStoreListService()
  func getOrderStoreList(completion : @escaping (NetworkResult<Any>) -> Void){
     let url = APIConstraints.storeSelectionList
    let header:HTTPHeaders = ["token" : UserDefaults.standard.string(forKey: "token")!]
     let dataRequest = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
    print(dataRequest)
     dataRequest.responseData {
       dataResponse in
       switch dataResponse.result {
       case .success:
         guard let statusCode = dataResponse.response?.statusCode else{return}
         guard let value = dataResponse.result.value else {return}
         var networkResult:NetworkResult<Any>?
         switch statusCode{
         case 200 :
           let decoder = JSONDecoder()
           guard let decodedData = try? decoder.decode(orderListData.self, from: value) else { return networkResult = .pathErr }
           print(decodedData)
           if decodedData.status == 200 && decodedData.success{
            print("hh")
             networkResult = .success(decodedData.data!)
           }
           else if decodedData.status == 400{
              networkResult = .requestErr(decodedData.message)
            }
            else {
              networkResult = .serverErr
            }
         case 400 : networkResult = .pathErr
         case 500 : networkResult = .serverErr
         default: networkResult = .networkFail
         }
         completion(networkResult!)
       case .failure : completion(.networkFail)
       }
     }
   }
}

struct orderService {
  static let shared = orderService()
  func order(orderIdx:Int, completion:@escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["Content-Type":"application/json", "token" : UserDefaults.standard.string(forKey: "token")!]
    let dataRequest = Alamofire.request(APIConstraints.orderRequest + APIIndex.init(index: .orderIdx(orderIdx)).index.getIdx(), method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header)
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
          guard let decodedData = try? decoder.decode(orderBtnClickedData.self, from: value) else { return networkResult = .pathErr }
          
          print(decodedData.status)
          guard let orderIdx = decodedData.data else{return networkResult = .requestErr(decodedData.message)}
          if decodedData.status == 200{
            networkResult = .success(orderIdx)
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


struct waitListService{
  static let shared = waitListService()
  func waitlist(orderIdx:Int, completion:@escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["token":UserDefaults.standard.string(forKey: "token")!]
    let url = APIConstraints.orderRequest+APIIndex.init(index: .orderIdx(orderIdx)).index.getIdx() + APIConstraints.list
    
    let dataRequest = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
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
          guard let decodedData = try? decoder.decode(waitListData.self, from: value) else { return networkResult = .pathErr }
          
          guard let orderIdx = decodedData.data else{return networkResult = .requestErr(decodedData.message)}
          if decodedData.status == 200{
            networkResult = .success(orderIdx)
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



struct uploadFileService{
  private func makeParameter(_ file:String, thumbnail:String) ->Parameters{
    return ["file":file, "thumbnail" : thumbnail]
  }
  static let shared = uploadFileService()
  func uploadfile(fileData:URL, thumbNail:URL, orderIdx:Int, completion:@escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["token":UserDefaults.standard.string(forKey: "token")!, "Content-Type":"application/json"]
    let url = APIConstraints.orderRequest + APIIndex.init(index: .orderIdx(orderIdx)).index.getIdx() + APIConstraints.file
    Alamofire.upload(multipartFormData: {(formData) in
      formData.append(fileData,withName: "file")
      formData.append(thumbNail,withName: "thumbnail")
    }, to: url, method: .post, headers: header, encodingCompletion: {(encodingResult) in

      switch encodingResult {
      case .success(let request,_,_):

        request.responseJSON(completionHandler: { (response) in
          guard let statusCode = response.response?.statusCode else {return}
          let data = response.result.value as! [String : Any]

          let status = data["status"]
          let file = data["data"] as! [String:Any]?
          let fileidx = file?["file_idx"]
          let message = data["message"]
          guard let value = response.result.value else {
            return}
          var networkResult:NetworkResult<Any>?
          
          switch statusCode{
          case 200 :
            let decodeData:fileUploadData = fileUploadData(status: status as! Int, success: true, message: message as! String, data: fileIdx(fileIdx: fileidx as? Int ?? -1))
            guard let resultdata = decodeData.data else { return networkResult = .requestErr(decodeData.message)}
            if decodeData.status == 200 {
              networkResult = .success(resultdata)
            }
            else{
              networkResult = .requestErr(decodeData.message)
            }
            case 400: networkResult = .pathErr
            case 500: networkResult = .serverErr
            default: networkResult = .networkFail
          }
          completion(networkResult!)
        })
      case .failure(_):
        
        completion(.networkFail)
        print("UPload failed")
      }
      }
    )
  }
}


struct deleteFileService{
  static let shared = deleteFileService()
  func filedeleter(fileidx:Int, completion:@escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["token":UserDefaults.standard.string(forKey: "token")!]
    let url = APIConstraints.orderRequest+APIIndex.init(index: .fileIdx(fileidx)).index.getIdx()
    
    let dataRequest = Alamofire.request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: header)
    dataRequest.responseData { dataResponse in
      
      switch dataResponse.result{
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        var networkResult:NetworkResult<Any>?
        switch statusCode{
        case 200:
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(fileDeleteData.self, from: value) else { return networkResult = .pathErr }
          if decodedData.status == 200{
            networkResult = .success(decodedData.message)
          }
          else if decodedData.status == 403 {
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
struct optionSelectService {
  static let shared = optionSelectService()
  private func makeParameter(_ option:OptionList) ->Parameters{
    var start:Int = 0
    var end:Int = 0
    if option.file_range != "전체 페이지"{
      let filerangestart = option.file_range.split(separator: "/")
      start = Int(filerangestart[0]) ?? 0
      end = Int(filerangestart[1]) ?? start
    }
    return ["file_color" : option.file_color, "file_direction" : option.file_direction,"file_sided_type" : option.file_sided_type,"file_collect" : option.file_collect,"file_range_start" : start,"file_range_end" : end,"file_copy_number" : option.file_copy_number]
  }
  func optionSend(fileIdx:Int, optionSelect:OptionList, completion:@escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["Content-Type":"application/json", "token" : UserDefaults.standard.string(forKey: "token")!]
    let url = APIConstraints.orderRequest + APIIndex.init(index: .fileIdx(fileIdx)).index.getIdx() + APIConstraints.options
    let dataRequest = Alamofire.request(url, method: .post, parameters: makeParameter(optionSelect), encoding: JSONEncoding.default, headers: header)
    dataRequest.responseData { dataResponse in
      switch dataResponse.result{
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        var networkResult:NetworkResult<Any>?
        switch statusCode{
        case 200:
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(OptionChangeData.self, from: value) else { return networkResult = .pathErr }
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
struct storeDetailListService{
  static let shared = storeDetailListService()
  
  func getStoreDetailList(_ storeIdx:Int, completion : @escaping (NetworkResult<Any>) -> Void){
    let header:HTTPHeaders = ["token" : UserDefaults.standard.string(forKey: "token")!]
    let url = APIConstraints.storeRequest + "/" + String(storeIdx) + APIConstraints.detail

    
    let dataRequest = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
    dataRequest.responseData {
      dataResponse in
      switch dataResponse.result {
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.result.value else {return}
        var networkResult:NetworkResult<Any>?
        switch statusCode{
        case 200 :
          let decoder = JSONDecoder()
          guard let decodedData = try? decoder.decode(StoreDetailViewLoadData.self, from: value) else { return networkResult = .pathErr }
          if decodedData.status == 200 && decodedData.success{
            networkResult = .success(decodedData.data)
          }
          else if decodedData.status == 400{
             networkResult = .requestErr(decodedData.message)
           }
           else {
             networkResult = .serverErr
           }
        case 400 : networkResult = .pathErr
        case 500 : networkResult = .serverErr
        default: networkResult = .networkFail
        }
        completion(networkResult!)
      case .failure : completion(.networkFail)
      }
    }
  }
}
struct homeViewService {
  static let shared = homeViewService()
  func getHomeData(completion : @escaping (NetworkResult<Any>) -> Void){
    
    let header:HTTPHeaders = ["token" : UserDefaults.standard.string(forKey: "token")!]
    let url = APIConstraints.getOrder
    let dataRequest = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
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
             guard let decodedData = try? decoder.decode(HomeViewData.self, from: value) else { return networkResult = .pathErr }
             
             print(decodedData)
             guard let homeData = decodedData.data else{return networkResult = .requestErr(decodedData.message)}
             if decodedData.status == 200{
               networkResult = .success(homeData)
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

struct orderDetailViewService {
  static let shared = orderDetailViewService()
  func orderDetail(_ orderIdx:Int, completion : @escaping (NetworkResult<Any>) -> Void){
    
    let header:HTTPHeaders = ["token" : UserDefaults.standard.string(forKey: "token")!]
    let url = APIConstraints.progressRequest + "/" + String(orderIdx) + APIConstraints.list
    let dataRequest = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
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
             guard let decodedData = try? decoder.decode(OrderDetailData.self, from: value) else { return networkResult = .pathErr }
             print(decodedData)
             if decodedData.status == 200{
              networkResult = .success(decodedData.data) 
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
