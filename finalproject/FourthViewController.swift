//
//  FourthViewController.swift
//
//
//  Created by TYanna Morrison on 11/25/18.
//  Copyright © 2018 TYanna Morrison. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let firstTab = self.tabBarController?.viewControllers?[0] as! FirstViewController
        return firstTab.favoritesEventName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        let firstTab = self.tabBarController?.viewControllers?[0] as! FirstViewController
        cell.textLabel?.text = firstTab.favoritesEventName[indexPath.row]
        cell.detailTextLabel?.text = firstTab.favoritesEventLocation[indexPath.row]
        
        return cell
    }
    
    
    // remove eveything in the shoppingList array
    //fourthTab.shoppingList.removeAll()
    // reload the list
    //firstTab.myTableView.reloadData()
    
}
