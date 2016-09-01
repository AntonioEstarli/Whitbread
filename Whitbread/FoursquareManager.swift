//
//  FoursquareManager.swift
//  Whitbread
//
//  Created by Antonio.Estrali on 31/08/2016.
//  Copyright © 2016 Antonio.Estrali. All rights reserved.
//

import QuadratTouch

typealias VenueCompletionHandler = (venues: [Venue]) -> Void

private struct Constants {
    struct Client {
        static let ID = "SDCLZCRXW44TTDQRQHBP3OL2F0CGOPJGIUVRH5W5BABOTFCT"
        static let secret = "KSOBMOJBP2ZKZWPRUY2GQLQ0SWPNOA0CUL3WY3OL3RWAPAOB"
    }
}

/**
 *  Utility class to deal with Foursquare
 */
class FoursquareManager {
    
    static let sharedInstance = FoursquareManager()
    var session:Session?
    var searchTask:Task?
    
    //MARK:- Iniatializer
    
    init()
    {
        // Setup Foursquare session
        let client = Client(clientID: Constants.Client.ID,
                            clientSecret: Constants.Client.secret,
                            redirectURL: "")
        
        let configuration = Configuration(client:client)
        Session.setupSharedSessionWithConfiguration(configuration)
        
        self.session = Session.sharedSession()
    }
    
    //MARK:-
    
    func getVenues(place: String, completionHandler: VenueCompletionHandler) {
        
        // cancel previous task if any
        if searchTask != nil {
            searchTask!.cancel()
        }
        
        let parameters = [Parameter.near:place]
        searchTask = self.session!.venues.search(parameters) {
            (result) in
            if let response = result.response {
                
                // parse response into array of venues
                let venues = VenueParser.parseVenuesFromJSON(response)
                
                completionHandler(venues: venues)
            }
        }
        searchTask!.start()
    }
}