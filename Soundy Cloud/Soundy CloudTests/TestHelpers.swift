//
//  TestHelpers.swift
//  Soundy CloudTests
//
//  Created by Ostap Derkach on 8/27/17.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Soundy_Cloud

func yearFromDate(_ date: Date) -> Int {
  let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
  return (calendar as NSCalendar).components(.year, from: date).year!
}
