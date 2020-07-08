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
  static let identifier:String = "orderCollectionCell"
  
  func itemSelected(){
    print("hh")
    backgroundImg.image = UIImage(named: "optionselect")
  }
  func itemUnselected(){
    backgroundImg.image = UIImage(named: "bgStore")
  }
}
