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
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.tabBarController?.selectedIndex = 3
      self.tabBarController?.tabBar.isHidden = false
      print(self.presentingViewController?.presentingViewController.self?.navigationController?.popToRootViewController(animated: false))
      
      self.navigationController?.popToRootViewController(animated: false)
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
