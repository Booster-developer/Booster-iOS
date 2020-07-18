//
//  AlertViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/13.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
  @IBOutlet weak var alertCollectionView: UICollectionView!
  @IBAction func goBackToHome(_ sender: Any) {
  }
  static let identifier="alertView"
    override func viewDidLoad() {
        super.viewDidLoad()
      alertCollectionView.delegate = self
      alertCollectionView.dataSource = self
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
extension AlertViewController:UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
}
extension AlertViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let alertCell:AlertCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: AlertCollectionViewCell.identifier, for: indexPath)as? AlertCollectionViewCell else {return UICollectionViewCell()}
    
    return alertCell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.tabBarController?.selectedIndex = 3
    self.dismiss(animated: true, completion: nil)
    
    print("주문현황으로 넘어가기")
    
  }
}
