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
  var textFieldColor: UIColor = UIColor(displayP3Red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
  var textFieldCount: Int = 0
  
  // MARK: - Functions
  func setPayFileInformation() {
    let payFile1 = PayFile(fileName: "파일파일파일파일파일파일파일", expandName: ".pdf", options: "흑백/자동/단면/4개/4~7p/1부", price: 1700)
    let payFile2 = PayFile(fileName: "일파일파일파일파일파일파일파", expandName: ".pdf", options: "컬러/자동/양면-세로넘김/2개/2~9p/3부", price: 6000)
    payFileInformations = [payFile1, payFile2]
  }
  func updateCharacterCount() {
    var count = String(self.requestTextField.text!.count)
    self.textFieldTextCount.text = "("+count+"/50"
  }
  
  // MARK: - IBOutlets
  @IBOutlet weak var payFileTableView: UITableView!
  @IBOutlet weak var requestTextField: UITextField!
  @IBOutlet weak var textFieldTextCount: UILabel!
  
  // MARK: - IBActions
  @IBAction func backBtnClicked(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setPayFileInformation()
      payFileTableView.delegate = self
      payFileTableView.dataSource = self
      self.navigationController?.isNavigationBarHidden = true
      self.requestTextField.attributedPlaceholder = NSAttributedString(string: "사장님께 요청사항을 작성해주세요.", attributes: [NSAttributedString.Key.foregroundColor:textFieldColor])
      
      
        // Do any additional setup after loading the view.
      
    }
  
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    payFileTableView.translatesAutoresizingMaskIntoConstraints = false
    payFileTableView.heightAnchor.constraint(equalToConstant: CGFloat(115 * payFileInformations.count)).isActive = true
    
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
    payFileCell.separatorInset = UIEdgeInsets.zero
    payFileCell.setPayFileInformation(fileName: payFileInformations[indexPath.row].fileName, expandName: payFileInformations[indexPath.row].expandName, fileOption: payFileInformations[indexPath.row].options, price: payFileInformations[indexPath.row].price)
    return payFileCell
  }
}
extension PayViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 115
  }
  
}
extension PayViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if textField == requestTextField {
      return requestTextField.text!.count + (string.count - range.length) <= 50
    }
    return false
  }
  override func didChangeValue(forKey key: String) {
    self.updateCharacterCount()
  }
}
