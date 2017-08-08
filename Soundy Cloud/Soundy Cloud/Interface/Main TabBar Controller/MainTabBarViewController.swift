//
//  MainTabBarViewController.swift
//  Soundy Cloud
//
//  Created by Igor on 03/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
  var viewModel: TabBarViewModel!
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    viewModel = TabBarViewModel(tabController: self, types:[.favorites, .list, .player, .profile])
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    viewModel = TabBarViewModel(tabController: self, types:[.favorites, .list, .player, .profile])
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
extension MainTabBarViewController : TabCompatible {
  func tabsUpdated(controllers: [UIViewController]) {
    self.viewControllers = controllers
  }
}
extension MainTabBarViewController : UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
  }
}
