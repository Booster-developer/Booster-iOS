//
//  univTableViewCell.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class univTableViewCell: UITableViewCell {

  
  @IBOutlet weak var univName: UILabel!
  @IBOutlet weak var univAddressInTableView: UILabel!
  @IBOutlet weak var subwayLineImg: UIImageView!
  @IBOutlet weak var selectedBox: UIImageView!
  static let identifier:String = "univTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
