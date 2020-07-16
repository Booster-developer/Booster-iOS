//
//  OrderViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
  var _selectedIndexPath : IndexPath? = nil
  @IBOutlet weak var storeNameInSelection: UILabel!
  func connectServer(){
    orderStoreListService.shared.getOrderStoreList(){
      networkResult in
      print(networkResult)
      switch networkResult {
      case .success(let data):
        var tempStore:[simpleStoreData] = []
        guard let data = data as? OrderData else {return}
        if let _ = data.favorite_store{
          for i in 0..<data.favorite_store!.count{
            tempStore.append(simpleStoreData(store_idx: data.favorite_store![i].store_idx, store_name: data.favorite_store![i].store_name, store_image: data.favorite_store![i].store_image, store_address: data.favorite_store![i].store_address))
          }
          
          self.favorageStorelist = tempStore
          tempStore.removeAll()
        }
        else{
          self.favorateStore.removeAll()
        }
        if let _ = data.recent_order_store{
          //for i in 0..<data.recent_order_store!.count{
          tempStore.append(simpleStoreData(store_idx: data.recent_order_store!.store_idx, store_name: data.recent_order_store!.store_name, store_image: data.recent_order_store!.store_image, store_address: data.recent_order_store!.store_address))
          //}
          self.recentStorelist = tempStore
          tempStore.removeAll()
        }
        else{
          self.recentStorelist.removeAll()
        }
        
        for i in 0..<data.store_all.count{
          tempStore.append(simpleStoreData(store_idx: data.store_all[i].store_idx, store_name: data.store_all[i].store_name, store_image: data.store_all[i].store_image, store_address: data.store_all[i].store_address))
        }
        self.defaultStorelist = tempStore
        tempStore.removeAll()
        print(data)
        self.setCollectionVeiw()
        self.storeCollectionView.reloadData()
        
        
      case .requestErr(let messgae) : print(messgae)
      case .networkFail: print("networkFail")
      case .serverErr : print("serverErr")
      case .pathErr : print("pathErr")
      }
    }
  }
  override func viewDidLoad() {
    
    clearInternalFile()
    clearAllSelections()
    
    //      print(self.tabBarController?.selectedIndex)
    //      self.tabBarController?.tabBar.isHidden = true
    //self.tabBarController?.tabBar.isHidden = true
    connectServer()
    self.navigationController?.isNavigationBarHidden = true
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
  var recentStorelist:[simpleStoreData] = []
  var favorageStorelist:[simpleStoreData] = []
  var defaultStorelist:[simpleStoreData] = []
  func clearInternalFile(){
    let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    do {
      let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsUrl,
                                                                 includingPropertiesForKeys: nil,
                                                                 options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])
      for fileURL in fileURLs {
        try FileManager.default.removeItem(at: fileURL)
      }
    }
    catch  { print(error) }
  }
  
  
  
  let testboolean:[Bool] = [true,true,false,true]
  @IBAction func goBackToHomeView(_ sender: Any) {
    clearAllSelections()
    storeCollectionView.reloadData()
    selectionBtnHide()
    self.tabBarController?.selectedIndex = 0
    self.tabBarController?.tabBar.isHidden = false
  }
  @IBAction func selectionBtn(_ sender: Any) {
    guard let goToWaitingList = self.storyboard?.instantiateViewController(withIdentifier: "WaitingVC") as? WaitingListViewController else {return}
    var storeIdx:Int = -1
    switch _selectedIndexPath?.section {
    case 0:
      goToWaitingList.storeInfo = recentStorelist[_selectedIndexPath!.row]
      storeIdx = recentStorelist[_selectedIndexPath!.row].store_idx
    case 1:
      goToWaitingList.storeInfo = favorageStorelist[_selectedIndexPath!.row]
      storeIdx = favorageStorelist[_selectedIndexPath!.row].store_idx
    case 2:
      goToWaitingList.storeInfo = defaultStorelist[_selectedIndexPath!.row]
      storeIdx = defaultStorelist[_selectedIndexPath!.row].store_idx
      
    default:
      print("dd")
    }
    orderService.shared.order(orderIdx: storeIdx){
      networkResult in
      switch networkResult{
      case .success(let data):
        guard let data = data as? orderIdx else {return}
        goToWaitingList.orderIdx = data.order_idx
        print(data)
        self.navigationController?.pushViewController(goToWaitingList, animated: true)
      case .requestErr(let message):
        print(message)
      case .networkFail : print("networkFailed")
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      }
    }
  }
  private var storeInformations:[StoreInformations] = []
  private var favorateStore:[StoreInformations]=[]
  private var defaultStore:[StoreInformations] = []
  private var recentlyUsedStore:[StoreInformations] = []
  
  @IBOutlet weak var storeCollectionView: UICollectionView!
  func setCollectionVeiw(){
    selectionBtnHeight.constant = 0
    storeCollectionView.delegate = self
    storeCollectionView.dataSource = self
  }
  @IBOutlet weak var selectionBtnHeight: NSLayoutConstraint!
  func selectionBtnAppear(){
    
    self.view.layoutIfNeeded()
    selectionBtnHeight.constant = 146
    let appearAnimation = UIViewPropertyAnimator(duration: 0.25, curve: .linear, animations: {
      self.view.layoutIfNeeded()
    })
    appearAnimation.startAnimation()
  }
  func selectionBtnHide(){
    self.view.layoutIfNeeded()
    selectionBtnHeight.constant = 0
    let disappearAnimation = UIViewPropertyAnimator(duration: 0.25, curve: .linear, animations: {
      self.view.layoutIfNeeded()
    })
    disappearAnimation.startAnimation()
  }
  func clearAllSelections(){
    for i in 0..<recentlyUsedStore.count{
      recentlyUsedStore[i].isSelected = false
    }
    for i in 0..<favorateStore.count{
      favorateStore[i].isSelected = false
    }
    for i in 0..<defaultStore.count{
      defaultStore[i].isSelected = false
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
extension OrderViewController:UICollectionViewDelegate{
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
    case 0 : return recentStorelist.count
    case 1:
      if favorageStorelist.count == 0{ return 1 }
      else {return favorageStorelist.count}
    default:
      return defaultStorelist.count
    }
  }
  
}

extension OrderViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let storeCell:OrderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.identifier, for: indexPath) as? OrderCollectionViewCell else {return UICollectionViewCell()}
    
    if _selectedIndexPath == indexPath {
      storeCell.isSelected = true
      storeCell.backgroundImg.image = UIImage(named: "optionselect")
    }
    else {
      storeCell.isSelected = false
      storeCell.backgroundImg.image = UIImage(named: "bgStore")
    }
    switch indexPath.section{
    case 0:
      if recentStorelist.isEmpty{
        collectionView.deleteSections(NSIndexSet(index: indexPath.section) as IndexSet)
        collectionView.reloadData()
      }
      else{
        storeCell.storeThumbNail.setImage(path: recentStorelist[indexPath.row].store_image)
        storeCell.storeName.text = recentStorelist[indexPath.row].store_name
        storeCell.storeAddress.text = recentStorelist[indexPath.row].store_address
        //        storeCell.itemSelected(isSelected: recentlyUsedStore[indexPath.row].isSelected)
      }
    case 1:
      if favorageStorelist.isEmpty {
        guard let emptyCell:EmptyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.identifier, for: indexPath)as? EmptyCollectionViewCell else {return UICollectionViewCell()}
        return emptyCell
      }
      else{
        storeCell.storeThumbNail.setImage(path: favorageStorelist[indexPath.row].store_image)
        storeCell.storeName.text = favorageStorelist[indexPath.row].store_name
        storeCell.storeAddress.text = favorageStorelist[indexPath.row].store_address
        //        storeCell.itemSelected(isSelected: favorateStore[indexPath.row].isSelected)
        
      }
    case 2:
      print(defaultStorelist[indexPath.row])
      storeCell.storeThumbNail.setImage(path: defaultStorelist[indexPath.row].store_image)
      storeCell.storeName.text = defaultStorelist[indexPath.row].store_name
      storeCell.storeAddress.text = defaultStorelist[indexPath.row].store_address
    //        storeCell.itemSelected(isSelected: defaultStore[indexPath.row].isSelected)
    default :
      print("default")
    }
    
    //print(indexPath)
    //storeCell.storeThumbNail.image = UIImage(named : storeInformations[0].storeImgName.type())
    //storeCell.storeName.text = storeInformations[indexPath.row].storeName
    //storeCell.storeAddress.text = storeInformations[indexPath.row].storeAddress
    
    return storeCell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell:OrderCollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.identifier, for: indexPath) as? OrderCollectionViewCell else{return}
    
    storeNameInSelection.text = cell.storeName.text
    
    
    if ((_selectedIndexPath) != nil){
      guard let oldcell :OrderCollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.identifier, for: _selectedIndexPath!) as? OrderCollectionViewCell else{return}
      if indexPath.compare(_selectedIndexPath!) == ComparisonResult.orderedSame{
        _selectedIndexPath = nil
        clearAllSelections()
        selectionBtnHide()
      }
      else {
        selectionBtnAppear()
        switch indexPath.section {
        case 0:
          cell.itemSelected(isSelected: true)
          storeNameInSelection.text = recentStorelist[indexPath.row].store_name
          
        case 1:
          cell.itemSelected(isSelected: true)
          storeNameInSelection.text = favorageStorelist[indexPath.row].store_name
          
        case 2:
          cell.itemSelected(isSelected: true)
          storeNameInSelection.text = defaultStorelist[indexPath.row].store_name
        default:
          cell.itemSelected(isSelected: true)
        }
        
        //collectionView.reloadItems(at: [indexPath])
        
        switch _selectedIndexPath!.section {
        case 0:
          oldcell.itemSelected(isSelected: false)
        case 1:
          oldcell.itemSelected(isSelected: false)
        case 2:
          oldcell.itemSelected(isSelected: false)
        default:
          oldcell.itemSelected(isSelected: false)
        }
        _selectedIndexPath = indexPath
        //collectionView.reloadItems(at: [oldIdxPath])
      }
    }
    else {
      selectionBtnAppear()
      print("now")
      switch indexPath.section {
      case 0:
        cell.itemSelected(isSelected: true)
        storeNameInSelection.text = recentStorelist[indexPath.row].store_name
        
      case 1:
        cell.itemSelected(isSelected: true)
        storeNameInSelection.text = favorageStorelist[indexPath.row].store_name
        
      case 2:
        cell.itemSelected(isSelected: true)
        storeNameInSelection.text = defaultStorelist[indexPath.row].store_name
        
      default:
        cell.itemSelected(isSelected: true)
      }
      _selectedIndexPath = indexPath
    }
    storeNameInSelection.reloadInputViews()
    collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexpath:IndexPath) ->UICollectionReusableView{
    var header : OrderCollectionViewHeader!
    if kind == UICollectionView.elementKindSectionHeader{
      header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "orderHeader", for: indexpath) as? OrderCollectionViewHeader
      if indexpath.section == 0{
        header.headerTitle.text = "최근 방문 매장"
      }
      else if indexpath.section == 1 {
        header.headerTitle.text = "즐겨 찾는 매장"
      }
      else{
        header.headerTitle.text = "매장 모두 보기"
      }
    }
    return header
    
  }
}
extension OrderViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width:self.view.frame.size.width
      , height:self.view.frame.size.width * 73.0 / 375.0)
  }
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets{
    
    if section == 0 {
      return UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    }
      
    else{
      return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
