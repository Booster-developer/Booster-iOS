//
//  LogInViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func logInButtonClicked(_ sender: Any) {
        let tabBarStoryboard = UIStoryboard.init(name: "mainTab", bundle: nil)
        guard let mainTab = tabBarStoryboard.instantiateViewController(identifier: "TabBarController") as? MainTabBarController else { return}
        mainTab.modalPresentationStyle = .fullScreen
        self.present(mainTab, animated: true, completion: nil)
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
