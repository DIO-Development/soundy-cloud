//
//  SoundCloudAPITest.swift
//  Soundy CloudTests
//
//  Created by Ostap Derkach on 9/6/17.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Quick
import Nimble
import Moya
import ObjectMapper
import Moya_ObjectMapper
@testable import Soundy_Cloud

class SoundCloudAPITest: QuickSpec {
  
  override func spec() {
    var provider: MoyaProvider<SoundCloud>!
    beforeEach {
      provider = MoyaProvider<SoundCloud>(stubClosure: MoyaProvider.immediatelyStub)
    }
    
    describe("provider") {
      it("not nill") {
        expect(provider).toNot(beNil())
      }
    }
    
    describe("getUser request") {
      it("user should not be nill") {
        
        let target: SoundCloud = .getUser(1)
        provider.request(target) { result in
          if case let .success(response) = result {
            expect(response.data).toNot(beNil())
            
            let user = try? response.mapObject(User.self)
            expect(user).toNot(beNil())
          }
        }
      }
    }
    
    describe("getTrack") {
      it("track should not be nil") {
        let target: SoundCloud = .getTrack(1)
        provider.request(target) { result in
          if case let .success(response) = result {
            expect(response.data).toNot(beNil())
            
            let track = try? response.mapObject(Track.self)
            expect(track).toNot(beNil())
          }
        }
      }
    }
    
    describe("getPlaylist") {
      it("playlist should not be nil") {
        let target: SoundCloud = .getPlaylist(1)
        provider.request(target) { result in
          if case let .success(response) = result {
            expect(response.data).toNot(beNil())
            
            let playlist = try? response.mapObject(Playlist.self)
            expect(playlist).toNot(beNil())
          }
        }
      }
    }
    
  }
}
