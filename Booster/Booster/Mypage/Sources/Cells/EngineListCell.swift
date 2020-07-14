//
//  EngineListCell.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/13.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class EngineListCell: UITableViewCell {
  
  // MARK: - Vars
  static let identifier: String = "EngineListCell"
  
  
  // MARK: - IBOutlets
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var storeLabel: UILabel!
  @IBOutlet weak var engineLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func setEngineListInformation(date: String, store: String, engine: Int, sign: Int) {
    dateLabel.text = date
    storeLabel.text = store
    if sign == 1 {
      engineLabel.text = "+"+String(engine)+"P"
      engineLabel.textColor = UIColor(red: 255/255, green: 18/255, blue: 0, alpha: 1)
    }
    else {
      engineLabel.text = "-"+String(engine)+"P"
      engineLabel.textColor = UIColor(red: 70/255, green: 127/255, blue: 255/255, alpha: 1)
    }
  }

}
