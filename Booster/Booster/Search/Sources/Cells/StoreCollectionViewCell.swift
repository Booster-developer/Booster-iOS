//
//  StoreCollectionViewCell.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var storeView: UIView!
  @IBOutlet weak var storeImgView: UIImageView!
  @IBOutlet weak var storeName: UILabel!
  @IBOutlet weak var storeAddress: UILabel!
  @IBOutlet weak var priceInfo: UILabel!
  @IBOutlet weak var storeClosedView: UIView!
  @IBOutlet weak var favorateBtn: UIButton!
  
  var isStoreOpen:Bool = true
  static let identifier:String = "storeCell"
  
  func setStoreView(){
    print("cell width 이거임")
    print(self.frame.size.width)
    //storeView.bounds = CGRect(x: 0, y: 0, width: 414, height: (414.0/375.0)*265.0)
    storeClosedView.alpha = 0
    storeView.clipsToBounds = true
    storeImgView.layer.cornerRadius = 10.0
    storeClosedView.layer.cornerRadius = 10.0
    storeClosedView.layer.masksToBounds = true
//    storeView.layer.cornerRadius = 10.0
//    storeView.layer.masksToBounds = true

    if (!isStoreOpen){
      storeClosedView.alpha = 0.7
    }
    print(storeView.bounds)
  }
}
