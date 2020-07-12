//
//  OrderHsViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/08.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class OrderHsViewController: UIViewController {

  
  
  
  // MARK: - IBOutlets
  @IBOutlet weak var blackBtn: UIButton!
  @IBOutlet weak var colorBtn: UIButton!
  @IBOutlet weak var autoBtn: UIButton!
  @IBOutlet weak var colBtn: UIButton!
  @IBOutlet weak var rowBtn: UIButton!
  @IBOutlet weak var singleBtn: UIButton!
  @IBOutlet weak var doubleRowBtn: UIButton!
  @IBOutlet weak var doubleColBtn: UIButton!
  @IBOutlet weak var oneBtn: UIButton!
  @IBOutlet weak var twoBtn: UIButton!
  @IBOutlet weak var threeBtn: UIButton!
  @IBOutlet weak var fourBtn: UIButton!
  @IBOutlet weak var sixBtn: UIButton!
  @IBOutlet weak var eightBtn: UIButton!
  @IBOutlet weak var nineBtn: UIButton!
  @IBOutlet weak var sixteenBtn: UIButton!
  @IBOutlet weak var rangeBtn: UIButton!
  @IBOutlet weak var pagesBtn: UIButton!
  @IBOutlet weak var rangeLabel: UILabel!
  @IBOutlet weak var pagesLabel: UILabel!
  
  // MARK: - Vars
  var optionList: [Options] = []
  var pagesNum: Int = 0
  
  // MARK: - IBActions
  @IBAction func blackClicked(_ sender: Any) {
    self.blackBtn.setImage(UIImage(named: "iconMonoSelect"), for: .normal)
    self.colorBtn.setImage(UIImage(named: "iconColor"), for: .normal)
  }
  @IBAction func colorClicked(_ sender: Any) {
    self.blackBtn.setImage(UIImage(named: "iconMono"), for: .normal)
    self.colorBtn.setImage(UIImage(named: "iconColorSelect"), for: .normal)
  }
  @IBAction func autoClicked(_ sender: Any) {
    self.autoBtn.setImage(UIImage(named: "iconAutoSelect"), for: .normal)
    self.colBtn.setImage(UIImage(named: "iconHeight"), for: .normal)
    self.rowBtn.setImage(UIImage(named: "iconWidth"), for: .normal)
  }
  @IBAction func colClicked(_ sender: Any) {
    self.autoBtn.setImage(UIImage(named: "iconAuto"), for: .normal)
    self.colBtn.setImage(UIImage(named: "iconHeightSelect"), for: .normal)
    self.rowBtn.setImage(UIImage(named: "iconWidth"), for: .normal)
  }
  @IBAction func rowClicked(_ sender: Any) {
    self.autoBtn.setImage(UIImage(named: "iconAuto"), for: .normal)
    self.colBtn.setImage(UIImage(named: "iconHeight"), for: .normal)
    self.rowBtn.setImage(UIImage(named: "iconWidthSelect"), for: .normal)
  }
  @IBAction func singleClicked(_ sender: Any) {
    self.singleBtn.setImage(UIImage(named: "iconDanSelect"), for: .normal)
    self.doubleRowBtn.setImage(UIImage(named: "iconYang1"), for: .normal)
    self.doubleColBtn.setImage(UIImage(named: "iconYang2"), for: .normal)
  }
  @IBAction func doubleRowClicked(_ sender: Any) {
    self.singleBtn.setImage(UIImage(named: "iconDan"), for: .normal)
    self.doubleRowBtn.setImage(UIImage(named: "iconYang1Select"), for: .normal)
    self.doubleColBtn.setImage(UIImage(named: "iconYang2"), for: .normal)
  }
  @IBAction func doubleColClicked(_ sender: Any) {
    self.singleBtn.setImage(UIImage(named: "iconDan"), for: .normal)
    self.doubleRowBtn.setImage(UIImage(named: "iconYang1"), for: .normal)
    self.doubleColBtn.setImage(UIImage(named: "iconYang2Select"), for: .normal)
  }
  @IBAction func oneClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1Select"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
  }
  @IBAction func twoClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2Select"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
  }
  @IBAction func threeClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3Select"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
  }
  @IBAction func fourClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4Select"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
  }
  @IBAction func sixClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6Select"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
  }
  @IBAction func eightClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8Select"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
  }
  @IBAction func nineClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9Select"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
  }
  @IBAction func sixteenClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16Select"), for: .normal)
  }
  @IBAction func rangeClicked(_ sender: Any) {
    let storyBoard = UIStoryboard.init(name: "OrderHs", bundle: nil)
    let changeRangeVC = storyBoard.instantiateViewController(identifier: "changeRangeViewController")
    changeRangeVC.modalPresentationStyle = .overCurrentContext
    present(changeRangeVC, animated: false, completion: nil)
  }
  @IBAction func pagesClicked(_ sender: Any) {
    let storyBoard = UIStoryboard.init(name: "OrderHs", bundle: nil)
      let changePagesVC = storyBoard.instantiateViewController(identifier: "changePagesViewController")
      changePagesVC.modalPresentationStyle = .overCurrentContext
      present(changePagesVC, animated: false, completion: nil)
    
  }
  @IBAction func setOptionsClicked(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  @IBAction func backBtnClicked(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.blackBtn.setImage(UIImage(named: "iconMonoSelect"), for: .normal)
      self.autoBtn.setImage(UIImage(named: "iconAutoSelect"), for: .normal)
      self.singleBtn.setImage(UIImage(named: "iconDanSelect"), for: .normal)
      self.oneBtn.setImage(UIImage(named: "icon1Select"), for: .normal)
      self.navigationController?.isNavigationBarHidden = true
      
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
