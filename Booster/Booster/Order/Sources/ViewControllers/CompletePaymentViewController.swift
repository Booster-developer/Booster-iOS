//
//  CompletePaymentViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/17.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class CompletePaymentViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let loadview = self.storyboard?.instantiateViewController(identifier: "loadingViewController") as? LodingViewController else {return}
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      self.dismiss(animated: false, completion: nil)
      loadview.dismiss(animated: false, completion: nil)
//      let storyBoard = UIStoryboard.init(name: "StatusHs", bundle: nil)
//      let statusVC = storyBoard.instantiateViewController(identifier: "StatusViewController")
//      statusVC.modalPresentationStyle = .fullScreen
//      self.present(statusVC, animated: false, completion: nil)
    }
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
