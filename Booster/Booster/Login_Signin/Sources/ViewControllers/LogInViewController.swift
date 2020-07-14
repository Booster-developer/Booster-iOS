//
//  LogInViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      logInPWTextField.delegate = self
      logInIdTextField.delegate = self

        // Do any additional setup after loading the view.
    }
  @IBOutlet weak var logInIdTextField: UITextField!
  @IBOutlet weak var logInPWTextField: UITextField!
  @IBAction func logInButtonClicked(_ sender: Any) {
    logInIdTextField.text = "daeun"
    logInPWTextField.text = "1234"
    if (!logInIdTextField.isEmpty && !logInPWTextField.isEmpty){
      let logInId:String = logInIdTextField.text!
      let logInPW:String = logInPWTextField.text!
      LoginService.shared.login(id: logInId, pwd: logInPW) { networkResult in
        switch networkResult{
        case .success(let token):
          guard let token = token as? TokenData else {return}
          UserDefaults.standard.set(token.accessToken, forKey: "token")
          let tabBarStoryboard = UIStoryboard.init(name: "mainTab", bundle: nil)
          guard let mainTab = tabBarStoryboard.instantiateViewController(identifier: "TabBarController") as? MainTabBarController else { return}
          mainTab.modalPresentationStyle = .fullScreen
          mainTab.univIdx = token.university_idx
          self.present(mainTab, animated: true, completion: nil)
          
        case .requestErr(let message):
          guard let message = message as? String else { return }
          let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
          let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
          alertViewController.addAction(action)
          self.present(alertViewController, animated: true, completion: nil)
        case .pathErr : print("pathErr")
        case .serverErr : print("serverErr")
        case .networkFail: print("networkFail")
        }
      }
    }
  }
  @IBAction func signUpBtnClicked(_ sender: Any) {
    guard let signUp = self.storyboard?.instantiateViewController(identifier: "signUp", creator: nil)as? SignUpViewController else {return}
    self.present(signUp,animated: true,completion: nil)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
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
extension LogInViewController:UITextFieldDelegate{
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     textField.resignFirstResponder()
     return true
   }
  
}
