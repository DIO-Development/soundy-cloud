//
//  Track.swift
//  Soundy Cloud
//
//  Created by Igor on 10/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Foundation
import ObjectMapper

enum TrackType: String {
  case original     = "original"
  case remix        = "remix"
  case live         = "live"
  case recording    = "recording"
  case spoken       = "spoken"
  case podcast      = "podcast"
  case demo         = "demo"
  case inProgress   = "in progress"
  case stem         = "stem"
  case loop         = "loop"
  case soundEffect  = "sound effect"
  case sample       = "sample"
  case other        = "other"
}

struct Track: ImmutableMappable {
  
  let trackId: Int
  let userId: Int
  let user: User
  let label: Label?
  let title: String
  let description: String?
  let duration: Int
  let genre: String?
  let type: TrackType
  //let artworkURL: URL //TODO: the link is for a large image - so we need to make it possible to adjust it
  let releaseDate: Date?
//  let tags: [String]
//  let hiddenTags: [String]
  //let permanentURL: URL
  //let sharing: Visibility
  let streamable: Bool
  let downloadable: Bool

  init(map: Map) throws {

    trackId = try map.value("id")
    userId = try map.value("user_id")
    user = try map.value("user")
    label = try? map.value("label")
    title = try map.value("title")
    description = try? map.value("description")
    duration = try map.value("duration")
    genre = try? map.value("genre")
    type = try map.value("track_type", using: enumTransform())
    //permanentURL = try map.value("permalink_url")
    let day: Int? = try? map.value("release_day")
    let month: Int? = try? map.value("release_month")
    let year: Int? = try? map.value("release_year")
    var components = DateComponents()
    components.day = day
    components.month = month
    components.year = year
    releaseDate = Calendar(identifier: .gregorian).date(from: components)
    
//    tags = try map.value("tags")//TODO: separate tags and hidden tags
//    hiddenTags = try map.value("tags")//TODO: separate tags and hidden tags
    streamable = try map.value("streamable")
    downloadable = try map.value("downloadable")
  }
  mutating func mapping(map: Map) {
    
  }
}
