//
//  LodingViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/17.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class LodingViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let completeVC = self.storyboard?.instantiateViewController(identifier: "completePaymentViewController")

    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      completeVC!.modalPresentationStyle = .overCurrentContext
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        self.present(completeVC!, animated: false, completion: nil)
          }
      self.dismiss(animated: false, completion: nil)
    }
    // Do any additional setup after loading the view.
  }
  
  //  @objc func showComplete() {
  //    let storyBoard = UIStoryboard.init(name: "OrderHs", bundle: nil)
  //           let completeVC = storyBoard.instantiateViewController(identifier: "completePaymentViewController")
  //           completeVC.modalPresentationStyle = .overCurrentContext
  //         present(completeVC, animated: false, completion: nil)
  //  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
