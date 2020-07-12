//
//  UnivSelectViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class UnivSelectViewController: UIViewController {

    

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var dimmerView: UIView!
    @IBOutlet weak var selectionViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var selectionView: UIView!
  @IBOutlet weak var downDarggableView: UIView!
  
    var backgroundImg: UIImage?
  
  
  @IBOutlet weak var univTableView: UITableView!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      setTableView()
      showSelection()
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
  private var univInformaitons: [UnivInformations] = []
  
  func setTableView(){
    univTableView.delegate = self
    univTableView.dataSource = self
    setUnivInfos()
    
  }
  func setUnivInfos(){
    let univ1 = UnivInformations(univIdx: 0, univName: "숭실대학교",univAddress: "숭실대학교주소", univLine: .line7)
    let univ2 = UnivInformations(univIdx: 1, univName: "중앙대학교",univAddress: "중앙대주소", univLine: .line9)
    let univ3 = UnivInformations(univIdx: 2, univName: "서울대학교",univAddress: "서울대주소", univLine: .line2)
    
    self.univInformaitons = [univ1,univ2,univ3]

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
extension UnivSelectViewController:UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

  let preVC = self.presentingViewController?.children[1] // 탭바의 두번째 뷰가 서치뷰
  guard let vc = preVC as? SearchViewController else {
        print("failed")
        return
  }
    print(indexPath)
    guard let cell = tableView.dequeueReusableCell(withIdentifier: univTableViewCell.identifier, for: indexPath) as? univTableViewCell else {
      print("failed")
      return}
    
    for index in 0..<univInformaitons.count{
      univInformaitons[index].isMyUniv = false
    }
    univInformaitons[indexPath.row].isMyUniv = !univInformaitons[indexPath.row].isMyUniv
    if (univInformaitons[indexPath.row].isMyUniv){
      cell.selectedBox.image = UIImage(named: "done24Px")
      cell.selectedBox.alpha = 1.0
      
      //Post 매장 list
      //vc.GetstoreInformation()
      hideSelectionView()
    }
    vc.univNameButton.setTitle(univInformaitons[indexPath.row].univName, for: .normal)

  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return (tableView.dequeueReusableCell(withIdentifier: univTableViewCell.identifier)?.frame.height)!
  }
}

extension UnivSelectViewController:UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return univInformaitons.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let univTableCell = tableView.dequeueReusableCell(withIdentifier: univTableViewCell.identifier, for: indexPath)as? univTableViewCell else {
      return UITableViewCell()
    }
    univTableCell.univName.text = univInformaitons[indexPath.row].univName
    univTableCell.subwayLineImg.image = UIImage(named: univInformaitons[indexPath.row].univLine.getLineNum())
    univTableCell.selectedBox.tag = indexPath.row    
    univTableCell.selectedBox.alpha = 0
    if indexPath.row == 0 {
      univTableCell.selectedBox.alpha = 1
    }
    return univTableCell
  }
}
