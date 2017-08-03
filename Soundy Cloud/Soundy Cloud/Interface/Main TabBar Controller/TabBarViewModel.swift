//
//  TabBarViewModel.swift
//  Soundy Cloud
//
//  Created by Igor on 03/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//
import UIKit


protocol TabCompatible {
  func tabsUpdated(controllers: [UIViewController])
}

class TabBarViewModel {
  fileprivate var tabController : TabCompatible?
  fileprivate var tabItems : [TabItem] {
    didSet{
      guard let tabVC = tabController else {
        return
      }
      tabVC.tabsUpdated(controllers: self.viewControllers())
    }
  }
  
  init(tabController: TabCompatible, types: [TabType]) {
    self.tabController = tabController
    self.tabItems = []
    createTabItems(types: types)
  }
  
  func switchedTo(controller: UIViewController!) {
    
  }
  private func createTabItems(types: [TabType]) {
    var items = [TabItem]()
    for type in types {
      items.append(TabItem(type: type))
    }
    self.tabItems = items
  }
  private func controllerForItem(tabItem: TabItem) -> UIViewController {
    var controller : UIViewController
    switch tabItem.type {
    case .Favorites:
      controller = UIViewController(nibName: nil, bundle: nil)
      controller.view.backgroundColor = UIColor.red
    default:
      controller = UIViewController(nibName: nil, bundle: nil)
      controller.view.backgroundColor = UIColor.green
    }
    controller.tabBarItem.title = tabItem.title
    controller.tabBarItem.image = UIImage.init(named: tabItem.iconName)
    return controller
  }
  private func viewControllers() -> [UIViewController]{
    var controllers = [UIViewController]()
    for item in tabItems{
      controllers.append(controllerForItem(tabItem: item))
    }
    return controllers
  }
}
