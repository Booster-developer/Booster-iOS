//
//  EngineListViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/13.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class EngineListViewController: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet weak var engineListTableView: UITableView!
  @IBOutlet weak var engineLabel: UILabel!
  
  // MARK: - IBActions
  @IBAction func backBtnClicked(_ sender: Any) {
    dismiss(animated: false, completion: nil)
  }
  
  
  // MARK: - Vars
  var engineInformations: [EngineInformation] = []
  
  // MARK: - Func
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      engineListTableView.dataSource = self
      engineListTableView.delegate = self
        // Do any additional setup after loading the view.
    }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    engineListTableView.translatesAutoresizingMaskIntoConstraints = false
    engineListTableView.heightAnchor.constraint(equalToConstant: CGFloat(38 * engineInformations.count)).isActive = true
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

extension EngineListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return engineInformations.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let engineCell = tableView.dequeueReusableCell(withIdentifier: EngineListCell.identifier, for: indexPath) as? EngineListCell else {return UITableViewCell()}
    engineCell.setEngineListInformation(date: engineInformations[indexPath.row].date
      , store: engineInformations[indexPath.row].store, engine: engineInformations[indexPath.row].engine, sign: engineInformations[indexPath.row].sign)
    return engineCell
  }
}
extension EngineListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 38
  }
  
}
