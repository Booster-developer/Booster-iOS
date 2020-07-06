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

      viewSet()
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
      self.view.layoutIfNeeded()
      if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
          let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
          selectionViewConstraint.constant = safeAreaHeight - 235
          
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
  
  func setTableView(){
    univTableView.delegate = self
    univTableView.dataSource = self
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
    
    vc.univNameButton.setTitle(cell.univName.text, for: .normal)
    cell.selectedBox.alpha = 1.0
    //Post 매장 list
    //vc.GetstoreInformation()
    hideSelectionView()

  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 65.5
  }
}

extension UnivSelectViewController:UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let univTableCell = tableView.dequeueReusableCell(withIdentifier: univTableViewCell.identifier, for: indexPath)as? univTableViewCell else {
      return UITableViewCell()
    }
    univTableCell.selectedBox.tag = indexPath.row    
    univTableCell.selectedBox.alpha = 0
    return univTableCell
  }
}
