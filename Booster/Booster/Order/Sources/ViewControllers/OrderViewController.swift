//
//  OrderViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    override func viewDidLoad() {
//      print(self.tabBarController?.selectedIndex)
//      self.tabBarController?.tabBar.isHidden = true
      //self.tabBarController?.tabBar.isHidden = true
      self.navigationItem.title = "매장찾기"
      super.viewDidLoad()
      setStoreTableView()
        // Do any additional setup after loading the view.
    }
  @IBAction func goBackToHomeView(_ sender: Any) {
    self.tabBarController?.selectedIndex = 0
    self.tabBarController?.tabBar.isHidden = false
  }
  @IBAction func selectionBtn(_ sender: Any) {
    guard let goToWaitingList = self.storyboard?.instantiateViewController(withIdentifier: "WaitingVC") as? WaitingListViewController else {return}
    self.navigationController?.pushViewController(goToWaitingList, animated: true)
  }
  @IBOutlet weak var storeTableView: UITableView!
  
  func setStoreTableView(){
    //storeTableView.delegate = self
    storeTableView.dataSource = self
  }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
//extension OrderViewController:UITableViewDelegate {
//
//}
}
extension OrderViewController:UITableViewDataSource{
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let storeCell = tableView.dequeueReusableCell(withIdentifier:SearchStoreTableViewCell.identifier, for: indexPath) as? SearchStoreTableViewCell else {return UITableViewCell()}
    return storeCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0{
      return 1
    }
    return 10
  }
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0{
      return "즐겨찾는 매장"
    }
    else {return "매장 모두보기"}
  }
  
}
