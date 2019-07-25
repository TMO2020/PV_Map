//
//  FirstViewController.swift
//  
//
//  Created by TYanna Morrison on 11/21/18.
//  Copyright © 2018 TYanna Morrison. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var eventName:[String] = []
    var eventLocation:[String] = []
    var eventDate:[String] = []
    var favoritesEventName:[String] = []
    var favoritesEventLocation:[String] = []
    var favoritesEventDate:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eventName = ["Company Info Session", "Resume Critique", "Basketball Tournament"]
        eventLocation = ["Enginneering", "engineering", "Recreation Center"]
        eventDate = ["12/02/2018", "12/04/2018", "12/06/2018"]
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventName.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        cell.textLabel?.text = eventName[indexPath.row]
        cell.detailTextLabel?.text = eventLocation[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor.cyan //UIColor.red
        } else {
            cell.contentView.backgroundColor = UIColor.yellow //UIColor.lightGray
        }
        
        return cell
        
    }
    
  
    
    // method to run when table view cell is tapped --- delete the item
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("You tapped cell number \(indexPath.row).")
      //  let cell = tableView.dequeueReusableCell(withIdentifier: "cellReusueIdentifier")!
        
      //  cell.contentView.backgroundColor = UIColor.yellow
        //myTableView.reloadData()
     //   return
   // }
   
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let fourthTab = self.tabBarController?.viewControllers?[2] as! FourthViewController
        if let cell = tableView.cellForRow(at: indexPath) {
                favoritesEventName = favoritesEventName.filter {$0 != eventName[indexPath.row]}
            favoritesEventLocation = favoritesEventLocation.filter {$0 != eventName[indexPath.row]}
            favoritesEventDate = favoritesEventDate.filter {$0 != eventDate[indexPath.row]}
                print("hello")
                fourthTab.myTableView?.reloadData()
            }
    }
                
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fourthTab = self.tabBarController?.viewControllers?[2] as! FourthViewController
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = UIColor.green
            favoritesEventName.append(eventName[indexPath.row])
            favoritesEventLocation.append(eventLocation[indexPath.row])
            favoritesEventDate.append(eventDate[indexPath.row])
            fourthTab.myTableView?.reloadData()
        }
    }
}

