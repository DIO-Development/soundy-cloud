//
//  Transforms.swift
//  Soundy Cloud
//
//  Created by Igor on 15/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Foundation
import  ObjectMapper

// swiftlint:disable:next line_length
func enumTransform<EnumType: RawRepresentable>(test: EnumType? = nil) -> TransformOf<EnumType, String> where EnumType.RawValue == String {
  return TransformOf<EnumType, String>(fromJSON: { (value: String?) -> EnumType? in
    guard let rawString = value else {
      return nil
    }
    return EnumType(rawValue: rawString)
  }) {(value: EnumType?) -> String? in
    guard let type = value else {
      return nil
    }
    return type.rawValue
  }
}
