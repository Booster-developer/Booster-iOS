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
    }
  
    override func viewDidLoad() {
      super.viewDidLoad()
      setCollectionViewInfo()
      print(self.view.bounds)

        // Do any additional setup after loading the view.
    }
  @IBOutlet weak var storeCollectionView: UICollectionView!
  func setCollectionViewInfo(){
    storeCollectionView.delegate = self
    storeCollectionView.dataSource = self
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
extension SearchViewController:UICollectionViewDelegate{
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
}
extension SearchViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let storeCell:StoreCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCollectionViewCell.identifier, for: indexPath) as! StoreCollectionViewCell
    storeCell.storeImgView.image = UIImage(named: "storeImg1")
    storeCell.favorateBtn.tag = indexPath.row
    storeCell.favorateBtn.addTarget(self, action: #selector(favorate(sender:)), for: .touchUpInside)
    print(storeCell.bounds)
    storeCell.backgroundColor = UIColor.black
    if indexPath.row == 2 {
      storeCell.isUserInteractionEnabled = false
      storeCell.isStoreOpen = false
    }
    storeCell.setStoreView()
    return storeCell
  }
  @objc func favorate(sender: UIButton){
    print(sender.tag)
    //Post 즐겨찾기등록
    //GET 매장 리스트
    //self.storeCollectionView.reloadData()
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath)
  }
}
extension SearchViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 414, height: 292.56)
  }
}
