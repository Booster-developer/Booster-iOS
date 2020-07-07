//
//  CancelOrderViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/07.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class CancelOrderViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var popUpView: UIView!
  
  // MARK: - IBActions
  @IBAction func dismissToStatusVC(_ sender: Any) {
    dismiss(animated: false, completion: nil)
  }
  @IBAction func dismissAndCancelOrder(_ sender: Any) {
    guard let vc = self.presentingViewController as? StatusHsViewController else {return}
    vc.changeStatusInformations()
    vc.statusHsTableView.reloadData()
    dismiss(animated: false, completion: nil)
  }
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    self.popUpView.layer.cornerRadius = 10

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
