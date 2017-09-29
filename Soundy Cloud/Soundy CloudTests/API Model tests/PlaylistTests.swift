//
//  PlaylistTests.swift
//  Soundy CloudTests
//
//  Created by Ostap Derkach on 8/25/17.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Quick
import Nimble
import Fakery
import ObjectMapper

@testable import Soundy_Cloud

class PlaylistTests: QuickSpec {
  
  // swiftlint:disable:next function_body_length
  override func spec() {
    it("convers from JSON") {
      let faker = Faker()
      let trackDict = ["id": 13158665,
                       "user_id": 3699101,
                       "title": "Munching at Tiannas house",
                       "description": NSNull(),
                       "duration": 18109,
                       "genre": NSNull(),
                       "track_type": "recording",
                       "release_year": NSNull(),
                       "release_month": NSNull(),
                       "release_day": NSNull(),
                       "streamable": true,
                       "downloadable": true,
                       "user": ["id": 123, "username": "jokn dou"]] as [String : Any]
      
      //      let tracks: [Track]
      let playlistId = faker.number.randomInt()
      let creationDate = "2009/08/13 18:30:10 +0000"
      let title = faker.lorem.word()
      let description = faker.lorem.sentence()
      let duration = faker.number.randomInt()
      let genre = faker.lorem.word()
      let streamable = faker.number.randomBool()
      let downloadable = faker.number.randomBool()
      let type = PlaylistType.album
      
      let jsonData = ["id": playlistId,
                      "created_at": creationDate,
                      "user": ["id": 123, "username": "jokn dou"],
                      "label": ["id": 123],
                      "title": title,
                      "description": description,
                      "duration": duration,
                      "genre": genre,
                      "streamable": streamable,
                      "downloadable": downloadable,
                      "type": type.rawValue,
                      "tracks": [trackDict]] as [String : Any]
      
      var playlist: Playlist
      do {
        playlist = try Playlist(JSON: jsonData)
      } catch {
        if let mapError = error as? MapError {
          XCTAssertTrue(false, mapError.description)
        } else {
          XCTAssertTrue(false, error.localizedDescription)
        }
        return
      }
      expect(playlist.playlistId) == playlistId
      expect(yearFromDate(playlist.creationDate)) == 2009
      expect(playlist.title) == title
      expect(playlist.description) == description
      expect(playlist.duration) == duration
      expect(playlist.genre) == genre
      expect(playlist.streamable) == streamable
      expect(playlist.downloadable) == downloadable
      expect(playlist.type) == type
      expect(playlist.tracks).to(haveCount(1))
    }
  }
}
