//
//  MainTabBarController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController ,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
      self.delegate = self
        setTabBar()
        // Do any additional setup after loading the view.
    }
    func setTabBar() {
      self.tabBar.contentMode = .scaleAspectFill
        
        let homeStoryboard = UIStoryboard.init(name:"Home",bundle: nil)
        guard let firstTab = homeStoryboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else{return}

        firstTab.tabBarItem.title = ""
        firstTab.tabBarItem.image = UIImage(named: "btnTab1Inactive")?.withRenderingMode(.alwaysOriginal)
      firstTab.tabBarItem.selectedImage = UIImage(named: "btnTab1Active")?.withRenderingMode(.alwaysTemplate)
        
        let searchStoryboard = UIStoryboard.init(name:"Search",bundle: nil)
        guard let secondTab = searchStoryboard.instantiateViewController(identifier: "SearchViewController") as? SearchViewController else{return}

        secondTab.tabBarItem.title = ""
        secondTab.tabBarItem.image = UIImage(named: "btnTab2Inactive")?.withRenderingMode(.alwaysOriginal)
        secondTab.tabBarItem.selectedImage = UIImage(named: "btnTab2Active")?.withRenderingMode(.alwaysTemplate)
        
        let orderStoryboard = UIStoryboard.init(name:"Order",bundle: nil)
        guard let thirdTab = orderStoryboard.instantiateViewController(identifier: "OrderViewController") as? UINavigationController else{return}
      
        thirdTab.tabBarItem.title = ""
        thirdTab.tabBarItem.image = UIImage(named: "btnTab3")?.withRenderingMode(.alwaysOriginal)
        //thirdTab.tabBarItem.selectedImage = UIImage(named: "btnTab3Active")?.withRenderingMode(.alwaysTemplate)
        
        let statusStoryboard = UIStoryboard.init(name:"StatusHs",bundle: nil)
        guard let fourthTab = statusStoryboard.instantiateViewController(identifier: "StatusViewController") as? StatusHsViewController else{return}
        
        fourthTab.tabBarItem.title = ""
        fourthTab.tabBarItem.image = UIImage(named: "btnTab4Inactive")?.withRenderingMode(.alwaysOriginal)
        fourthTab.tabBarItem.selectedImage = UIImage(named: "btnTab4Active")?.withRenderingMode(.alwaysTemplate)

        let myPageStoryboard = UIStoryboard.init(name:"MyPageHs",bundle: nil)
        guard let fifthTab = myPageStoryboard.instantiateViewController(identifier: "MyPageHsViewController") as? MyPageHsViewController else{return}

        fifthTab.tabBarItem.title = ""
        fifthTab.tabBarItem.image = UIImage(named: "btnTab5Inactive")?.withRenderingMode(.alwaysOriginal)
        fifthTab.tabBarItem.selectedImage = UIImage(named: "btnTab5Active")?.withRenderingMode(.alwaysTemplate)

        let tabs = [firstTab, secondTab, thirdTab,fourthTab,fifthTab]
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = firstTab

    }
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    let itemIndex = tabBarController.selectedIndex
    if(itemIndex == 2){
      tabBarController.tabBar.isHidden = true
    }
    else{
      tabBarController.tabBar.isHidden = false
    }
  }
    /*
    // MARK: - Navigation
CategoryVC
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
