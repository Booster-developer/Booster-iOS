//
//  MyPageHsViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/13.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class MyPageHsViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var popUpSwitch: UISwitch!
  
  // MARK: - IBActions
  @IBAction func showEngineList(_ sender: Any) {
    EngineService.shared.getEngine() {networkResult in
      switch networkResult {
      case .success(let engineList):
        guard let engineList = engineList as? engineList else {return}
        guard let engineVC = self.storyboard?.instantiateViewController(identifier: "EngineListViewController") as? EngineListViewController else {return }
        engineVC.modalPresentationStyle = .fullScreen
        self.present(engineVC, animated: false, completion: nil)
        engineVC.engineLabel.text = String(engineList.engine_point)
        for i in 0..<engineList.engine_list.count {
          let engineInfo = EngineInformation.init(date: engineList.engine_list[i].engine_time, store: engineList.engine_list[i].engine_store_name, engine: engineList.engine_list[i].engine_cost, sign: engineList.engine_list[i].engine_sign)
          engineVC.engineInformations.append(engineInfo)
          
        }
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
  @IBAction func backBtnClicked(_ sender: Any) {
    self.tabBarController?.selectedIndex = 0
  }
  @IBAction func editBtnClicked(_ sender: Any) {
    guard let editVC = self.storyboard?.instantiateViewController(identifier: "EditViewController") as? EditViewController else {return}
    editVC.modalPresentationStyle = .fullScreen
    present(editVC, animated: false, completion: nil)
  }
  
  
  // MARK: - Vars
  let identifier: String = "MyPageHsViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
      popUpSwitch.transform = CGAffineTransform(scaleX: 20/51, y: 10/31)
      print(popUpSwitch.frame.height, popUpSwitch.frame.width)
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
extension UISwitch {
  func set(width: CGFloat, height: CGFloat) {
    let standardHeight: CGFloat = 10
    let standardWidth: CGFloat = 20
    
    let heightRatio = height / standardHeight
    let widthRatio = width / standardWidth
    
    transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
  }
}
