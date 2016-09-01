//
//  VenueParser.swift
//  Whitbread
//
//  Created by Antonio.Estrali on 31/08/2016.
//  Copyright © 2016 Antonio.Estrali. All rights reserved.
//

/**
 *  Utility class to parse a JSON response into Venues
 */
class VenueParser {
    
    class func parseVenuesFromJSON(object: [String:AnyObject]) -> [Venue] {
        
        var venuesToReturn = [Venue]()
        
        guard let venues = object["venues"] as? [[String: AnyObject]] else {
            return venuesToReturn
        }
        
        for venue in venues {
            guard let name = venue["name"] as? String,
                  let location = venue["location"] as? [String: AnyObject],
                  let address = location["address"] as? String else {
                    return venuesToReturn
            }
            
            venuesToReturn.append(Venue(name: name, address: address))
        }
        
        return venuesToReturn
    }
}
