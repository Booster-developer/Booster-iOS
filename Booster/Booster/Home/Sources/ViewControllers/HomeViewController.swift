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
  
  @IBOutlet weak var userName: UILabel?
  @IBOutlet weak var progressLabel: UILabel?
  var statusIdx:Int?
  var jsonName = ""
  var deviceInfo = ""
  var animation:Animation?
  var homeLottieAnimation = AnimationView()
  @IBOutlet weak var HomeLottieVie: UIView!
  override func viewDidLoad() {
    getCurrentStatus()
    super.viewDidLoad()
    print(view.bounds.height)
    
    // Do any additional setup after loading the view.
  }
  func getDeviceIdentifier() -> String {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8, value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value)))
    }
    return identifier
  }
  func getLayoutofUserDevice(){
    if(UIScreen.main.bounds.size.width == 375 && UIScreen.main.bounds.size.height == 667){ // se2
      self.deviceInfo = "home_i8"
    }
    else if(UIScreen.main.bounds.size.width == 414 && UIScreen.main.bounds.size.height == 896){// 아8+
      self.deviceInfo = "home_i8"
      
    }
    else if(UIScreen.main.bounds.size.width == 414 && UIScreen.main.bounds.size.height == 896){ // 아이폰 11
      self.deviceInfo = "home_xs"
      
    }
    else if(UIScreen.main.bounds.size.width == 375 && UIScreen.main.bounds.size.height == 812) { // 11pro
      self.deviceInfo = "home_xs"
    }
  }
  
  func getCurrentStatus(){
    homeViewService.shared.getHomeData(){
      networkResult in
      switch networkResult{
      case .success(let data):
        guard let home = data as? HomeInfo else {return}
        self.getLayoutofUserDevice()
        self.userName?.text = home.user_name
        self.statusIdx = home.home_state
        switch (self.statusIdx ?? 0){
        case 2:
          self.progressLabel?.text = "인쇄 진행 중이에요!"
          self.jsonName = self.deviceInfo + "_2"
        case 3:
          self.progressLabel?.text = "인쇄가 완료되었어요 :)"
          self.jsonName = self.deviceInfo + "_3"
          
        default:
          self.progressLabel?.text = "인쇄를 시작해볼까요?"
          self.jsonName = self.deviceInfo + "_1"
        }
        print(self.jsonName)
        self.animation = Animation.named(self.jsonName)
        self.homeLottieAnimation = AnimationView(animation: self.animation)
        self.homeLottieAnimation.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.HomeLottieVie?.addSubview(self.homeLottieAnimation)
        self.HomeLottieVie?.sendSubviewToBack(self.homeLottieAnimation)
        self.homeLottieAnimation.contentMode = .scaleToFill
        self.homeLottieAnimation.backgroundColor = UIColor.black
        self.homeLottieAnimation.loopMode = .loop
        self.homeLottieAnimation.backgroundBehavior = .pauseAndRestore
        self.homeLottieAnimation.play()
      case .requestErr(let message):
        print(message)
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      case .networkFail: print("networkFail")
      }
      
    }
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
