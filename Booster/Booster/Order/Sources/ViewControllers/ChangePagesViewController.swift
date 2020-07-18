//
//  ChangePagesViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class ChangePagesViewController: UIViewController {
  
  // MARK: - Vars
  var intNum : Int = 1
  
  // MARK: - IBOutlets
  @IBOutlet weak var changePagesView: UIView!
  @IBOutlet weak var pagesNum: UITextField!
  // MARK: - IBActions
  @IBAction func minusBtnClicked(_ sender: Any) {
    var intValue = Int(self.pagesNum.text!)
    if intValue != nil && intValue != 0{
      intValue? -= 1
    }
    self.pagesNum.text? = String(intValue!)
    self.intNum = intValue!
  }
  @IBAction func plusBtnClicked(_ sender: Any) {
    var intValue = Int(self.pagesNum.text!)
    if intValue != nil {
      intValue? += 1
    }
    self.pagesNum.text? = String(intValue!)
    self.intNum = intValue!
  }
  @IBAction func completeBtnClicked(_ sender: Any) {
    guard let vc = self.presentingViewController?.children[2] as? OrderHsViewController else {return}
    vc.pagesLabel?.text = self.pagesNum?.text
    vc.pagesNum = Int(self.pagesNum.text!)!
    vc.optionListFromServer?.file_copy_number = Int(self.pagesNum.text!)!
    dismiss(animated: false, completion: nil)
  }
  @IBAction func backBtnClicked(_ sender: Any) {
    dismiss(animated: false, completion: nil)
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      guard let vc = self.presentingViewController?.children[2] as? OrderHsViewController else {return}
      self.changePagesView.layer.cornerRadius = 10
      self.pagesNum.text = String(vc.pagesNum)

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
