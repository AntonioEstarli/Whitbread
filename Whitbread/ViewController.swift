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
    var dataProvider: VenueListDataProvider!
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self,
                                                action: #selector(ViewController.dismissKeyboard))
        return recognizer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up data provider
        dataProvider = VenueListDataProvider()
        tableView.dataSource = dataProvider
        
        // set up table view
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
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
            
            // update data
            self.dataProvider.searchResults.removeAll()
            self.dataProvider.searchResults.appendContentsOf(venues)
            
            // reload table view
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
                self.tableView.setContentOffset(CGPointZero, animated: false)
            }
        }
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapRecognizer)
    }
}
