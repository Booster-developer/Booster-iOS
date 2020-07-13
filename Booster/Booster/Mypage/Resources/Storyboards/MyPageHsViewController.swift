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
