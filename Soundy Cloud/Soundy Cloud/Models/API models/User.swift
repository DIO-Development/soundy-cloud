//
//  User.swift
//  Soundy Cloud
//
//  Created by Igor on 10/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: ImmutableMappable {
  
  let userId: Int
  let username: String
  let country: String?
  let fullName: String?
 // let avatarURL: URL
  let city: String?
  let description: String?
  let website: String?
  let online: Bool?
  let trackCount: Int?
  let playlistCount: Int?
  let followersCount: Int?
  let followingsCount: Int?
  let publicFavoritesCount: Int?
  
  init(map: Map) throws {
    userId = try map.value("id")
    username = try map.value("username")
    country = try? map.value("country")
    fullName = try? map.value("full_name")
    //avatarURL = try map.value("avatar_url")
    city = try? map.value("city")
    description = try? map.value("description")
    website = try? map.value("website")
    online = try? map.value("online")
    trackCount = try? map.value("track_count")
    playlistCount = try? map.value("playlist_count")
    followersCount = try? map.value("followers_count")
    followingsCount = try? map.value("followings_count")
    publicFavoritesCount = try? map.value("public_favorites_count")
  }
  
  func mapping(map: Map) {
    
  }
}
