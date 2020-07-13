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
  override func viewDidLoad() {
//      print(self.tabBarController?.selectedIndex)
//      self.tabBarController?.tabBar.isHidden = true
      //self.tabBarController?.tabBar.isHidden = true
      self.navigationItem.title = "매장선택"
      super.viewDidLoad()
      setCollectionVeiw()
        // Do any additional setup after loading the view.
    }
  let testboolean:[Bool] = [true,true,false,true]
  @IBAction func goBackToHomeView(_ sender: Any) {
    self.tabBarController?.selectedIndex = 0
    self.tabBarController?.tabBar.isHidden = false
  }
  @IBAction func selectionBtn(_ sender: Any) {
    guard let goToWaitingList = self.storyboard?.instantiateViewController(withIdentifier: "WaitingVC") as? WaitingListViewController else {return}
    self.navigationController?.pushViewController(goToWaitingList, animated: true)
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
    getStoreInfos()
  }
  func getStoreInfos(){
    let store1 = StoreInformations(storeName: "복사왕 김제본", storeAddress: "ㅇㅇㅇㅇㅇ", storeImgName: .thumbNail("imgStore1"), isFavorate: false)
    let store2 = StoreInformations(storeName: "복사왕 김제본", storeAddress: "ㅇㅇㅇㅇㅇ", storeImgName: .thumbNail("imgStore1"), isFavorate: false)
    let store3 = StoreInformations(storeName: "복사왕 김제본", storeAddress: "ㅇㅇㅇㅇㅇ", storeImgName: .thumbNail("imgStore1"), isFavorate: false)
    let store4 = StoreInformations(storeName: "복사왕 김제본", storeAddress: "ㅇㅇㅇㅇㅇ", storeImgName: .thumbNail("imgStore1"), isFavorate: true)
    let store5 = StoreInformations(storeName: "복사왕 김제본", storeAddress: "ㅇㅇㅇㅇㅇ", storeImgName: .thumbNail("imgStore1"), isFavorate: false)
    let store6 = StoreInformations(storeName: "복사왕 김제본", storeAddress: "ㅇㅇㅇㅇㅇ", storeImgName: .thumbNail("imgStore1"), isFavorate: true)
    
    storeInformations = [store1,store2,store3,store4,store5,store6]
    for i in 0..<storeInformations.count{
      if storeInformations[i].isRecentlyVisited{
        recentlyUsedStore.append(storeInformations[i])
      }
      if storeInformations[i].isFavorate{
        favorateStore.append(storeInformations[i])
      }
      else {
        defaultStore.append(storeInformations[i])
      }
    }
  }
  @IBOutlet weak var selectionBtnHeight: NSLayoutConstraint!
  func selectionBtnAppear(){
    
    self.view.layoutIfNeeded()
    selectionBtnHeight.constant = 146
    let appearAnimation = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
      self.view.layoutIfNeeded()
    })
    appearAnimation.startAnimation()
  }
  func selectionBtnHide(){
    self.view.layoutIfNeeded()
    selectionBtnHeight.constant = 0
    let disappearAnimation = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
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
    case 0 : return recentlyUsedStore.count
    case 1:
      if favorateStore.count == 0{ return 1 }
      else {return favorateStore.count}
    default:
      return defaultStore.count
    }
  }
  
}

extension OrderViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let storeCell:OrderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.identifier, for: indexPath) as? OrderCollectionViewCell else {return UICollectionViewCell()}
    if _selectedIndexPath == indexPath {
      storeCell.isSelected = true
      storeCell.backgroundImg.image = UIImage(named: "bgStore")
    }
    else {
      storeCell.isSelected = false
      storeCell.backgroundImg.image = UIImage(named: "optionselect")
    }
    
    
    
    switch indexPath.section{
    case 0:
      if recentlyUsedStore.isEmpty{
        collectionView.deleteSections(NSIndexSet(index: indexPath.section) as IndexSet)
      }
      else{
        storeCell.storeThumbNail.image = UIImage(named: recentlyUsedStore[indexPath.row].storeImgName.type())
        storeCell.storeName.text = recentlyUsedStore[indexPath.row].storeName
        storeCell.storeAddress.text = recentlyUsedStore[indexPath.row].storeAddress
        storeCell.itemSelected(isSelected: recentlyUsedStore[indexPath.row].isSelected)
      }
    case 1:
      if favorateStore.isEmpty {
        guard let emptyCell:EmptyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.identifier, for: indexPath)as? EmptyCollectionViewCell else {return UICollectionViewCell()}
        return emptyCell
      }
      else{
        storeCell.storeThumbNail.image = UIImage(named: favorateStore[indexPath.row].storeImgName.type())
        storeCell.storeName.text = favorateStore[indexPath.row].storeName
        storeCell.storeAddress.text = favorateStore[indexPath.row].storeAddress
        storeCell.itemSelected(isSelected: favorateStore[indexPath.row].isSelected)

      }
    case 2:
        storeCell.storeThumbNail.image = UIImage(named: defaultStore[indexPath.row].storeImgName.type())
        storeCell.storeName.text = defaultStore[indexPath.row].storeName
        storeCell.storeAddress.text = defaultStore[indexPath.row].storeAddress
        storeCell.itemSelected(isSelected: defaultStore[indexPath.row].isSelected)
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
    //guard let cell:OrderCollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.identifier, for: indexPath) as? OrderCollectionViewCell else{return}
//    //cell.itemSelected()
    //print(indexPath)
    
    
    if ((_selectedIndexPath) != nil){
      if indexPath.compare(_selectedIndexPath!) == ComparisonResult.orderedSame{
        _selectedIndexPath = nil
        clearAllSelections()
        selectionBtnHide()
      }
      else {
        selectionBtnAppear()
        print("now")
        switch indexPath.section {
        case 0:
          recentlyUsedStore[indexPath.row].isSelected = true
        case 1:
          favorateStore[indexPath.row].isSelected = true
        case 2:
          defaultStore[indexPath.row].isSelected = true
        default:
          clearAllSelections()
        }
        //collectionView.reloadItems(at: [indexPath])

        print("old")
        switch _selectedIndexPath!.section {
        case 0:
          recentlyUsedStore[_selectedIndexPath!.row].isSelected = false
        case 1:
          favorateStore[_selectedIndexPath!.row].isSelected = false
        case 2:
          defaultStore[_selectedIndexPath!.row].isSelected = false
        default:
          clearAllSelections()
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
        recentlyUsedStore[indexPath.row].isSelected = true
      case 1:
        favorateStore[indexPath.row].isSelected = true
      case 2:
        defaultStore[indexPath.row].isSelected = true
      default:
        clearAllSelections()
      }
      _selectedIndexPath = indexPath
    }
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
