//
//  FileListCollectionViewCell.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class FileListCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var preViewImg: UIButton!
  @IBOutlet weak var fileName: UILabel!
  @IBOutlet weak var filePrice: UILabel!
  @IBOutlet weak var optionCheck: UIButton!
  static let identifier:String =  "fileList"
}
