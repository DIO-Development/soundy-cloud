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
extension TabCompatible {
  func tabsUpdated(controllers: [UIViewController]) { }
  
}
class TabBarViewModel {
  fileprivate var tabController: TabCompatible?
  fileprivate(set) public var tabItems: [TabItem] {
    didSet {
      self.viewControllers =  self.createViewControllers()
    }
  }
  fileprivate var viewControllers: [UIViewController]? {
    didSet {
      guard let items = viewControllers else { return }
      guard let tabVC = tabController else {
        return
      }
      tabVC.tabsUpdated(controllers: items)
    }
  }
  // MARK: - Methods -
  init(tabController: TabCompatible, types: [TabType]) {
    self.tabController = tabController
    self.tabItems = []
    createTabItems(types: types)
  }
  func switchedTo(_ type: TabType) {
    
  }
  func deleteTab(_ type: TabType) {
    
  }
  
  // MARK: - Private -
  private func createTabItems(types: [TabType]) {
    var items = [TabItem]()
    for type in types {
      items.append(TabItem(type: type))
    }
    self.tabItems = items
  }
  private func controllerForItem(tabItem: TabItem) -> UIViewController {
    var controller: UIViewController
    switch tabItem.type {
    case .favorites:
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
  private func createViewControllers() -> [UIViewController] {
    var controllers = [UIViewController]()
    for item in tabItems {
      controllers.append(controllerForItem(tabItem: item))
    }
    return controllers
  }
}
