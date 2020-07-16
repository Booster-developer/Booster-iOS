//
//  CancelOrderViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/07.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class CancelOrderViewController: UIViewController {
  
  // MARK: - Vars
  let orderTitle: String = " "
  var orderNum : Int?
  
  // MARK: - Functions
  
  // MARK: - IBOutlets
  @IBOutlet weak var popUpView: UIView!
  @IBOutlet weak var cancelMessageLabel: UILabel!
  
  // MARK: - IBActions
  @IBAction func dismissToStatusVC(_ sender: Any) {
    self.dismiss(animated: false, completion: nil)
  }
  @IBAction func dismissAndCancelOrder(_ sender: Any) {
    guard let vc = self.presentingViewController?.children[3] as? StatusHsViewController else {return}
    DeleteStatusService.shared.deleteStatus(orderIndex: orderNum!){ networkResult in
      switch networkResult {
      case .success(let message) :
        
        vc.statusHsTableView.reloadData()
        self.dismiss(animated: false, completion: nil)
      case .requestErr(let message):
        guard let message = message as? String else {return}
        let alertViewController = UIAlertController(title: "로그인 실패", message: message,
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)
      case .pathErr: print("path")
      case .serverErr: print("serverErr")
      case .networkFail: print("networkFail")
        
        
        
      }
    }
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
