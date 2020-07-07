//
//  SearchStoreTableViewCell.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/07.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class SearchStoreTableViewCell: UITableViewCell {
  static let identifier:String = "storeCell"
  
  @IBOutlet weak var storeThumbNailImg: UIImageView!
  @IBOutlet weak var storeName: UILabel!
  @IBOutlet weak var storeAddress: UILabel!
  @IBOutlet weak var selectionButton: UIButton!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
