//
//  HomeViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit
import Lottie
class HomeViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
      let jsonName = "home_xs_3"
      let animation = Animation.named(jsonName)
      let homeLottieAnimation = AnimationView(animation: animation)
      homeLottieAnimation.frame = CGRect(x:0, y: 0, width = self.bound)
        // Do any additional setup after loading the view.
    }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
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
