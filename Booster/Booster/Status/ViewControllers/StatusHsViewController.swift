//
//  StatusHsViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class StatusHsViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var statusHsTableView: UITableView!
  @IBOutlet weak var marginView: UIView!
  @IBOutlet weak var marginViewHeight: NSLayoutConstraint!
  
  var getUserName:String = ""
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var itemCount: UILabel!
  
  
  @IBAction func back(_ sender: Any) {
    self.tabBarController?.selectedIndex = 0
  }
  
  // MARK: - IBActions
  //  @IBAction func presentCancelOrderViewController(_ sender: Any) {
  //    let storyBoard = UIStoryboard.init(name: "StatusHs", bundle: nil)
  //    guard let cancelOrderVC = storyBoard.instantiateViewController(identifier: "cancelOrderViewController") as? CancelOrderViewController else {return}
  //
  //    cancelOrderVC.modalPresentationStyle = .overCurrentContext
  //    cancelOrderVC.orderNum = self.orderNum
  //    print(self.orderNum)
  //    self.present(cancelOrderVC, animated: false, completion: nil)
  //  }
//  @IBAction func completePickUp(_ sender: Any) {
//    
//    statusHsTableView.reloadData()
//  }
  
  // MARK: - Vars
  var statusInformations: [StatusInformation] = []
  private var marginViewHeightConstraint : NSLayoutConstraint!
  private var toggle: Bool = true
  var orderNum: Int?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    statusHsTableView.reloadData()
    statusHsTableView.dataSource = self
    statusHsTableView.delegate = self
    getServerData()
    _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: (#selector(self.getServerData)), userInfo: nil, repeats: true)
    
    
    // Do any additional setup after loading the view.
  }
  
  // MARK: - Functions
  @objc func getServerData() {
    StatusService.shared.getStatus() { networkResult in
      switch networkResult {
      case .success(let statusList) :
        
        guard let statusList = statusList as? StatusList else {return}
        var tempList:[StatusInformation] = []
        for i in 0..<statusList.order_list.count {
          let statusInfo = StatusInformation.init(orderNum: statusList.order_list[i].order_idx, storeName: statusList.order_list[i].order_store_name, date: statusList.order_list[i].order_time, docsName: statusList.order_list[i].order_title, status: statusList.order_list[i].order_state)
          tempList.append(statusInfo)
        }
        self.statusInformations = tempList
        self.userName.text = statusList.user_name + "님의 부스터"
        self.itemCount.text = String(self.statusInformations.count) + "개 가동중"
        self.statusHsTableView.reloadData()
        tempList.removeAll()
      case .requestErr(let message):
        guard let message = message as? String else {return}
        let alertViewController = UIAlertController(title: "로그인 실패", message: message,
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)
      case .pathErr: print("path")
      case .serverErr: print("serverErr")
      case .networkFail: print("networkFail")
        
      }
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

extension StatusHsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return statusInformations.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let statusHsCell = tableView.dequeueReusableCell(withIdentifier: StatusHsCell.identifier,
                                                           for: indexPath) as? StatusHsCell else
    { return UITableViewCell() }
    statusHsCell.setStatusInformation(num: statusInformations[indexPath.row].orderNum, storeName: statusInformations[indexPath.row].storeName, date: statusInformations[indexPath.row].date, docsName: statusInformations[indexPath.row].docsName,
                                      imageName: statusInformations[indexPath.row].getImageName())
    
    statusHsCell.setBtnImg(imgName: statusInformations[indexPath.row].getImageName())
    statusHsCell.tag = indexPath.row
    
    
    statusHsCell.cancelOrderBtn.tag = indexPath.row
    statusHsCell.cancelOrderBtn.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)
    
    statusHsCell.completePickUpBtn.tag = indexPath.row
    statusHsCell.completePickUpBtn.addTarget(self, action: #selector(pickup(sender:)), for: .touchUpInside)
    
    return statusHsCell
  }
  @objc func deleteCell(sender:UIButton) {
    let storyBoard = UIStoryboard.init(name: "StatusHs", bundle: nil)
    guard let cancelOrderVC = storyBoard.instantiateViewController(identifier: "cancelOrderViewController") as? CancelOrderViewController else {return}
    cancelOrderVC.modalPresentationStyle = .overCurrentContext
    cancelOrderVC.orderNum = statusInformations[sender.tag].orderNum
    
    self.present(cancelOrderVC, animated: false, completion: nil)
  }
  @objc func pickup(sender:UIButton) {
    //self.orderNum
    let tempordernum = statusInformations[sender.tag].orderNum
    
    CompletePickupService.shared.pickup(orderIndex: tempordernum) {
      networkResult in switch networkResult {
      case .success(let message) :
        self.getServerData()
      case .requestErr(let message):
        guard let message = message as? String else {return}
        let alertViewController = UIAlertController(title: "로그인 실패", message: message,
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)
      case .pathErr: print("path")
      case .serverErr: print("serverErr")
      case .networkFail: print("networkFail")
        
      }
    }
  }
}




extension StatusHsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 243
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailstoryboard = UIStoryboard.init(name:"Status",bundle: nil)
    guard  let detailCell = detailstoryboard.instantiateViewController(identifier: "statusDetail", creator: nil) as? StatusDetailViewController else {
      return
    }
    detailCell.orderIdx = statusInformations[indexPath.row].orderNum
      orderDetailViewService.shared.orderDetail(statusInformations[indexPath.row].orderNum){
        networkResult in
        switch networkResult {
        case .success(let data) :
          guard let fileList = data as? OrderDetail else {return}
          var tempList : [OrderFileList] = []
          if fileList.orderFileList.isEmpty {
            tempList.removeAll()
            detailCell.detailStatusInfo.removeAll()
          }
          else {
            for i in 0..<fileList.orderFileList.count {
              tempList.append(fileList.orderFileList[i])
            }
            detailCell.detailStatusInfo = tempList
            tempList.removeAll()
          }
          detailCell.detailStatus = fileList
          
          detailCell.modalPresentationStyle = .fullScreen
          self.present(detailCell, animated: true)
        case .requestErr(let message):
          print(message)
        case .pathErr : print("pathErr")
        case .serverErr : print("serverErr")
        case .networkFail: print("networkFail")
        }
    }

    
    
  }
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    if toggle {
      marginViewHeightConstraint = marginViewHeight
      self.marginViewHeight.constant -= 3
      toggle = !toggle
    }
  }
}
extension NSLayoutConstraint {
  func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
    return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: self.multiplier, constant: self.constant)
  }
}
