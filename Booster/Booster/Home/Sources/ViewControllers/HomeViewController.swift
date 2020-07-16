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
  @IBOutlet weak var lottieAnimation: AnimationView!
  
    override func viewDidLoad() {
      lottieAnimation.contentMode = .scaleAspectFit
      lottieAnimation.loopMode = .loop
      lottieAnimation.animationSpeed = 0.5
      lottieAnimation.play()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  override func viewDidAppear(_ animated: Bool) {
    lottieAnimation.contentMode = .scaleAspectFit
    lottieAnimation.loopMode = .loop
    lottieAnimation.animationSpeed = 0.5
    lottieAnimation.play()
    print(lottieAnimation.animation?.framerate)
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
