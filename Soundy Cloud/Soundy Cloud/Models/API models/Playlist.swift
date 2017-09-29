//
//  Playlist.swift
//  Soundy Cloud
//
//  Created by Igor on 14/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Foundation
import ObjectMapper

enum PlaylistType: String {
  case epSingle       = "ep single"
  case album          = "album"
  case compilation    = "compilation"
  case projectFiles   = "project files"
  case archive        = "archive"
  case showcase       = "showcase"
  case demo           = "demo"
  case samplePack     = "sample pack"
  case other          = "other"
}

struct Playlist: ImmutableMappable {
  
  let playlistId: Int
  let creationDate: Date
  let owner: User
  let label: Label?
  let title: String
  let description: String
  let duration: Int
  let genre: String?
  let streamable: Bool
  let downloadable: Bool
  let type: PlaylistType
  let tracks: [Track]
  
  init(map: Map) throws {
     playlistId = try map.value("id")
     creationDate = try map.value("created_at", using: CustomDateFormatTransform(formatString: "yyyy-MM-dd HH:mm:ss Z"))
     owner = try map.value("user")
     label = try? map.value("label")
     title = try map.value("title")
     description = try map.value("description")
     duration = try map.value("duration")
     genre = try? map.value("genre")
     streamable = try map.value("streamable")
     downloadable = try map.value("downloadable")
     type = try map.value("type", using: enumTransform())
     tracks = try map.value("tracks")
    
  }
  mutating func mapping(map: Map) {
  
  }
}
