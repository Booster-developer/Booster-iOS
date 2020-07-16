//
//  HomeViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit
import Lottie
let animationView = AnimationView(name: "anim")
class HomeViewController: UIViewController {
  @IBOutlet weak var lottieAnimation: AnimationView!
  
    override func viewDidLoad() {

        super.viewDidLoad()
      lottieAnimation.contentMode = .scaleAspectFit
      lottieAnimation.loopMode = .loop
      lottieAnimation.animationSpeed = 0.5
      //lottieAnimation.play()

        // Do any additional setup after loading the view.
    }
  override func viewDidAppear(_ animated: Bool) {
    animationView.frame = view.bounds
    animationView.contentMode = .scaleToFill
    animationView.loopMode = .loop
    animationView.play()
    print(animationView)
    print("dd")
    view.addSubview(animationView)
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
