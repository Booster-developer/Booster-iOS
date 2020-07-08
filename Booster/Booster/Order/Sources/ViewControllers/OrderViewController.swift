//
//  OrderViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

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
  
  @IBOutlet weak var storeCollectionView: UICollectionView!
  func setCollectionVeiw(){
    selectionBtnHeight.constant = 0
    storeCollectionView.delegate = self
    storeCollectionView.dataSource = self
  }
  @IBOutlet weak var selectionBtnHeight: NSLayoutConstraint!
  func selectionBtnAppear(){
    selectionBtnHeight.constant = 146
  }
  func selectionBtnHide(){
    selectionBtnHeight.constant = 0
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
    return 2
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    }
    else {return 10}
  }
  
}

extension OrderViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let storeCell:OrderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.identifier, for: indexPath) as? OrderCollectionViewCell else {return UICollectionViewCell()}
    
    
    return storeCell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell:OrderCollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.identifier, for: indexPath) as? OrderCollectionViewCell else{return}
    cell.itemSelected()
    print(indexPath)
    selectionBtnAppear()
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexpath:IndexPath) ->UICollectionReusableView{
    var header : OrderCollectionViewHeader!
    if kind == UICollectionView.elementKindSectionHeader{
      header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "orderHeader", for: indexpath) as? OrderCollectionViewHeader
      if indexpath.section == 0{
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
