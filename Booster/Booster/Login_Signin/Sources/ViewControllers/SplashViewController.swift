//
//  SplashViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/17.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//
import Lottie
import UIKit

class SplashViewController: UIViewController {
  var splashJsonName:String = "splash_i11"
  func getLayoutofUserDevice(){
    if(UIScreen.main.bounds.size.width == 375 && UIScreen.main.bounds.size.height == 667){ // se2
      self.splashJsonName = "splash_i8"
    }
    else if(UIScreen.main.bounds.size.width == 414 && UIScreen.main.bounds.size.height == 896){// 아8+
      self.splashJsonName = "splash_i11"
      
    }
    else if(UIScreen.main.bounds.size.width == 375 && UIScreen.main.bounds.size.height == 812) { // 11pro
      self.splashJsonName = "splash_xs"
    }
  }
    override func viewDidLoad() {
      getLayoutofUserDevice()
      print(self.splashJsonName)
      let animation = Animation.named(self.splashJsonName)
      let splashAnimationView = AnimationView(animation:animation)
      splashAnimationView.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      self.view.addSubview(splashAnimationView)
      splashAnimationView.contentMode = .scaleToFill
      splashAnimationView.loopMode = .playOnce
      splashAnimationView.play()
      print(splashAnimationView.isAnimationPlaying)
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
        guard let login = self.storyboard?.instantiateViewController(identifier: "LogInViewController") else {return}
        login.modalPresentationStyle = .fullScreen
        self.present(login, animated: false, completion: nil)
      }
      super.viewDidLoad()

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
