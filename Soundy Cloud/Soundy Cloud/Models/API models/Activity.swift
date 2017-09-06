//
//  Activity.swift
//  Soundy Cloud
//
//  Created by Igor on 11/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Foundation
import ObjectMapper

enum ActivityType: String {
  case track          = "track"
  case trackSharing   = "track-sharing"
  case comment        = "comment"
  case favoriting     = "favoriting"
}

struct Activity: ImmutableMappable {
  let type: ActivityType
  let creationDate: Date
  let origin: ImmutableMappable
  
  let activityTypeTransform = TransformOf<ActivityType, String>(fromJSON: { (value: String?) -> ActivityType? in
    guard let rawString = value else {
      return nil
    }
    return ActivityType(rawValue: rawString)
  }) { (value: ActivityType?) -> String? in
    guard let type = value else {
      return nil
    }
    return type.rawValue
  }
  
  init(map: Map) throws {
    type = try map.value("type", using: enumTransform())
    creationDate = try map.value("created_at", using: DateTransform())
    switch type {
    case .track:
      let track: Track = try map.value("origin")
      origin = track
    default:
      origin = try Track(JSONString: "")
    }

  }
  mutating func mapping(map: Map) {

  }

//  func originObject() throws -> Track  {
//    guard let track = origin as? Track else { throw  }
//    return track
//  }

}
