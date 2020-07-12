//
//  OrderCollectionViewCell.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/07.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var backgroundImg: UIImageView!
  @IBOutlet weak var storeThumbNail: UIImageView!
  @IBOutlet weak var storeName: UILabel!
  @IBOutlet weak var storeAddress: UILabel!
  
  //static var isSelcted:Bool = false
  static let identifier:String = "orderCollectionCell"
  
  func itemSelected(isSelected : Bool){
    print(isSelected)
    if isSelected{
      backgroundImg.image = UIImage(named: "optionselect")
    }
    else {
      backgroundImg.image = UIImage(named: "bgStore")
    }    
  }
}
