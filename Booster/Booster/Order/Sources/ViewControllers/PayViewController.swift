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
  var orderIndex: Int = 0
  
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
  @IBAction func payBtnClicked(_ sender: Any) {
    let storyBoard = UIStoryboard.init(name: "OrderHs", bundle: nil)
    let loadingVC = storyBoard.instantiateViewController(identifier: "loadingViewController")
    print(self.orderIndex)
    PayActionService.shared.postUserComment(order_idx: self.orderIndex, user_comment: requestTextField.text ?? "") { networkResult in switch networkResult {
    case .success(let message) :
      loadingVC.modalPresentationStyle = .overCurrentContext
      self.present(loadingVC, animated: false, completion: nil)

      DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.selectedIndex = 3
        self.navigationController?.popToRootViewController(animated: false)

      }

    case .requestErr(let message):
      guard let message = message as? String else {return}
      let alertViewController = UIAlertController(title: "결제 실패", message: message,
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
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.requestTextField.delegate = self
    self.navigationController?.isNavigationBarHidden = true
    self.requestTextField.attributedPlaceholder = NSAttributedString(string: "사장님께 요청사항을 작성해주세요.", attributes: [NSAttributedString.Key.foregroundColor:textFieldColor])
    self.updateCharacterCount()
    if self.requestTextField.isSelected {
      self.requestTextField.layer.borderWidth = 1
      self.requestTextField.layer.borderColor = (UIColor.init(red: 48/255, green: 79/255, blue: 255/255, alpha: 1).cgColor)
      
    }
    else {
      self.requestTextField.layer.borderColor = UIColor.black.cgColor
    }
    PaymentService.shared.getPayment(orderIdx: self.orderIndex) { networkResult in switch networkResult {
    case .success(let paymentList):
      print(self.orderIndex)
      print(paymentList)
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
        
      }
      self.payFileTableView.translatesAutoresizingMaskIntoConstraints = false
      self.payFileTableView.heightAnchor.constraint(equalToConstant: CGFloat(103 * self.payFileInformations.count)).isActive = true
      self.payFileTableView.delegate = self
      self.payFileTableView.dataSource = self
      self.requestTextField.delegate = self
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
  
  //  override func viewDidLayoutSubviews() {
  //    super.viewDidLayoutSubviews()
  //    payFileTableView.translatesAutoresizingMaskIntoConstraints = false
  //    payFileTableView.heightAnchor.constraint(equalToConstant: CGFloat(103 * payFileInformations.count)).isActive = true
  //
  //  }
  
  
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
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  override func didChangeValue(forKey key: String) {
    self.updateCharacterCount()
  }
}
