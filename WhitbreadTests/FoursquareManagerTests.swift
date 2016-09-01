//
//  FoursquareManagerTests.swift
//  Whitbread
//
//  Created by Antonio.Estrali on 01/09/2016.
//  Copyright © 2016 Antonio.Estrali. All rights reserved.
//

import XCTest
@testable import Whitbread

class FoursquareManagerTests: XCTestCase {

    func test_getVenuesEmptyParameterShouldReturnEmptyArray() {
        
        let expectation = self.expectationWithDescription("Venues fetched")
        
        FoursquareManager.sharedInstance.getVenues("") { (venues) in
            
            XCTAssertNotNil(venues, "venues should not be nil")
            XCTAssertEqual(venues.count, 0, "venues count should be 0")
            
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(3) { (error: NSError?) in
            if error != nil {
                print("getVenues error: \(error?.localizedDescription)")
            }
        }
    }
    
    func test_getVenuesBadParameterShouldReturnEmptyArray() {
        
        let expectation = self.expectationWithDescription("Venues fetched")
        
        FoursquareManager.sharedInstance.getVenues("hdiy") { (venues) in
            
            XCTAssertNotNil(venues, "venues should not be nil")
            XCTAssertEqual(venues.count, 0, "venues count should be 0")
            
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(3) { (error: NSError?) in
            if error != nil {
                print("getVenues error: \(error?.localizedDescription)")
            }
        }
    }
    
    func test_getVenuesGoodParameterShouldReturnArrayOfVenues() {
        
        let expectation = self.expectationWithDescription("Venues fetched")
        
        FoursquareManager.sharedInstance.getVenues("barcelona") { (venues) in
            
            XCTAssertNotNil(venues, "venues should not be nil")
            XCTAssertGreaterThan(venues.count, 0, "venues count should be > 0")
            
            let venue = venues[0]
            
            XCTAssertNotNil(venue, "venue should not be nil")
            XCTAssertNotNil(venue.name, "venue name should not be nil")
            XCTAssertNotNil(venue.address, "venue addresss should not be nil")
            
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(3) { (error: NSError?) in
            if error != nil {
                print("getVenues error: \(error?.localizedDescription)")
            }
        }
    }

}
