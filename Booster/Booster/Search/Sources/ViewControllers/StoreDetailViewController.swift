//
//  StoreDetailViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class StoreDetailViewController: UIViewController {
  var storeidx:Int?
  // MARK: - Vars
  var toggle: Bool = true
  // MARK: - IBOutlet
  @IBOutlet weak var favBtn: UIButton!
  
  
  // MARK: - IBAction
  @IBAction func changeFavBtn(_ sender: Any) {
    if toggle {
      self.favBtn.setImage(UIImage.init(named: "storeDetailIcStarActive"), for: .normal)
      toggle = !toggle
    }
    else if !toggle {
      self.favBtn.setImage(UIImage.init(named: "storeDetailIcStarInactive"), for: .normal)
      toggle = !toggle
    }
    
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
