//
//  TabItem.swift
//  Soundy Cloud
//
//  Created by Igor on 03/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Foundation

enum TabType {
  case list
  case profile
  case player
  case favorites
}

struct TabItem {
  let type: TabType
  var title: String! = ""
  var iconName: String! = ""
  init(type: TabType, title: String!, iconName: String!) {
    self.type = type
    self.title = title
    self.iconName = iconName
  }
  init(type: TabType) {
    switch type {
    case .favorites:
      self.init(type: type,
                title: NSLocalizedString("Favorites",
                                         tableName: "tabNames",
                                         bundle: Bundle.main,
                                         value: "Favorites",
                                         comment: ""),
                iconName: "tabIconFavorite")
    case .list:
      self.init(type: type,
                title: NSLocalizedString("List",
                                         tableName: "tabNames",
                                         bundle: Bundle.main,
                                         value: "List",
                                         comment: ""),
                iconName: "tabIconNameList")
    case .player:
      self.init(type: type,
                title: NSLocalizedString("Player",
                                         tableName: "tabNames",
                                         bundle: Bundle.main,
                                         value: "Player",
                                         comment: ""),
                iconName: "tabIconPlayer")
    case .profile:
      self.init(type: type,
                title: NSLocalizedString("Profile",
                                         tableName: "tabNames",
                                         bundle: Bundle.main,
                                         value: "Profile",
                                         comment: ""),
                iconName: "tabIconProfile")
      //    default:
      //      assert(false, "Unknown TabType")
    }
  }
}
