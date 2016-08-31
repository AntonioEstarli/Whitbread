//
//  FoursquareManager.swift
//  Whitbread
//
//  Created by Antonio.Estrali on 31/08/2016.
//  Copyright © 2016 Antonio.Estrali. All rights reserved.
//

import QuadratTouch

private struct Constants {
    struct Client {
        static let ID = "SDCLZCRXW44TTDQRQHBP3OL2F0CGOPJGIUVRH5W5BABOTFCT"
        static let secret = "KSOBMOJBP2ZKZWPRUY2GQLQ0SWPNOA0CUL3WY3OL3RWAPAOB"
    }
}

class FoursquareManager
{
    static let sharedInstance = FoursquareManager()
    var session:Session?
    
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
    
    //MARK: - 
    
    // quick test
    func testAPI() {

        var parameters = [Parameter.query:"Burgers"]
        parameters += [Parameter.near:"Massachusetts"]
        //parameters += self.location.parameters()
        let searchTask = self.session!.venues.search(parameters) {
            (result) -> Void in
            if let response = result.response {
                print("response: \(response)")
                //self.venues = response["venues"] as [JSONParameters]?
            }
        }
        searchTask.start()
    }
}