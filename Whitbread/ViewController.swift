//
//  ViewController.swift
//  Whitbread
//
//  Created by Antonio.Estrali on 31/08/2016.
//  Copyright © 2016 Antonio.Estrali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchResults = [Venue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: Keyboard
    
    func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
}

// MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        dismissKeyboard()
        
        guard !searchBar.text!.isEmpty else { return }
        
        FoursquareManager.sharedInstance.getVenues(searchBar.text!) { (venues) in
            
            self.searchResults.removeAll()
            self.searchResults.appendContentsOf(venues)
            
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
                self.tableView.setContentOffset(CGPointZero, animated: false)
            }
        }
    }
}

// MARK:- UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
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

