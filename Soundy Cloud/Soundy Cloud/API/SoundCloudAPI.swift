//
//  SoundCloudAPI.swift
//  Soundy Cloud
//
//  Created by Ostap Derkach on 9/6/17.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Foundation
import Moya
import Keys

// swiftlint:disable identifier_name
let SoundCloudProvider = MoyaProvider<SoundCloud>() //NetworkLoggerPlugin
// swiftlint:disable identifier_name

public enum SoundCloud {
  case getUser(Int)
  case getTrack(Int)
  case getPlaylist(Int)
}

extension SoundCloud: TargetType {
  public var baseURL: URL { return URL(string: "https://api.soundcloud.com")! }
  
  public var path: String {
    switch self {
    case .getUser(let userID):
      return "/users/\(userID)"
    case .getTrack(let trackID):
      return "/tracks/\(trackID)"
    case .getPlaylist(let playlistID):
      return "/playlists/\(playlistID)"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .getUser, .getTrack, .getPlaylist:
      return .get
    }
  }
  
  public var parameters: [String: Any]? {
    switch self {
    case .getUser, .getTrack, .getPlaylist:
      let keys = SoundyCloudKeys()
      #if DEBUG
        return ["client_id": keys.soundCloudAPIDevelopmentClient]
      #else
        return ["client_id": keys.soundCloudAPIProductionClient]
      #endif
    }
  }
  
  public var parameterEncoding: ParameterEncoding {
    return URLEncoding.default
  }
  
  public var task: Task {
    return .request
  }
  
  public var headers: [String: String]? {
    return ["Content-type": "application/json"]
  }
  
  public var sampleData: Data {
    switch self {
    case .getUser:
      return stubbedData("User")
    case .getTrack:
      return stubbedData("Track")
    case .getPlaylist:
      return stubbedData("Playlist")
    }
  }
}

// MARK: - sample data
func stubbedData(_ name: String) -> Data! {
  guard let url = Bundle.main.url(forResource: name, withExtension: "json"),
    let data = try? Data(contentsOf: url) else {
      return Data()
  }
  return data
}

// MARK: - Helpers
private extension String {
  var urlEscaped: String {
    return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
  
  var utf8Encoded: Data {
    return self.data(using: .utf8)!
  }
}
