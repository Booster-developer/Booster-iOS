//
//  SearchViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBAction func selectUniv(_ sender: Any) {
        guard let univSelect = self.storyboard?.instantiateViewController(identifier: "UnivSelectViewController", creator: nil) as? UnivSelectViewController else { return}
        univSelect.modalPresentationStyle = .fullScreen
        
        univSelect.backgroundImg = self.tabBarController?.view.asImage()
        self.present(univSelect,animated: false, completion: nil)
    }
//    @objc func onClickTransparentView() {
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0,options: .curveEaseInOut, animations: {self.transparentView.alpha=0
//            self.univSelectionTableHeight.constant = 0
//        }, completion: nil)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
