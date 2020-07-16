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
  var fileIdx:Int = 0
  var optionListFromServer : OptionList?
  
  
  // MARK: - IBActions
  @IBAction func blackClicked(_ sender: Any) {
    self.blackBtn.setImage(UIImage(named: "iconMonoSelected"), for: .normal)
    self.colorBtn.setImage(UIImage(named: "iconColor"), for: .normal)
    optionListFromServer?.file_color = "흑백"
  }
  @IBAction func colorClicked(_ sender: Any) {
    self.blackBtn.setImage(UIImage(named: "iconMono"), for: .normal)
    self.colorBtn.setImage(UIImage(named: "iconColorSelected"), for: .normal)
    optionListFromServer?.file_color = "컬러"
  }
  @IBAction func autoClicked(_ sender: Any) {
    self.autoBtn.setImage(UIImage(named: "iconAutoSelected"), for: .normal)
    self.colBtn.setImage(UIImage(named: "iconHeight"), for: .normal)
    self.rowBtn.setImage(UIImage(named: "iconWidth"), for: .normal)
    optionListFromServer?.file_direction = "자동"
  }
  @IBAction func colClicked(_ sender: Any) {
    self.autoBtn.setImage(UIImage(named: "iconAuto"), for: .normal)
    self.colBtn.setImage(UIImage(named: "iconHeightSelected"), for: .normal)
    self.rowBtn.setImage(UIImage(named: "iconWidth"), for: .normal)
    optionListFromServer?.file_direction = "가로"

  }
  @IBAction func rowClicked(_ sender: Any) {
    self.autoBtn.setImage(UIImage(named: "iconAuto"), for: .normal)
    self.colBtn.setImage(UIImage(named: "iconHeight"), for: .normal)
    self.rowBtn.setImage(UIImage(named: "iconWidthSelected"), for: .normal)
    optionListFromServer?.file_direction = "세로"

  }
  @IBAction func singleClicked(_ sender: Any) {
    self.singleBtn.setImage(UIImage(named: "iconDanSelected"), for: .normal)
    self.doubleRowBtn.setImage(UIImage(named: "iconYang1"), for: .normal)
    self.doubleColBtn.setImage(UIImage(named: "iconYang2"), for: .normal)
    optionListFromServer?.file_sided_type = "단면"
  }
  @IBAction func doubleRowClicked(_ sender: Any) {
    self.singleBtn.setImage(UIImage(named: "iconDan"), for: .normal)
    self.doubleRowBtn.setImage(UIImage(named: "iconYang1Selected"), for: .normal)
    self.doubleColBtn.setImage(UIImage(named: "iconYang2"), for: .normal)
    optionListFromServer?.file_sided_type = "양면(가로넘김)"

  }
  @IBAction func doubleColClicked(_ sender: Any) {
    self.singleBtn.setImage(UIImage(named: "iconDan"), for: .normal)
    self.doubleRowBtn.setImage(UIImage(named: "iconYang1"), for: .normal)
    self.doubleColBtn.setImage(UIImage(named: "iconYang2Selected"), for: .normal)
    optionListFromServer?.file_sided_type = "양면(세로넘김)"

  }
  @IBAction func oneClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1Selected"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
    optionListFromServer?.file_collect = 1
  }
  @IBAction func twoClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2Selected"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
    optionListFromServer?.file_collect = 2
  }
  @IBAction func threeClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3Selected"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
    optionListFromServer?.file_collect = 3

  }
  @IBAction func fourClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4Selected"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
    optionListFromServer?.file_collect = 4

  }
  @IBAction func sixClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6Selected"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
    optionListFromServer?.file_collect = 5

  }
  @IBAction func eightClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8Selected"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
    optionListFromServer?.file_collect = 6
  }
  @IBAction func nineClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9Selected"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16"), for: .normal)
    optionListFromServer?.file_collect = 7
  }
  @IBAction func sixteenClicked(_ sender: Any) {
    self.oneBtn.setImage(UIImage(named: "icon1"), for: .normal)
    self.twoBtn.setImage(UIImage(named: "icon2"), for: .normal)
    self.threeBtn.setImage(UIImage(named: "icon3"), for: .normal)
    self.fourBtn.setImage(UIImage(named: "icon4"), for: .normal)
    self.sixBtn.setImage(UIImage(named: "icon6"), for: .normal)
    self.eightBtn.setImage(UIImage(named: "icon8"), for: .normal)
    self.nineBtn.setImage(UIImage(named: "icon9"), for: .normal)
    self.sixteenBtn.setImage(UIImage(named: "icon16Selected"), for: .normal)
    optionListFromServer?.file_collect = 8
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
    
    
    optionSelectService.shared.optionSend(fileIdx: self.fileIdx, optionSelect: self.optionListFromServer!){
      networkResult in
      switch networkResult {
      case .success(let message):
        print(message)
      case .requestErr(let messgae) : print(messgae)
      case .networkFail: print("networkFail")
      case .serverErr : print("serverErr")
      case .pathErr : print("pathErr")
      }
    }
    
    
    //여기서 통신
    
    
    
    
    self.navigationController?.popViewController(animated: true)
  }
  @IBAction func backBtnClicked(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.blackBtn.setImage(UIImage(named: "iconMonoSelected"), for: .normal)
      self.autoBtn.setImage(UIImage(named: "iconAutoSelected"), for: .normal)
      self.singleBtn.setImage(UIImage(named: "iconDanSelected"), for: .normal)
      self.oneBtn.setImage(UIImage(named: "icon1Selected"), for: .normal)
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
