//
//  UnivSelectViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class UnivSelectViewController: UIViewController {
  var myunivIndex:Int?
  

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var dimmerView: UIView!
    @IBOutlet weak var selectionViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var selectionView: UIView!
  @IBOutlet weak var downDarggableView: UIView!
  
    var backgroundImg: UIImage?
  
  
  @IBOutlet weak var univTableView: UITableView!
  override func viewDidLoad() {
      super.viewDidLoad()
    univListService.shared.getUnivList(){
      networkResult in
        switch networkResult{
        case .success(let data):
          guard let data = data as? [univData] else {return}
          var tempUnivInfos:[univData] = []
          for i in 0..<data.count{
            tempUnivInfos.append(univData(univ_idx: data[i].univ_idx, univ_name: data[i].univ_name, univ_address: data[i].univ_address, univ_line: data[i].univ_line))
          }
          self.univInfos = tempUnivInfos
          tempUnivInfos.removeAll()
          
          self.setTableView()
          self.showSelection()
        case .requestErr(let message):
          guard let message = message as? String else { return }
          let alertViewController = UIAlertController(title: "매장 리스트 불러오기 실패", message: message, preferredStyle: .alert)
          let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
          alertViewController.addAction(action)
          self.present(alertViewController, animated: true, completion: nil)
          self.tabBarController?.selectedIndex = 0
        case .pathErr : print("pathErr")
        case .serverErr : print("serverErr")
        case .networkFail: print("networkFail")
        }
      }
    


      // Do any additional setup after loading the view.
    let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_ :)))
    dimmerView.addGestureRecognizer(dimmerTap)
    dimmerView.isUserInteractionEnabled = true
    
    let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender :)))
    downSwipe.direction = .down
    downDarggableView.addGestureRecognizer(downSwipe)
  }
  @objc func handleSwipe(sender :UISwipeGestureRecognizer){
    if sender.state == .ended {
      if sender.direction == .down{
        hideSelectionView()
      }
    }
  }
  
  func viewSet(){
        backImageView.image = backgroundImg
        selectionView.clipsToBounds = true
        selectionView.layer.cornerRadius = 10.0
        selectionView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
          let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
          selectionViewConstraint.constant = safeAreaHeight + bottomPadding
        }
        dimmerView.alpha = 0

    }
    private func showSelection(){
      viewSet()
      let cellHeight:CGFloat = (univTableView.dequeueReusableCell(withIdentifier: univTableViewCell.identifier)?.frame.height)!
      self.view.layoutIfNeeded()
      if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
          let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
          selectionViewConstraint.constant = safeAreaHeight - (cellHeight * 3)
          
      }
      let showView = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
          self.view.layoutIfNeeded()
         })
      showView.addAnimations {
        self.dimmerView.alpha = 0.7
      }
        showView.startAnimation()
    }
    
    func getLineInfo(_ lineNum:Int) -> String{
      switch lineNum {
      case 2:
        return "storeImgSubwaySnu2"
        case 7 :
          return "storeImgSubwaySsu7"
        case 9 :
          return "storeImgSubwayCau9"
      default : return ""
      }
    }
  
  @IBAction func dimmerViewTapped(_ tapRecognizer : UITapGestureRecognizer){
     hideSelectionView()
  }
    
  
  private func hideSelectionView(){
    self.view.layoutIfNeeded()
    if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
    let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
      
      // move the card view to bottom of screen
    selectionViewConstraint.constant = safeAreaHeight + bottomPadding
    }
    let hideView = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
      self.view.layoutIfNeeded()
    })
    
    hideView.addAnimations {
      self.dimmerView.alpha = 0.0
    }
    
    hideView.addCompletion({
      position in
      if position == .end {
        if(self.presentingViewController != nil){
          self.dismiss(animated: false, completion: nil)
        }
      }
    })
    hideView.startAnimation()
  }
  var univInformaitons: [UnivInformations] = []
  var univInfos:[univData] = []
  func setTableView(){
    univTableView.delegate = self
    univTableView.dataSource = self
  }
    //vc.setUnivInfos()
    //print(vc.univInformations)
    //self.univInformaitons = vc.univInformations
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UnivSelectViewController:UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath)
    guard let cell = tableView.dequeueReusableCell(withIdentifier: univTableViewCell.identifier, for: indexPath) as? univTableViewCell else {
      print("failed")
      return}
    let preVC = self.presentingViewController?.children[1] // 탭바의 두번째 뷰가 서치뷰
    guard let vc = preVC as? SearchViewController else {
          print("failed")
          return
    }
    
    
    if univInfos[indexPath.row].univ_idx == myunivIndex{
      cell.selectedBox.image = UIImage(named: "storeUnivIcCheck")
      cell.selectedBox.isHidden = false
      self.univTableView.reloadData()
    }
    else {
      print("ddd")
      cell.selectedBox.isHidden = false
      vc.univIdx = univInfos[indexPath.row].univ_idx
      vc.viewDidLoad()
      vc.storeCollectionView.reloadData()
    }
    hideSelectionView()
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return (tableView.dequeueReusableCell(withIdentifier: univTableViewCell.identifier)?.frame.height)!
  }
}

extension UnivSelectViewController:UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return univInfos.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let univTableCell = tableView.dequeueReusableCell(withIdentifier: univTableViewCell.identifier, for: indexPath)as? univTableViewCell else {
      return UITableViewCell()
    }
    univTableCell.univName.text = univInfos[indexPath.row].univ_name
    univTableCell.subwayLineImg.image = UIImage(named:getLineInfo(univInfos[indexPath.row].univ_line))
    univTableCell.selectedBox.tag = indexPath.row
    univTableCell.selectedBox.image = UIImage(named: "storeUnivIcCheck")
    univTableCell.selectedBox.isHidden = true
    if univInfos[indexPath.row].univ_idx == myunivIndex{
        univTableCell.selectedBox.isHidden = false
    }
    return univTableCell
  }
}
