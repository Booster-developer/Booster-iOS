//
//  StatusDetailViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class StatusDetailViewController: UIViewController {

  @IBOutlet weak var orderRequest: UILabel!
  @IBOutlet weak var orderDate: UILabel!
  @IBOutlet weak var orderPrice: UILabel!
  @IBOutlet weak var orderNumber: UILabel!
  @IBOutlet weak var storeName: UILabel!
  @IBOutlet weak var orderStatus: UILabel!
  @IBOutlet weak var fileDetailCollectionView: UICollectionView!
  override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  func setCollectionView(){
    fileDetailCollectionView.delegate = self
    fileDetailCollectionView.dataSource = self
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


extension StatusDetailViewController:UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
}
extension StatusDetailViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let fileCell:FileListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: FileListCollectionViewCell.identifier, for: indexPath) as? FileListCollectionViewCell else {
      return UICollectionViewCell()
    }
    return fileCell
    
  }
}
