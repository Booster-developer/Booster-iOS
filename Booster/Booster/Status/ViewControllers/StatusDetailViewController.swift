//
//  StatusDetailViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/14.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class StatusDetailViewController: UIViewController {
  var orderIdx:Int? = 0
  var storN:String?
  var detailStatus: OrderDetail?
  var detailStatusInfo : [OrderFileList] = []
  @IBOutlet weak var orderRequest: UILabel!
  @IBOutlet weak var orderDate: UILabel!
  @IBOutlet weak var orderPrice: UILabel!
  @IBOutlet weak var orderNumber: UILabel!
  @IBOutlet weak var storeName: UILabel!
  @IBOutlet weak var orderStatus: UILabel!
  @IBOutlet weak var fileDetailCollectionView: UICollectionView!
  override func viewDidLoad() {
    super.viewDidLoad()
    storeName?.text = detailStatus?.orderStoreName
    orderNumber?.text = "no. " + String(detailStatus?.orderIdx ?? 0)
    orderDate?.text = detailStatus?.orderTime
    orderPrice?.text = String(detailStatus?.orderPrice ?? 0) + "원"
    orderRequest?.text = detailStatus?.orderComment
    orderStatus?.text = self.getStatusLabel(detailStatus?.orderState ?? 0)
    setCollectionView()
    setCollectionView()
    print(orderIdx)
    // Do any additional setup after loading the view.
  }
  func setCollectionView(){
    fileDetailCollectionView?.delegate = self
    fileDetailCollectionView?.dataSource = self
  }
  func getStatusLabel(_ idxx:Int) ->String{
    switch idxx {
    case 1: return "접수"
    case 2: return "인쇄중"
    case 3: return "인쇄완료"
    default:
      return "대기하기 상태"
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
  @IBAction func gobackbtn(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
}


extension StatusDetailViewController:UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.detailStatusInfo.count
  }
}
extension StatusDetailViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let fileCell:FileListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: FileListCollectionViewCell.identifier, for: indexPath) as? FileListCollectionViewCell else {
      return UICollectionViewCell()
    }
    fileCell.fileName.text = detailStatusInfo[indexPath.row].fileName
    fileCell.filePrice.text = String(detailStatusInfo[indexPath.row].filePrice) + "원"

    DispatchQueue.global(qos: .background).async {
      guard let data:Data = try? Data(contentsOf: self.detailStatusInfo[indexPath.row].fileThumbnailPath) , let image:UIImage = UIImage(data: data) else { return }
      DispatchQueue.main.async {
        fileCell.preViewImg.setImage(image, for: .normal)
      }
    }
    return fileCell
    
  }
  
}
