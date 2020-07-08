//
//  StructModels.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/08.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

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
