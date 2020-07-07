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
  
  // MARK: - Vars
  private var statusInformations: [StatusInformation] = []
  
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
                                    docsName: "보고서.pdf")
    let status2 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                    docsName: "보고서.pdf")
    let status3 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                    docsName: "보고서.pdf")
    let status4 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                    docsName: "보고서.pdf")
    let status5 = StatusInformation(orderNum: 1, storeName: "복사왕 김제본", date: "2020-07-05",
                                    docsName: "보고서.pdf")
    
    statusInformations = [status1, status2, status3, status4, status5]
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
    statusHsCell.setStatusInformation(num: statusInformations[indexPath.row].orderNum, storeName: statusInformations[indexPath.row].storeName, date: statusInformations[indexPath.row].date, docsName: statusInformations[indexPath.row].docsName)
    return statusHsCell
  }
}

extension StatusHsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 243
  }
}
