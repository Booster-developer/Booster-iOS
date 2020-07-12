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
  @IBOutlet weak var popUpUnivList: UIButton!
  @IBAction func checkID(_ sender: Any) {
    getID.layer.borderColor = UIColor.red as! CGColor
    idCheckFailedLabel.isHidden = false
  }
  @IBOutlet weak var idCheckFailedLabel: UILabel!
  @IBAction func popUpTerms(_ sender: Any) {
  }
  @IBAction func signUpBtn(_ sender: Any) {
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
