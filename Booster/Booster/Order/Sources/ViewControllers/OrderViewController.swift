//
//  OrderViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    override func viewDidLoad() {
//      print(self.tabBarController?.selectedIndex)
//      self.tabBarController?.tabBar.isHidden = true
      //self.tabBarController?.tabBar.isHidden = true
      self.navigationItem.title = "매장찾기"
      super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  @IBAction func goBackToHomeView(_ sender: Any) {
    self.tabBarController?.selectedIndex = 0
    self.tabBarController?.tabBar.isHidden = false
  }
  @IBAction func selectionBtn(_ sender: Any) {
    guard let goToWaitingList = self.storyboard?.instantiateViewController(withIdentifier: "WaitingVC") as? WaitingListViewController else {return}
    self.navigationController?.pushViewController(goToWaitingList, animated: true)
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
