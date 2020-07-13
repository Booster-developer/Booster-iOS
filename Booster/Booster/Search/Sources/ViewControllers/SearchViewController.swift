//
//  SearchViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  @IBOutlet weak var univNameButton: UIButton!
  @IBAction func selectUniv(_ sender: Any) {
        guard let univSelect = self.storyboard?.instantiateViewController(identifier: "UnivSelectViewController", creator: nil) as? UnivSelectViewController else { return}
        univSelect.modalPresentationStyle = .fullScreen
        
        univSelect.backgroundImg = self.tabBarController?.view.asImage()
        self.present(univSelect,animated: false, completion: nil)
    univSelect.univInformaitons = self.univInformations
    }
  
    override func viewDidLoad() {
      super.viewDidLoad()
      setCollectionViewInfo()
      setUnivInfos()
      print(self.view.bounds)

        // Do any additional setup after loading the view.
    }
  @IBOutlet weak var storeCollectionView: UICollectionView!
  func setCollectionViewInfo(){
    storeCollectionView.delegate = self
    storeCollectionView.dataSource = self
    
    setStoreInfos()
  }
  
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
    let detailStoryboard = UIStoryboard.init(name:"SearchHs",bundle: nil)

    guard  let detailView = detailStoryboard.instantiateViewController(identifier: "detailView", creator: nil) as? StoreDetailViewController else {
      return
    }
    detailView.modalPresentationStyle = .fullScreen
    self.present(detailView, animated: true)
  }

  @IBAction func popupMapView(_ sender: Any) {
    let mapStroyboard = UIStoryboard.init(name:"SearchHs",bundle: nil)

    guard  let mapView = mapStroyboard.instantiateViewController(identifier: "mapHsViewController", creator: nil) as? MapViewController else {
      return
    }
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
    return storeInformaions.count
  }
}
extension SearchViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let storeCell:StoreCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCollectionViewCell.identifier, for: indexPath) as! StoreCollectionViewCell
    storeCell.storeImgView.image = UIImage(named: storeInformaions[indexPath.row].storeImgName.type())
    storeCell.storeImgView.contentMode = .scaleAspectFill
    storeCell.storeName.text = storeInformaions[indexPath.row].storeName
    storeCell.storeAddress.text = storeInformaions[indexPath.row].storeAddress
    storeCell.priceInfo.text = storeInformaions[indexPath.row].price[0]
    storeCell.favorateBtn.tag = indexPath.row
    storeCell.favorateBtn.addTarget(self, action: #selector(favorate(sender:)), for: .touchUpInside)
    
    
    //storeCell.backgroundColor = UIColor.black
    storeInformaions[2].isOpen = false //임시로 하나 닫아봄
    if storeInformaions[indexPath.row].isOpen == false {
      storeCell.isUserInteractionEnabled = false
      storeCell.isStoreOpen = false
    }
    storeCell.setStoreView()
    return storeCell
  }
  @objc func favorate(sender: UIButton){
    storeInformaions[sender.tag].isFavorate = !storeInformaions[sender.tag].isFavorate
    if(storeInformaions[sender.tag].isFavorate){
      sender.setImage(UIImage(named: "storeIcActiveStar1"), for: .normal)
    }
    else {
      sender.setImage(UIImage(named: "storeIcInactiveStar2"), for: .normal)
    }
    self.storeCollectionView.reloadData()
    //print(sender.tag)
    //Post 즐겨찾기등록
    //GET 매장 리스트
    //self.storeCollectionView.reloadData()
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath)
    self.popupDetailView()
  }
}
extension SearchViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width:self.view.frame.size.width
      , height:self.view.frame.size.width * 265.0 / 375.0)
  }
}
