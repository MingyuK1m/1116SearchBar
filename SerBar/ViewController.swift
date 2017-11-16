//
//  ViewController.swift
//  SerBar
//
//  Created by D7702_10 on 2017. 11. 16..
//  Copyright © 2017년 DoubleK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating{
    
    //var searchB : UISearchDisplayController 이제 사용안함
    
    
    var ary = ["a","b","e","c","r","aa","bb","ee","cc","rr","aaa","bbb","eee","ccc","rrr","rasdas","easda","badsd","asdsa","csadasd","jhlhk","lgkj","rty","qwe","sd"]
    
    var fry = [String]()
    
    var searchBar : UISearchController!
 
    @IBOutlet weak var tableV: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.searchBar = {
            let ser = UISearchController(searchResultsController: nil)
            ser.searchResultsUpdater = self
            ser.dimsBackgroundDuringPresentation = false
            ser.searchBar.sizeToFit()
            tableV.tableHeaderView = ser.searchBar
            
           // return ser
       // }()
        
        self.tableV.dataSource = self
        self.tableV.delegate = self
        
        self.tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.searchBar.isActive ? fry.count : ary.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableV.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        if self.searchBar.isActive{
//            cell.textLabel?.text = fry[indexPath.row]
//        } else {
//            cell.textLabel?.text = ary[indexPath.row]
//        }
        
        cell.textLabel?.text = self.searchBar.isActive ? fry[indexPath.row] : ary[indexPath.row]

        
        return cell
    }

    func  updateSearchResults(for searchController: UISearchController) {
        //print(searchController.searchBar.text!)
        
        self.fry.removeAll(keepingCapacity: false)
        
        let prd = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        
        let ffry = (ary as NSArray).filtered(using: prd)
        self.fry = ffry as! [String]
        
        self.tableV.reloadData()
    
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["a","b","c"]
    }
}

