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

  
  // MARK: - IBActions
  @IBAction func presentCancelOrderViewController(_ sender: Any) {
    let storyBoard = UIStoryboard.init(name: "StatusHs", bundle: nil)
    let cancelOrderVC = storyBoard.instantiateViewController(identifier: "cancelOrderViewController")
    cancelOrderVC.modalPresentationStyle = .overCurrentContext
    self.present(cancelOrderVC, animated: false, completion: nil)
  }
  @IBAction func completePickUp(_ sender: Any) {
    changeStatusInformations()
    statusHsTableView.reloadData()
  }
  
  // MARK: - Vars
  private var statusInformations: [StatusInformation] = []
  private var marginViewHeightConstraint : NSLayoutConstraint!
  private var toggle: Bool = true
  
    override func viewDidLoad() {
      super.viewDidLoad()
      setStatusInformations()
      statusHsTableView.dataSource = self
      statusHsTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
  // MARK: - Functions
  private func setStatusInformations() {
    let status1 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                    docsName: "보고서.pdf", status: .order)
    let status2 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                    docsName: "보고서.pdf", status: .printing)
    let status3 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                    docsName: "보고서.pdf", status: .done)
    let status4 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                    docsName: "보고서.pdf", status: .order)
    let status5 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                    docsName: "보고서.pdf", status: .done)
    statusInformations = [status1, status2, status3, status4, status5]
  }
  
  func changeStatusInformations() {
   let status2 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                   docsName: "보고서.pdf", status: .printing)
   let status3 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                   docsName: "보고서.pdf", status: .done)
   let status4 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                   docsName: "보고서.pdf", status: .order)
   let status5 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                   docsName: "보고서.pdf", status: .done)
    
    statusInformations = [status2, status3, status4, status5]
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
                                      imageName: statusInformations[indexPath.row].status.getImageName())
    
    statusHsCell.setBtnImg(imgName: statusInformations[indexPath.row].status.getImageName())
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
