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
    guard let engineVC = self.storyboard?.instantiateViewController(identifier: "EngineListViewController") as? EngineListViewController else {return }
    engineVC.modalPresentationStyle = .fullScreen
    present(engineVC, animated: false, completion: nil)
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
