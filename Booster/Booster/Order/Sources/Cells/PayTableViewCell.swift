//
//  PayTableViewCell.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class PayTableViewCell: UITableViewCell {
  static let identifier: String = "PayTableViewCell"
  
  // MARK: - IBOutlets
  @IBOutlet weak var fileNameLabel: UILabel!
  @IBOutlet weak var expandLabel: UILabel!
  @IBOutlet weak var fileOptionLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func setPayFileInformation(fileName: String, expandName: String, fileOption: String, price: Int) {
    fileNameLabel.text = fileName
    expandLabel.text = expandName
    fileOptionLabel.text = fileOption
    priceLabel.text = String(price)
    
  }

}
