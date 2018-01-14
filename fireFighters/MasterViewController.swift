//  Created by Joe Wijoyo on 1/13/18.
//  Copyright © 2018 Joe Wijoyo. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchFooter: SearchFooter!
    
    var filteredItems = [Items]()
    
    var detailViewController: DetailViewController? = nil
    var items = [Items]()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Items"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        items = [
            Items(category:"Clothing", name:"Denim Jacket"),
            Items(category:"Clothing", name:"Jeans"),
            Items(category:"Clothing", name:"Nike Shoes"),
            Items(category:"Bedroom", name:"Bedframe"),
            Items(category:"Bedroom", name:"Mattress"),
            Items(category:"Living Room", name:"Television"),
            Items(category:"Living Room", name:"Table"),
            Items(category:"Living Room", name:"Couch"),
            Items(category:"Living Room", name:"Carpet"),
            Items(category:"Kitchen", name:"Table"),
            Items(category:"Kitchen", name:"Chair"),
            Items(category:"Kitchen", name:"Knife Set"),
            Items(category:"Technology", name:"Macbook Air"),
            Items(category:"Technology", name:"Google Home"),
            Items(category:"Garage", name:"Refrigerator")
        ]
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if splitViewController!.isCollapsed {
            if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
                self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
            }
        }
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredItems.count
        }
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item: Items
        if isFiltering() {
            item = filteredItems[indexPath.row]
        } else {
            item = items[indexPath.row]
        }
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = item.category
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let item: Items
                if isFiltering() {
                    item = filteredItems[indexPath.row]
                } else {
                    item = items[indexPath.row]
                }
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItems = item
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredItems = items.filter({( item : Items) -> Bool in
            return item.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension MasterViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
