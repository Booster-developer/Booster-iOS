//
//  WaitingListViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class WaitingListViewController: UIViewController {

  @IBOutlet weak var waitingListCollectionView: UICollectionView!
  override func viewDidLoad() {
        super.viewDidLoad()
        setWaitingListCV()

        // Do any additional setup after loading the view.
    }
  
  @IBAction func closeBtn(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)

  }
  @IBAction func cangeCurrentStore(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  @IBAction func goToOptionBtn(_ sender: Any) {
  }
  
  func setWaitingListCV(){
    waitingListCollectionView.delegate = self
    waitingListCollectionView.dataSource = self
  }
  @IBOutlet weak var orderBtnAppear: NSLayoutConstraint!
  func orderViewAppear(){
    orderBtnAppear.constant = 162
  }
  func orderViewDisappear(){
    orderBtnAppear.constant = 0
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


extension WaitingListViewController:UICollectionViewDelegate{
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
}

extension WaitingListViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let fileAddCell:AddCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: AddCollectionViewCell.identifier, for: indexPath) as? AddCollectionViewCell else {return UICollectionViewCell()}
    guard let fileCell:WaitCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: WaitCollectionViewCell.identifier, for:indexPath) as? WaitCollectionViewCell else {
      return UICollectionViewCell()}
    if(indexPath.row == 1){
      return fileAddCell
    }
    else{
      return fileCell}
//    if indexPath.row >= 2{
//      orderViewAppear()
//    }

  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.row == 2{
      print("파일 불러오기")
    }
    print(indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexpath:IndexPath) ->UICollectionReusableView{
    var header : WaitCollectionViewHeader!
    if kind == UICollectionView.elementKindSectionHeader{
      header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "waitingHeader", for: indexpath) as? WaitCollectionViewHeader
      header.waitingHeaderTitle.text = "파일 목록"

    }
    return header
    
  }
}
extension WaitingListViewController:UICollectionViewDelegateFlowLayout{
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
