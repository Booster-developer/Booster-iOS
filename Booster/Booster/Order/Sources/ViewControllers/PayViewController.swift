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
  
  func updateCharacterCount() {
    var count = self.requestTextField.text?.count ?? 0
    self.textFieldTextCount.text = "(\(count) /50)"
  }
  
  // MARK: - IBOutlets
  @IBOutlet weak var payFileTableView: UITableView!
  @IBOutlet weak var requestTextField: UITextField!
  @IBOutlet weak var textFieldTextCount: UILabel!
  @IBOutlet weak var currentEngine: UILabel!
  @IBOutlet weak var payEngine: UILabel!
  @IBOutlet weak var remainEngine: UILabel!
  @IBOutlet weak var orderTitleLabel: UILabel!
  @IBOutlet weak var orderIndexLabel: UILabel!
  
  
  // MARK: - IBActions
  @IBAction func backBtnClicked(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    payFileTableView.delegate = self
    payFileTableView.dataSource = self
    requestTextField.delegate = self
    self.navigationController?.isNavigationBarHidden = true
    self.requestTextField.attributedPlaceholder = NSAttributedString(string: "사장님께 요청사항을 작성해주세요.", attributes: [NSAttributedString.Key.foregroundColor:textFieldColor])
    self.updateCharacterCount()
    
    PaymentService.shared.getPayment() { networkResult in switch networkResult {
    case .success(let paymentList):
      guard let paymentList = paymentList as? DataClass else {return}
      self.currentEngine.text = String(paymentList.user_point)+"P"
      self.payEngine.text = String(paymentList.order_price)+"P"
      self.remainEngine.text = String(paymentList.user_remain_point)+"P"
      self.orderTitleLabel.text = paymentList.store_name
      self.orderIndexLabel.text = "주문번호 no."+String(paymentList.store_idx)
      for i in 0..<paymentList.fileOption.count {
        let payOption = paymentList.fileOption[i].file_color+"/"+paymentList.fileOption[i].file_direction+"/"+paymentList.fileOption[i].file_sided_type+"/"+String(paymentList.fileOption[i].file_collect)+"개/"+paymentList.fileOption[i].file_range+"/"+String(paymentList.fileOption[i].file_copy_number)+"부"
        
        let paymentInfo = PayFile.init(fileName: paymentList.fileOption[i].file_name, expandName: paymentList.fileOption[i].file_extension, options: payOption, price: paymentList.fileOption[i].file_price)
        self.payFileInformations.append(paymentInfo)
        print(self.payFileInformations)
      }
      self.payFileTableView.reloadData()
      
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
  
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    payFileTableView.translatesAutoresizingMaskIntoConstraints = false
    payFileTableView.heightAnchor.constraint(equalToConstant: CGFloat(103 * payFileInformations.count)).isActive = true
    
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
    return 103
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
