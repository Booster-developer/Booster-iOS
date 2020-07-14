//
//  APIConstraints.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation

struct APIConstraints{
  //로그인
  static let baseURL = "http://52.79.218.88:3000"
  static let idCheck = APIConstraints.baseURL + "/users/idcheck" //post
  static let signUp = APIConstraints.baseURL + "/users/signup"   //post
  static let logIn = APIConstraints.baseURL + "/users/signin"    //post
  //홈
  static let getOrder = APIConstraints.baseURL + "/home/orders"  //get
  //매장
  static let univList = APIConstraints.baseURL + "/stores/university"              //get
  
  static let list = "/list"
  static let detail = "/detail"
  static let favorate = "/favorite"
  static let file = "/file"
  static let options = "/options"
  static let payment = "/payment"
  static let pickUp = "/pickup"
  static let request = "/request"
  
  
  static let storeRequest = APIConstraints.baseURL +  "/stores"
  static let orderRequest = APIConstraints.baseURL + "/orders"
  static let progressRequest = APIConstraints.baseURL + "/progress"
  
//  static let storeList = APIConstraints.baseURL +  "/stores/:univ_idx/list"        //get
//  static let storeDetail = APIConstraints.baseURL + "/stores/:store_idx/detail"    //get
//  static let favorateBool = APIConstraints.baseURL + "/stores/:store_idx/favorite" //put
  
  //주문
//  static let orderInfo = APIConstraints.baseURL + "/orders/:store_idx"             //Post
//  static let fileInfo = APIConstraints.baseURL + "/orders/:order_idx/file"         //post
//  static let optionSelect = APIConstraints.baseURL + "/orders/:file_idx/options"   //put
//  static let orderList = APIConstraints.baseURL + "/orders/:order_idx/list"        //get
//  static let optionInfo = APIConstraints.baseURL + "/orders/:file_idx/options"     //get
//  static let paymentStatus = APIConstraints.baseURL + "/orders/:order_idx/payment" //get
//  static let orderRequest = APIConstraints.baseURL + "/orders/:order_idx/request"  //post
//  static let deleteFile = APIConstraints.baseURL + "/orders/:file_idx"             //delete
  //주문하기
  static let storeSelectionList = APIConstraints.baseURL + "/stores/list"          //get
  //주문현황
  static let orderStautsList = APIConstraints.baseURL + "/progress/list"             //get
//  static let orderStatusDetail = APIConstraints.baseURL + "/progress/:order_idx/list"//get
//  static let deleteOrder = APIConstraints.baseURL + "/orders/:order_idx"             //delete
//  static let pickup = APIConstraints.baseURL + "/progress/:order_idx/pickup"         //put
  
  //마이페이지
  static let modifyProfile = APIConstraints.baseURL + "/mypage/profile"   //put
  static let myEngineList = APIConstraints.baseURL + "/mypage/engine"     //get
  static let notiList = APIConstraints.baseURL + "/mypage/notice"         //get
}


struct APIIndex{
  var index:Index
  
  enum Index {
    case univIdx(Int)
    case orderIdx(Int)
    case storeIdx(Int)
    case fileIdx(Int)
    
    func getIdx() -> String{
      switch self {
      case .univIdx(let idx):
        return "/:" + String(idx)
      case .orderIdx(let idx):
        return "/:" + String(idx)
      case .storeIdx(let idx):
        return "/:" + String(idx)
      case .fileIdx(let idx):
        return "/:" + String(idx)
      }
    }
  }
}
