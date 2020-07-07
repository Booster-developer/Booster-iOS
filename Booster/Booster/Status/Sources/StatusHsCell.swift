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
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func setStatusInformation(num: Int, storeName: String, date: String, docsName: String) {
    numLabel.text = String(num)
    storeLabel.text = storeName
    dateLabel.text = date
    docsLabel.text = docsName
  }

}
