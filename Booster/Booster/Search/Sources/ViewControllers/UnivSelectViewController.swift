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
    
    var backgroundImg: UIImage?
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
          
          // when card state is normal, its top distance to safe area is
          // (safe area height + bottom inset) / 2.0
          selectionViewConstraint.constant = (safeAreaHeight + bottomPadding) / 2.0
        }
        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
           self.view.layoutIfNeeded()
         })
        showCard.addAnimations {
            self.dimmerView.alpha = 0.7
        }
        showCard.startAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSet()
        showSelection()
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
