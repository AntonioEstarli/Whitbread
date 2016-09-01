//
//  VenueTests.swift
//  Whitbread
//
//  Created by Antonio.Estrali on 31/08/2016.
//  Copyright © 2016 Antonio.Estrali. All rights reserved.
//

import XCTest
@testable import Whitbread

class VenueTests: XCTestCase {

    func testInit_ShouldTakeNameAndAddress() {
        let venue = Venue(name: "Test name", address: "Test Address")
        XCTAssertNotNil(venue, "venue should not be nil")
    }
    
    func testInit_ShouldSetNameAndAddress() {
        let venue = Venue(name: "Test name", address: "Test Address")
        XCTAssertEqual(venue.name , "Test name",
                       "Initializer should set the venue name")
        XCTAssertEqual(venue.address , "Test Address",
                       "Initializer should set the venue address")
    }

}
