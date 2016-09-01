//
//  VenueParserTests.swift
//  Whitbread
//
//  Created by Antonio.Estrali on 01/09/2016.
//  Copyright © 2016 Antonio.Estrali. All rights reserved.
//

import XCTest
@testable import Whitbread

class VenueParserTests: XCTestCase {

    func test_parseEmptyDataReturnsEmptyArray() {
        let emptyVenues = VenueParser.parseVenuesFromJSON([:])
        XCTAssertNotNil(emptyVenues, "venues should not be nil")
        XCTAssertEqual(emptyVenues.count, 0, "venues count should be 0")
    }
    
    func test_parseWrongDataReturnsEmptyArray() {
        let venuesDict = ["wrong" : "data"]
        let venues = VenueParser.parseVenuesFromJSON(venuesDict)
        XCTAssertNotNil(venues, "venues should not be nil")
        XCTAssertEqual(venues.count, 0, "venues count should be 0")
    }
    
    func test_parseOneVenueSetNameAndAddress() {
        let venuesDict = ["venues" : [
            ["name" : "Test name",
             "location" : ["address" : "Test address"]]
        ]]
        let venues = VenueParser.parseVenuesFromJSON(venuesDict)
        XCTAssertNotNil(venues, "venues should not be nil")
        XCTAssertEqual(venues.count, 1, "venues count should be 1")
        
        let venue = venues[0]
        XCTAssertEqual(venue.name, "Test name", "name should be Test name")
        XCTAssertEqual(venue.address, "Test address", "address should be Test address")
    }
}
