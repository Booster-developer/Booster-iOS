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
  
  // MARK: - IBActions
  @IBAction func backBtnClicked(_ sender: Any) {
    dismiss(animated: false, completion: nil)
  }
  
  
  // MARK: - Vars
  var engineInformations: [EngineInformation] = []
  
  // MARK: - Func
  func setEngineInformations() {
    let engineList1 = EngineInformation(date: "2020-02-20  18:59", store: "제빵왕 김탁구", engine: 3000, sign: true)
    let engineList2 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList3 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList4 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList5 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList6 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList7 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList8 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList9 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList10 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList11 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList12 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList13 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList14 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList15 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList16 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList17 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    let engineList18 = EngineInformation(date: "2020-12-25  09:23", store: "비버 소장님", engine: 8000, sign: false)
    
    
    engineInformations = [engineList1, engineList2, engineList3, engineList4, engineList5, engineList6, engineList7, engineList8, engineList9, engineList10, engineList11, engineList12, engineList13, engineList14, engineList15, engineList16, engineList17, engineList18]
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setEngineInformations()
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
