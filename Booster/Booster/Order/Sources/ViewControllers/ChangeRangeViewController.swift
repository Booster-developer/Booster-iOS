//
//  ChangeRangeViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class ChangeRangeViewController: UIViewController {
  
  // MARK: - Vars
  var whichButtonClicked: String = "whole"
  var isStartPartEmpty: Bool = true
  var isEndPartEmpty: Bool = true

  // MARK: - IBOutlets
  @IBOutlet weak var changeRangeView: UIView!
  @IBOutlet weak var wholeBtn: UIButton!
  @IBOutlet weak var partBtn: UIButton!
  @IBOutlet weak var startRangeField: UITextField!
  @IBOutlet weak var endRangeField: UITextField!
  @IBOutlet weak var completeBtn: UIButton!
  
  
  // MARK: - IBActions
  @IBAction func wholeBtnClicked(_ sender: Any) {
    self.wholeBtn.setImage(UIImage(named: "iconWholeSelect"), for: .normal)
    self.partBtn.setImage(UIImage(named: "iconPart"), for: .normal)
    self.startRangeField.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    self.startRangeField.isUserInteractionEnabled = false
    self.endRangeField.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    self.endRangeField.isUserInteractionEnabled = false
    self.whichButtonClicked = "whole"
  }
  @IBAction func partBtnClicked(_ sender: Any) {
    self.wholeBtn.setImage(UIImage(named: "iconWhole"), for: .normal)
    self.partBtn.setImage(UIImage(named: "iconPartSelect"), for: .normal)
    self.startRangeField.backgroundColor = UIColor.white
    self.startRangeField.isUserInteractionEnabled = true
    self.endRangeField.backgroundColor = UIColor.white
    self.endRangeField.isUserInteractionEnabled = true
    self.whichButtonClicked = "part"
   
    
  }
  @IBAction func completeBtnClicked(_ sender: Any) {
    guard let vc = self.presentingViewController?.children[2] as? OrderHsViewController else {return}
    if self.startRangeField.text!.isEmpty {
      isStartPartEmpty = true
       }
    else {
      isStartPartEmpty = false
    }
    if self.endRangeField.text!.isEmpty {
      isEndPartEmpty = true
       }
    else {
      isEndPartEmpty = false
    }
    if whichButtonClicked == "whole" {
      vc.rangeLabel.text = "전체인쇄"
      vc.optionListFromServer?.file_range = "전체인쇄"
      dismiss(animated: false, completion: nil)
    }
    else if (whichButtonClicked == "part") {
      if !isStartPartEmpty && !isEndPartEmpty {
      vc.rangeLabel.text = "부분인쇄"
        vc.optionListFromServer?.file_range = (startRangeField.text ?? "0") + "/" + (endRangeField.text ?? "0")
        print(vc.optionListFromServer?.file_range)

      print(isStartPartEmpty)
      print(isEndPartEmpty)
        
      dismiss(animated: false, completion: nil)
      }
    }
  }
  @IBAction func backBtnClicked(_ sender: Any) {
    dismiss(animated: false, completion: nil)
  }
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.changeRangeView.layer.cornerRadius = 10
      self.wholeBtn.setImage(UIImage(named: "iconWholeSelect"), for: .normal)
      self.partBtn.setImage(UIImage(named: "iconPart"), for: .normal)
      self.startRangeField.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
      self.startRangeField.isUserInteractionEnabled = false
      self.endRangeField.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
      self.endRangeField.isUserInteractionEnabled = false
      self.whichButtonClicked = "whole"
      

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
extension UITextField {
  var isEmpty: Bool {
    return text?.isEmpty ?? true
  }
}
