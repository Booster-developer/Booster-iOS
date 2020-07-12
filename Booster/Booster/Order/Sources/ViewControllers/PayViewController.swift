//
//  PayViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/09.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class PayViewController: UIViewController {

  // MARK: - Vars
  var payFileInformations: [PayFile] = []
  
  // MARK: - Functions
  func setPayFileInformation() {
    let payFile1 = PayFile(fileName: "파일파일파일파일파일파일파일", expandName: ".pdf", options: "흑백/자동/단면/4개/4~7p/1부", price: 1700)
    let payFile2 = PayFile(fileName: "일파일파일파일파일파일파일파", expandName: ".pdf", options: "컬러/자동/양면-세로넘김/2개/2~9p/3부", price: 6000)
    payFileInformations = [payFile1, payFile2]
  }
  
  // MARK: - IBOutlets
  @IBOutlet weak var payFileTableView: UITableView!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setPayFileInformation()
      payFileTableView.delegate = self
      payFileTableView.dataSource = self

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
// MARK: - Extensions
extension PayViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return payFileInformations.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let payFileCell = tableView.dequeueReusableCell(withIdentifier: PayTableViewCell.identifier, for: indexPath) as? PayTableViewCell else {return UITableViewCell()}
    payFileCell.setPayFileInformation(fileName: payFileInformations[indexPath.row].fileName, expandName: payFileInformations[indexPath.row].expandName, fileOption: payFileInformations[indexPath.row].options, price: payFileInformations[indexPath.row].price)
    return payFileCell
  }
}
extension PayViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
}
