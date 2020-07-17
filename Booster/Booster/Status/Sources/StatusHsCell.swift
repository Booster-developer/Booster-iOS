//
//  StatusHsCell.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class StatusHsCell: UITableViewCell {
  
  // MARK: Identifier
  static let identifier: String = "StatusHsCell"
  
  // MARK: IBOutlets
  @IBOutlet weak var numLabel: UILabel!
  @IBOutlet weak var storeLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var docsLabel: UILabel!
  @IBOutlet weak var statusImg: UIImageView!
  @IBOutlet weak var cancelOrderBtn: UIButton!
  @IBOutlet weak var completePickUpBtn: UIButton!
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func setStatusInformation(num: Int, storeName: String, date: String, docsName: String,
                            imageName: String) {
    numLabel.text = String(num)
    storeLabel.text = storeName
    dateLabel.text = date
    docsLabel.text = docsName
    statusImg.image = UIImage(named: imageName)
  }
  func setBtnImg(imgName: String) {
    switch imgName {
    case "progressSlider1":
      cancelOrderBtn.isHidden = false
      cancelOrderBtn.isUserInteractionEnabled = true
      completePickUpBtn.setImage(UIImage.init(named: "processBtnPickupFile2"), for: .normal)
      completePickUpBtn.isUserInteractionEnabled = false
    case "progressSlider2":
      cancelOrderBtn.isHidden = true
      cancelOrderBtn.isUserInteractionEnabled = false
      completePickUpBtn.setImage(UIImage.init(named: "processBtnPickupFile2"), for: .normal)
      completePickUpBtn.isUserInteractionEnabled = false
    case "progressSlider3":
      cancelOrderBtn.isHidden = true
      cancelOrderBtn.isUserInteractionEnabled = false
      completePickUpBtn.setImage(UIImage.init(named: "processBtnPickupFile3"), for: .normal)
      completePickUpBtn.isUserInteractionEnabled = true
    default:
      cancelOrderBtn.isHidden = false
    }
  }
  
  

}
