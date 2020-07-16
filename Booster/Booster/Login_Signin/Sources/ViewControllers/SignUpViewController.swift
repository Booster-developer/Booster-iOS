//
//  SignUpViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/12.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

  @IBOutlet weak var getName: UITextField!
  @IBOutlet weak var getID: UITextField!
  @IBOutlet weak var getPW: UITextField!
  @IBOutlet weak var checkPW: UITextField!
  @IBOutlet weak var univSelectionAppear: NSLayoutConstraint!
  var isTextFieldAreEmpty:Bool = true
  var isAllBtnClicked:Bool = true
  var isUnivSelected = false
  var isIDChecked = false
  var termChecked_1 = false
  var termChecked_2 = false
  var isPWChecked = false
  var userInfo:UserInfo = UserInfo(userName: "", userID: "", userPW: "", userUniv: 0)
  @IBOutlet weak var registerBtn: UIButton!
  @IBOutlet weak var univName: UILabel!
  @IBAction func checkID(_ sender: Any) {
    if let text = getID.text, !text.isEmpty {
    guard let inputID = getID.text else{return}
    idCheckService.shared.checkID(id: inputID) {
      networkResult in
      switch networkResult {
      case .success(let message):
        self.idCheckFailedLabel.isHidden = false
        self.getID.layer.borderColor = UIColor.green.cgColor
        self.idCheckFailedLabel.text = message as! String
        self.isIDChecked = true
        self.userInfo.userID = self.getID.text!
        self.idCheckFailedLabel.textColor = UIColor.green
      case .requestErr(let message):
        self.idCheckFailedLabel.isHidden = false
        self.getID.layer.borderColor = UIColor.red.cgColor
        self.idCheckFailedLabel.text  = message as! String
        self.getID.text = ""
        self.idCheckFailedLabel.textColor = UIColor.red
        self.userInfo.userID = ""

        self.registerBtn.isEnabled = false
        //self.idCheckFailedLabel.layer.borderColor = CGColor.
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      case .networkFail: print("networkFail")
    }
  }
    }
    else {
      self.registerBtn.isEnabled = false
      self.userInfo.userID = ""
      self.idCheckFailedLabel.text = "아이디를 입력해주세요"
      
    }
}
  @IBAction func univSelectBtn(_ sender: Any) {
    univSelectionAppear.constant = 132
  }
  @IBAction func ssBtn(_ sender: Any) {
    isUnivSelected = true
    univSelectionAppear.constant = 0
    univName.text = "숭실대학교"
    userInfo.userUniv = 1
    print(resgisterBtnActive())
  }
  @IBAction func cuBtn(_ sender: Any) {
    isUnivSelected = true
    univSelectionAppear.constant = 0
    univName.text = "중앙대학교"
    userInfo.userUniv = 2
    print(resgisterBtnActive())
  }
  @IBAction func snuBtn(_ sender: Any) {
    isUnivSelected = true
    univSelectionAppear.constant = 0
    univName.text = "서울대학교"
    userInfo.userUniv = 3
    print(resgisterBtnActive())
  }
  
  func resgisterBtnActive()->Bool{
    var test:Bool = getName.isEmpty || getID.isEmpty || getPW.isEmpty || checkPW.isEmpty
    test = !test
    if (test && isUnivSelected && termChecked_1 && termChecked_2 && isIDChecked && isPWChecked){
        self.registerBtn.setBackgroundImage(UIImage(named: "storeDetailBtnOrder"), for: .normal)
        self.registerBtn.isEnabled = true
      userInfo.userName = getName.text!
      }
      else {
        self.registerBtn.isEnabled = false
      }
    return test && isUnivSelected && termChecked_1 && termChecked_2 && isIDChecked && isPWChecked
  }
  
  
  
  @IBOutlet weak var checkBox_2: UIButton!
  @IBOutlet weak var checkBox_1: UIButton!
  @IBOutlet weak var idCheckFailedLabel: UILabel!
  
  @IBAction func checkClick_2(_ sender: Any) {
    termChecked_2 = !termChecked_2
    if termChecked_2{
      checkBox_2.setBackgroundImage(UIImage(named: "registerBtnCheckInactive2"), for: .normal)
      checkBox_2.setImage(UIImage(named: "registerBtnCheckInactive1"), for: .normal)
    }
    else {
      checkBox_2.setImage(UIImage(named: "registerBtnCheckInactive"), for: .normal)
    }
    print(resgisterBtnActive())
  }
  @IBAction func checkClick_1(_ sender: Any) {
    termChecked_1 = !termChecked_1
       if termChecked_1 {
         checkBox_1.setBackgroundImage(UIImage(named: "registerBtnCheckInactive2"), for: .normal)
         checkBox_1.setImage(UIImage(named: "registerBtnCheckInactive1"), for: .normal)
       }
       else {
         checkBox_1.setImage(UIImage(named: "registerBtnCheckInactive"), for: .normal)
       }
       print(resgisterBtnActive())
  }
  func enableRegister(){
    if resgisterBtnActive(){
      self.registerBtn.setBackgroundImage(UIImage(named: "storeDetailBtnOrder"), for: .normal)
      self.registerBtn.isEnabled = false
    }
    else {
      self.registerBtn.isEnabled = true
    }
  }
  @IBAction func popUpTerms(_ sender: Any) {
   
  }
  @IBAction func signUpBtn(_ sender: Any) {
    
    
    SignUpService.shared.signup(userInfo.userName, userInfo.userUniv, userInfo.userID, userInfo.userPW) {
      networkResult in
      switch networkResult{
      case .success(let message):
        print(message)
        self.dismiss(animated: true, completion: nil)
      case .requestErr(let message):
        let alertViewController = UIAlertController(title: "회원가입 실패", message: message as! String, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      case .networkFail: print("networkFail")
      }
    }
    print(userInfo)

    
    
    
  }
  override func viewDidLoad() {
    idCheckFailedLabel.isHidden = true
    pwIncorrectLabel.isHidden = true
    registerBtn.isEnabled = false
    super.viewDidLoad()
    
    getPW.delegate = self
    getName.delegate = self
    getID.delegate = self
    checkPW.delegate = self
    getPW.tag = 1
    checkPW.tag = 2
    univSelectionAppear.constant = 0
    
    
        // Do any additional setup after loading the view.
    }
  
  @IBOutlet weak var pwIncorrectLabel: UILabel!
  func comparePW(){
    if getPW.text != checkPW.text{
      pwIncorrectLabel.isHidden = false
    }
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
}

extension SignUpViewController:UITextFieldDelegate{
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  func textFieldDidEndEditing(_ textField: UITextField) {
    if (textField.tag == 1 || textField.tag == 2) {
      if(getPW.isEmpty && checkPW.isEmpty){
        print("둘다 비었군")
      }
      else if(getPW.text == checkPW.text){
        isPWChecked = true
        pwIncorrectLabel.text = "비밀번호가 일치합니다."
        userInfo.userPW = getPW.text!
      }
      else{
        isPWChecked = false
        pwIncorrectLabel.isHidden = false
        userInfo.userPW = ""
      }
    }
    print(resgisterBtnActive())
  }

}
