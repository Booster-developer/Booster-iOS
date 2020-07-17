//
//  SearchViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  var refreshCollectionView = UIRefreshControl()
  var univIdx:Int?
  @IBOutlet weak var univNameButton: UIButton!
  @IBAction func selectUniv(_ sender: Any) {
    guard let univSelect = self.storyboard?.instantiateViewController(identifier: "UnivSelectViewController", creator: nil) as? UnivSelectViewController else { return}
    univSelect.modalPresentationStyle = .fullScreen
    
    univSelect.backgroundImg = self.tabBarController?.view.asImage()
    self.present(univSelect,animated: false, completion: nil)
    univSelect.univInformaitons = self.univInformations
    univSelect.myunivIndex = self.univIdx
  }
  func getunivname(univIdx:Int) -> String {
    switch univIdx {
    case 1: return "숭실대학교"
    case 2: return "중앙대학교"
    case 3: return "서울대학교"
    default : return "기타대학교"
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    storeCollectionView.refreshControl = refreshCollectionView
    refreshCollectionView.addTarget(self, action: #selector(refresh), for: .valueChanged)
    print(univIdx)
    storeListService.shared.getStoreList(self.univIdx!){
      networkResult in
      switch networkResult{
      case .success(let data):
        guard let data = data as? [StoreData] else {return}
        var tempStoreInfos:[StoreData] = []
        for i in 0..<data.count{
          tempStoreInfos.append(StoreData(store_idx: data[i].store_idx, store_name: data[i].store_name, store_image: data[i].store_image, store_location: data[i].store_location, price_color_double: data[i].price_color_double, price_color_single: data[i].price_color_single, price_gray_double: data[i].price_gray_double, price_gray_single: data[i].price_gray_single, store_x_location: data[i].store_x_location, store_y_location:data[i].store_y_location, store_double_sale: data[i].store_double_sale, store_favorite: data[i].store_favorite
            , store_open: data[i].store_open))
        }
        self.storeInfos = tempStoreInfos
        tempStoreInfos.removeAll()
        self.univNameButton.setTitle(self.getunivname(univIdx: self.univIdx!), for: .normal)
        self.setCollectionViewInfo()
        self.setUnivInfos()
        self.storeCollectionView.reloadData()
        
        
      case .requestErr(let message):
        guard let message = message as? String else { return }
        let alertViewController = UIAlertController(title: "매장 리스트 불러오기 실패", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)
        self.tabBarController?.selectedIndex = 0
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      case .networkFail: print("networkFail")
      }
    }
    
    
    // Do any additional setup after loading the view.
  }
  @objc func refresh(){
    self.view.layoutIfNeeded()
    refreshCollectionView.endRefreshing()
  }
  
  @IBOutlet weak var storeCollectionView: UICollectionView!
  func setCollectionViewInfo(){
    storeCollectionView?.delegate = self
    storeCollectionView?.dataSource = self
    
    setStoreInfos()
  }
  var storeInfos:[StoreData] = []
  private var storeInformaions:[StoreInformations]=[]
  func setStoreInfos(){
    let store1 = StoreInformations(storeName: "1번가게", storeAddress: "서울시 동작구 사당로 뭐시기", storeImgName: .fullImg("10"), isFavorate: false)
    let store2 = StoreInformations(storeName: "2번가게", storeAddress: "서울시 어딘가",  storeImgName: .fullImg("10"), isFavorate: false)
    let store3 = StoreInformations(storeName: "3번가게", storeAddress: "서울시 저기",  storeImgName: .fullImg("10"), isFavorate: false)
    let store4 = StoreInformations(storeName: "4번가게", storeAddress: "서울시 아아아ㅏ",  storeImgName: .fullImg("10"), isFavorate: false)
    
    self.storeInformaions=[store1,store2,store3,store4]
  }
  
  
  var univInformations:[UnivInformations] = []
  func setUnivInfos(){
    var univ1 = UnivInformations(univIdx: 0, univName: "숭실대학교",univAddress: "숭실대학교주소", univLine: .line7)
    univ1.isMyUniv = true
    let univ2 = UnivInformations(univIdx: 1, univName: "중앙대학교",univAddress: "중앙대주소", univLine: .line9)
    let univ3 = UnivInformations(univIdx: 2, univName: "서울대학교",univAddress: "서울대주소", univLine: .line2)
    
    self.univInformations = [univ1,univ2,univ3]
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  var toggle:Bool = false
  func popupDetailView(){
    
  }
  
  @IBAction func popupMapView(_ sender: Any) {
    let mapStroyboard = UIStoryboard.init(name:"SearchHs",bundle: nil)
    guard  let mapView = mapStroyboard.instantiateViewController(identifier: "mapHsViewController", creator: nil) as? MapViewController else {
      return
    }
    mapView.modalPresentationStyle = .fullScreen
    mapView.getName = getunivname(univIdx: (univIdx ?? 1))
    mapView.storesinuniv = storeInfos
    mapView.whereareyoufrom = 1
    self.present(mapView, animated: true, completion: nil)
  }
  @IBAction func goBacktoHome(_ sender: Any) {
    self.tabBarController?.selectedIndex = 0
    self.tabBarController?.tabBar.isHidden = false
  }
  
  
}
extension SearchViewController:UICollectionViewDelegate{
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return storeInfos.count
  }
}
extension SearchViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let storeCell:StoreCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCollectionViewCell.identifier, for: indexPath) as! StoreCollectionViewCell
    
    
    storeCell.storeImgView.setImage(path: storeInfos[indexPath.row].store_image)
    storeCell.storeImgView.contentMode = .scaleAspectFill
    storeCell.storeName.text = storeInfos[indexPath.row].store_name
    storeCell.storeAddress.text = storeInfos[indexPath.row].store_location
    storeCell.priceInfo.text = "A4"
    storeCell.grayPrice.text = "흑백 " + String(storeInfos[indexPath.row].price_gray_single) + " 원"
    
    storeCell.colorPrice.text = "컬러 " + String(storeInfos[indexPath.row].price_color_single) + " 원"
    storeCell.favorateBtn.tag = indexPath.row
    if storeInfos[indexPath.row].store_favorite == 1{
      storeCell.favorateBtn.setImage(UIImage(named: "storeIcActiveStar1"), for: .normal)
    }
    else{
      storeCell.favorateBtn.setImage(UIImage(named: "storeIcInactiveStar2"), for: .normal)
    }
    storeCell.favorateBtn.addTarget(self, action: #selector(favorate(sender:)), for: .touchUpInside)
    //storeCell.backgroundColor = UIColor.black
    //storeInformaions[2].isOpen = false //임시로 하나 닫아봄
    if storeInfos[indexPath.row].store_open == 1 {
      storeCell.isUserInteractionEnabled = true
      storeCell.isStoreOpen = true
    }
    storeCell.setStoreView()
    return storeCell
    
  }
  @objc func favorate(sender: UIButton){
    print(sender.tag)
    favoriteService.shared.favorateToggle(storeInfos[sender.tag].store_idx){
      networkResult in
      switch networkResult {
      case .success(let message):
        print(message)
        sender.setImage(UIImage(named: "storeIcActiveStar1"), for: .normal)
        self.storeInfos[sender.tag].store_favorite = 1
      case .requestErr(let message):
        print(message)
        sender.setImage(UIImage(named: "storeIcInactiveStar2"), for: .normal)
        self.storeInfos[sender.tag].store_favorite = 0
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      case .networkFail: print("networkFail")
      }
      self.viewDidLoad()
    }
    //self.storeCollectionView.reloadData()
    //print(sender.tag)
    //Post 즐겨찾기등록
    //GET 매장 리스트
    //self.storeCollectionView.reloadData()
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath)
    let detailStoryboard = UIStoryboard.init(name:"SearchHs",bundle: nil)
    
    guard  let detailView = detailStoryboard.instantiateViewController(identifier: "detailView", creator: nil) as? StoreDetailViewController else {
      return
    }
    detailView.storeidx = storeInfos[indexPath.row].store_idx
    
    detailView.modalPresentationStyle = .fullScreen
    self.present(detailView, animated: true)
  }
}
extension SearchViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width:self.view.frame.size.width
      , height:self.view.frame.size.width * 265.0 / 375.0)
  }
}
extension UIImageView {
  func setImage(path:URL) {
    let url = path
    DispatchQueue.global(qos: .background).async {
      guard let data:Data = try? Data(contentsOf: url) , let image:UIImage = UIImage(data: data) else { return }
      DispatchQueue.main.async {
        self.image = image
      }
    }
  }
}
