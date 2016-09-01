//
//  VenueListDataProvider.swift
//  Whitbread
//
//  Created by Antonio.Estrali on 01/09/2016.
//  Copyright © 2016 Antonio.Estrali. All rights reserved.
//

import UIKit

/**
 *  Decouples DataSource and Delegate from ViewController
 */
class VenueListDataProvider: NSObject {
    
    var searchResults = [Venue]()
}

// MARK:- UITableViewDataSource

extension VenueListDataProvider: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VenueCell", forIndexPath: indexPath) as! VenueCell
        
        let venue = searchResults[indexPath.row]
        
        // Configure cell
        cell.nameLabel.text = venue.name
        cell.addressLabel.text = venue.address
        
        return cell
    }
}
