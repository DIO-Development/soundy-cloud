//
//  UserTests.swift
//  Soundy CloudTests
//
//  Created by Igor on 21/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Quick
import Nimble
import Fakery
import ObjectMapper

@testable import Soundy_Cloud

class UserTests: QuickSpec {

  override func spec() {
    it("converts from JSON") {
      let faker = Faker()

      let userId = faker.number.randomInt()
      let username = faker.name.name()
      let country = faker.address.country()
      let fullName = faker.name.name()
      // let avatarURL: URL
      let city = faker.address.city()
      let description = faker.lorem.sentence()
      let website = faker.internet.url()
      let online = faker.number.randomBool()§
      let trackCount = faker.number.randomInt()
      let playlistCount = faker.number.randomInt()
      let followersCount = faker.number.randomInt()
      let followingsCount = faker.number.randomInt()
      let publicFavoritesCount = faker.number.randomInt()
      
      let jsonData = ["id" : userId,
                      "username" : username,
                      "country" : country,
                      "full_name" : fullName,
                      "city" : city,
                      "description" : description,
                      "website" : website,
                      "online" : online,
                      "track_count" : trackCount,
                      "playlist_count" : playlistCount,
                      "followers_count" : followersCount,
                      "followings_count" : followingsCount,
                      "public_favorites_count" : publicFavoritesCount] as [String : Any]
      
      var user : User
      do{
        user = try User(JSON: jsonData)
      }
      catch{
        if let mapError = error as? MapError {
          XCTAssertTrue(false, mapError.description)
        }
        else {
          XCTAssertTrue(false, error.localizedDescription)
        }
        return
      }
      expect(user.userId) == userId
      expect(user.username) == username
      expect(user.country) == country
      expect(user.fullName) == fullName
      expect(user.city) == city
      expect(user.description) == description
      expect(user.website) == website
      expect(user.online) == online
      expect(user.trackCount) == trackCount
      expect(user.playlistCount) == playlistCount
      expect(user.followersCount) == followersCount
      expect(user.followingsCount) == followingsCount
      expect(user.publicFavoritesCount) == publicFavoritesCount

      
    }
  }
}
