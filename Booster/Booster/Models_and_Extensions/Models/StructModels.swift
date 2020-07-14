//
//  StructModels.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/08.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//
import UIKit
struct Options {
  var blackOrColor: String
  var rowOrColumn: String
  var singleOrDouble: String
  var numOfAPage: String
  var wholeOrPart: String
  var numOfDocs: Int
  
  init(blackOrColor: String, rowOrColumn: String, singleOrDouble: String, numOfAPage: String,
       wholeOrPart: String, numOfDocs: Int) {
    self.blackOrColor = blackOrColor
    self.rowOrColumn = rowOrColumn
    self.singleOrDouble = singleOrDouble
    self.numOfAPage = numOfAPage
    self.wholeOrPart = wholeOrPart
    self.numOfDocs = numOfDocs
  }
}

struct UserInfo {
  var userName:String
  var userID:String
  var userPW:String
  var userUniv:Int
}

struct PayFile {
  var fileName: String
  var expandName: String
  var options: String
  var price: Int
  
  init(fileName: String, expandName: String, options: String, price: Int) {
    self.fileName = fileName
    self.expandName = expandName
    self.options = options
    self.price = price
  }
}
struct StoreInfo {
  var store_idx:Int
  var store_name: String
  var store_image:URL
  var store_location:String
  var price_color_double : Int
  var price_color_single : Int
  var price_gray_double : Int
  var price_gray_single : Int
  var store_x_location:Double
  var store_y_location:Double
  var store_double_sale:String
  var store_favorite:Int
  var store_open:Int
  init(store_idx:Int = -1, store_name:String = "", store_image:URL = URL(string: "")!, store_location:String = "", price_color_double:Int = 0, price_color_single:Int = 0, price_gray_double:Int = 0, price_gray_single:Int = 0, store_x_location:Double = 0, store_y_location:Double = 0, store_double_sale: String = "", store_favorite:Int = 0, store_open:Int = 0){
    self.store_idx = store_idx
    self.store_name = store_name
    self.store_image = store_image
    self.store_location = store_location
    self.price_color_double = price_color_double
    self.price_color_single = price_color_single
    self.price_gray_double = price_gray_double
    self.price_gray_single = price_gray_single
    self.store_x_location = store_x_location
    self.store_y_location = store_y_location
    self.store_double_sale = store_double_sale
    self.store_favorite = store_favorite
    self.store_open = store_open
  }
}

struct StoreInformations {
  var storeIdx:Int
  var storeName: String
  var storeAddress : String
  var storeImgName:ImageType
  var storeLocation:String
  var storeTime:[String]
  var isFavorate:Bool
  var isRecentlyVisited:Bool
  var price:[String]
  var isOpen:Bool
  var subwayInfo : String
  var phoneNum:String
  var isSelected:Bool
  enum ImageType {
    case fullImg(String)
    case thumbNail(String)
    
    func type() -> String {
      switch self {
      case .fullImg(let imgname):
        return imgname
      case .thumbNail(let imgname):
        return imgname
      }
    }
  }

  init(storeIdx:Int = 0, storeName:String,storeAddress:String,storeImgName:ImageType, storeLocation:String = "", price:[
    String] = ["","","",""], storeTime:[String]=["","",""], isFavorate:Bool = false, isRecentlyVisited:Bool = false, isOpen:Bool = true,subwayInfo:String = "", phoneNum:String = ""){
    self.storeName = storeName
    self.storeAddress = storeAddress
    self.storeImgName = storeImgName
    self.price = price
    self.isOpen = isOpen
    self.isFavorate = isFavorate
    self.storeIdx = storeIdx
    //default init
    self.subwayInfo = subwayInfo
    self.phoneNum = phoneNum
    self.isRecentlyVisited = isRecentlyVisited
    self.storeLocation = storeLocation
    self.storeTime = storeTime
    self.isSelected = false
  }
}


struct UnivInformations {
  var isMyUniv:Bool
  var univIndex:Int
  var univName:String
  var univAddress:String
  var univLine:LineNumber
  
  enum LineNumber{
    case line2
    case line7
    case line9
    
    func getLineNum()->String{
      switch self {
      case.line2 :
        return "storeImgSubwaySnu2"
      case .line7 :
        return "storeImgSubwaySsu7"
      case .line9 :
        return "storeImgSubwayCau9"
      }
    }
    
  }
  
  
  
  init (univIdx:Int, univName:String,univAddress:String, univLine:LineNumber){
    self.isMyUniv = false
    self.univIndex = univIdx
    self.univName = univName
    self.univLine = univLine
    self.univAddress = univAddress
  }
}


struct OrderInformation{
  var orderIdx:Int
  var orderStoreName:String
  var orderTime:String
  var orderTitle:String
  var orderState:Int
  var orderPrice:Int
  var orderComment:String
  var orderFileList:[String]?
  
  init(orderStoreName:String,orderTime:String,orderTitle:String,orderState:Int,orderPrice:Int,orderComment:String,orderFileList:[String]?){
    //self.orderIdx=orderIdx
    self.orderStoreName=orderStoreName
    //self.orderTime=orderTime
    self.orderTitle=orderTitle
    self.orderState=orderState
    self.orderPrice=orderPrice
    self.orderComment=orderComment
    self.orderFileList=orderFileList
    self.orderIdx = 0
    self.orderTime = ""
  }
}

struct FileInformation {
  var fileImg:UIImage?
  var fileName:String
  var fileColor:String
  var fileRangeStart:Int
  var fileRangeEnd:Int
  var fileSideType:String
  var fileDirection:String
  var fileCollect:Int
  var fileCopyNum:Int
  //var fileOption:Options
  
  
  init(fileImg:UIImage?, fileName:String,fileColor:String="",fileRangeStart:Int = 0,fileRangeEnd:Int = 0,fileSideType:String = "",fileDirection:String = "",fileCollect:Int = 0,fileCopyNum:Int = 1){
    self.fileImg = fileImg
    self.fileName = fileName
    self.fileColor = fileColor
    self.fileRangeStart = fileRangeStart
    self.fileRangeEnd = fileRangeEnd
    self.fileSideType = fileSideType
    self.fileDirection = fileDirection
    self.fileCollect = fileCollect
    self.fileCopyNum = fileCopyNum
  }
  
}

struct EngineInformation {
  var date: String
  var store: String
  var engine: Int
  var sign: Bool
  
  init (date: String, store: String, engine: Int, sign: Bool) {
    self.date = date
    self.store = store
    self.engine = engine
    self.sign = sign
  }
}


