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
  @IBOutlet weak var countLabel: UILabel!

  
  @IBAction func back(_ sender: Any) {
    self.tabBarController?.selectedIndex = 0
  }
  
  // MARK: - IBActions
  @IBAction func presentCancelOrderViewController(_ sender: Any) {
    let storyBoard = UIStoryboard.init(name: "StatusHs", bundle: nil)
    let cancelOrderVC = storyBoard.instantiateViewController(identifier: "cancelOrderViewController") as CancelOrderViewController
    
    cancelOrderVC.modalPresentationStyle = .overCurrentContext
    self.present(cancelOrderVC, animated: false, completion: nil)
  }
  @IBAction func completePickUp(_ sender: Any) {
    
    statusHsTableView.reloadData()
  }
  
  // MARK: - Vars
  var statusInformations: [StatusInformation] = []
  private var marginViewHeightConstraint : NSLayoutConstraint!
  private var toggle: Bool = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    statusHsTableView.dataSource = self
    statusHsTableView.delegate = self
    
    StatusService.shared.getStatus() { networkResult in
      switch networkResult {
      case .success(let statusList) :
        
        guard let statusList = statusList as? StatusList else {return}
        for i in 0..<statusList.order_list.count {
          let statusInfo = StatusInformation.init(orderNum: statusList.order_list[i].order_idx, storeName: statusList.order_list[i].order_store_name, date: statusList.order_list[i].order_time, docsName: statusList.order_list[i].order_title, status: statusList.order_list[i].order_state)
          self.statusInformations.append(statusInfo)
          print(self.statusInformations)
        }
        self.statusHsTableView.reloadData()
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
    
  
    // Do any additional setup after loading the view.
  }
  
  // MARK: - Functions
  

  
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
    return statusHsCell
    
    
    
  }
}

extension StatusHsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 243
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
