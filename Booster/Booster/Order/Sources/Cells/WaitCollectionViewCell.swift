//
//  WaitCollectionViewCell.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/08.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class WaitCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var preViewImg: UIButton!
  @IBOutlet weak var fileName: UILabel!
  
  @IBOutlet weak var fileExtention: UILabel!
  @IBOutlet weak var checkOption: UIButton!
  @IBOutlet weak var deleteCell: UIButton!
  @IBOutlet weak var changeOption: UIButton!
  
  static let identifier:String = "waitCell"
}
