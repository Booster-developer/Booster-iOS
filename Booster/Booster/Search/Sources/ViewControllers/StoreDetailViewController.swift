//
//  StoreDetailViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class StoreDetailViewController: UIViewController {
  var storeidx:Int?
  @IBOutlet weak var storeDetailImg: UIImageView!
  var storeInfo:StoreDetailData = StoreDetailData()
  @IBOutlet weak var univLineImg: UIImageView!
  @IBOutlet weak var storeLocation: UILabel!
  @IBOutlet weak var storeName: UILabel!
  @IBOutlet weak var storeAddress: UILabel!
  @IBOutlet weak var storeTimeWeekdays: UILabel!
  @IBOutlet weak var storeTimeSat: UILabel!
  @IBOutlet weak var storeTimeSun: UILabel!
  @IBOutlet weak var storePhoneNum: UILabel!
  @IBOutlet weak var priceColorSingle: UILabel!
  @IBOutlet weak var priceColorDouble: UILabel!
  @IBOutlet weak var priceGraySingle: UILabel!
  @IBOutlet weak var priceGrayDouble: UILabel!
  

  @IBAction func gotoWaitingList(_ sender: Any) {
    let waitingstoryboard = UIStoryboard.init(name:"Order",bundle: nil)
    
    guard let goToWaitingList = waitingstoryboard.instantiateViewController(withIdentifier: "WaitingVC") as? WaitingListViewController else {return}
    var storeData = simpleStoreData()
    storeData.store_address = self.storeInfo.store_address
    storeData.store_idx = self.storeidx ?? 0
    storeData.store_name = self.storeInfo.store_name
    
    goToWaitingList.storeInfo = storeData
    orderService.shared.order(orderIdx: self.storeidx ?? 0){
      networkResult in
      switch networkResult{
      case .success(let data):
        guard let data = data as? orderIdx else {return}
        goToWaitingList.orderIdx = data.order_idx
        print(data)
      case .requestErr(let message):
        print(message)
      case .networkFail : print("networkFailed")
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      }
    }
    print("dj")
    let navi = UINavigationController.init(rootViewController: goToWaitingList)
    navi.pushViewController(goToWaitingList, animated: true)
  }
  
  @IBAction func backBtn(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func popUpMapView(_ sender: Any) {
    let mapStroyboard = UIStoryboard.init(name:"SearchHs",bundle: nil)
    guard  let mapView = mapStroyboard.instantiateViewController(identifier: "mapHsViewController", creator: nil) as? MapViewController else {
      return
    }
    mapView.modalPresentationStyle = .fullScreen
    mapView.getName = storeInfo.store_name
    mapView.whereareyoufrom = 2
    mapView.storeX = storeInfo.store_x_location
    mapView.storeY = storeInfo.store_y_location
    
    self.present(mapView,animated: true,completion: nil)
  }
  
  
  var storelocX:Double = 0
  var storelocY:Double = 0
  var univline:Int = 0
  
  // MARK: - Vars
  var toggle: Bool = true
  // MARK: - IBOutlet
  @IBOutlet weak var favBtn: UIButton!
  func lineImg(univLine:Int) -> String{
    switch univline{
    case 7:
      return "storeDetailImgSubway7"
    case 2 :
      return "storeDetailImgSubway2"
    case 9 :
      return "storeDetailImgSubway9"
    default : return ""
    }
  }
  
  // MARK: - IBAction
  @IBAction func changeFavBtn(_ sender: Any) {
    if toggle {
      self.favBtn.setImage(UIImage.init(named: "storeDetailIcStarActive"), for: .normal)
      toggle = !toggle
    }
    else if !toggle {
      self.favBtn.setImage(UIImage.init(named: "storeDetailIcStarInactive"), for: .normal)
      toggle = !toggle
    }
    
  }
  
  @objc func refresh(){
    self.view.layoutIfNeeded()
  }
  
  override func viewDidLoad() {
    self.navigationController?.isToolbarHidden = true
    super.viewDidLoad()
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    storeDetailListService.shared.getStoreDetailList(storeidx ?? 0){
      networkResult in
      switch networkResult{
      case .success(let data) :
        guard let data = data as? StoreDetailData else {return}
        print("gha?")
        
        self.storeInfo = data
        self.setView()
        print(self.storeInfo)
      case .requestErr(let message):
        print(message)
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      case .networkFail: print("networkFail")
      }
    }
    
    // Do any additional setup after loading the view.
  }
  func setView(){
    self.storeDetailImg.setImage(path: storeInfo.store_image)
    self.storeName.text = storeInfo.store_name
    self.storeLocation.text = storeInfo.store_location
    self.storeAddress.text = storeInfo.store_address
    self.storeTimeWeekdays.text = storeInfo.store_time_weekdays
    self.storeTimeSat.text = storeInfo.store_time_saturday
    self.storeTimeSun.text = storeInfo.store_time_sunday
    self.storePhoneNum.text = storeInfo.store_phone_number
    self.priceColorSingle.text = String(storeInfo.price_color_single)
    self.priceColorDouble.text = String(storeInfo.price_color_double)
    self.priceGraySingle.text = String(storeInfo.price_gray_single)
    self.priceGrayDouble.text = String(storeInfo.price_gray_double)
    self.storelocX = storeInfo.store_x_location
    self.storelocY = storeInfo.store_y_location
    self.univline = storeInfo.univ_line
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
