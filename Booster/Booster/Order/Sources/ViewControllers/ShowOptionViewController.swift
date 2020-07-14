//
//  ShowOptionViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/12.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class ShowOptionViewController: UIViewController {
  
  //MARK: - IBOutlets
  @IBOutlet weak var showOptionView: UIView!
  @IBOutlet weak var fileColor: UILabel!
  @IBOutlet weak var fileDirection: UILabel!
  @IBOutlet weak var fileSidedType: UILabel!
  @IBOutlet weak var fileCollect: UILabel!
  @IBOutlet weak var fileRange: UILabel!
  @IBOutlet weak var fileCopyNumber: UILabel!
  
  
  // MARK: - IBActions
  @IBAction func backBtnClicked(_ sender: Any) {
    self.dismiss(animated: false, completion: nil)
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.showOptionView.layer.cornerRadius = 10
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
