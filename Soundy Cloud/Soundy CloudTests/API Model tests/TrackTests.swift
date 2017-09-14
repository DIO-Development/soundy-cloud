//
//  APIModelTests.swift
//  Soundy CloudTests
//
//  Created by Igor on 15/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Fakery
import ObjectMapper

@testable import Soundy_Cloud

class TrackTests: QuickSpec {
  
  override func spec() {
    
    it("converts from JSON") {
      let faker = Faker()
      
      let trackId = faker.number.randomInt()
      let userId = faker.number.randomInt()
      let title = faker.lorem.words(amount: 3)
      let description = faker.lorem.sentence()
      let duration = faker.number.randomInt()
      let genre = faker.lorem.word()
      let type = TrackType.original
      let streamable = faker.number.randomBool()
      let downloadable = faker.number.randomBool()
      
      let jsonData = ["id": trackId,
                      "user": ["id": 123, "username": "jokn dou"],
                      "label": ["id": 123],
                      "user_id": userId,
                      "title": title,
                      "description": description,
                      "duration": duration,
                      "genre": genre,
                      "track_type": type.rawValue,
                      "streamable": streamable,
                      "downloadable": downloadable] as [String : Any]
      var track: Track
      do {
        track = try Track(JSON: jsonData)
      } catch {
        if let mapError = error as? MapError {
          XCTAssertTrue(false, mapError.description)
        } else {
          XCTAssertTrue(false, error.localizedDescription)
        }
        return
      }
     
      expect(track.trackId) == trackId
      expect(track.userId) == userId
      expect(track.title) == title
      expect(track.description) == description
      expect(track.duration) == duration
      expect(track.genre) == genre
      expect(track.type) == type
      expect(track.streamable) == streamable
      expect(track.downloadable) == downloadable
    }
  }
  
//    func testTrackParsing() {
//      let testBundle = Bundle(for: type(of: self))
//      guard let sampleDataPath = testBundle.path(forResource: "Track", ofType: "json") else {
//        XCTAssert(false, "Sample file not found")
//        return
//      }
//      do {
//        let jsonString = try String(contentsOfFile: sampleDataPath)
//        let track = try Track(JSONString: jsonString)
//      } catch {
//        XCTAssert(false, "Sample file not loaded")
//      }
//      // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
    
}
