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
  
  @IBOutlet weak var univName: UILabel!
  @IBAction func checkID(_ sender: Any) {
    getID.layer.borderColor = UIColor.red as! CGColor
    idCheckFailedLabel.isHidden = false
  }
  @IBAction func univSelectBtn(_ sender: Any) {
    univSelectionAppear.constant = 132
  }
  @IBAction func ssBtn(_ sender: Any) {
    univSelectionAppear.constant = 0
    univName.text = "숭실대학교"
  }
  @IBAction func cuBtn(_ sender: Any) {
    univSelectionAppear.constant = 0
    univName.text = "중앙대학교"
  }
  @IBAction func snuBtn(_ sender: Any) {
    univSelectionAppear.constant = 0
    univName.text = "서울대학교"
  }
  
  
  
  
  
  @IBOutlet weak var idCheckFailedLabel: UILabel!
  @IBAction func popUpTerms(_ sender: Any) {
  }
  @IBAction func signUpBtn(_ sender: Any) {
    //post - 회원가입
  }
  override func viewDidLoad() {
    idCheckFailedLabel.isHidden = true
    pwIncorrectLabel.isHidden = true
        super.viewDidLoad()
    
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

}
