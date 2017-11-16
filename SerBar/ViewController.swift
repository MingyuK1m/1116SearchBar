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
    
    
    var test = ["a","b","e","c","r","aa","bb","ee","cc","rr","aaa","bbb","eee","ccc","rrr","aaaa","bbbb","eeee","cccc","rrrr","jhlhk","lgkj","rty","qwe","sd"]
    
    
    var searchBar : UISearchController!
 
    @IBOutlet weak var tableV: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar = {
            let ser = UISearchController(searchResultsController: nil)
            ser.searchResultsUpdater = self
            ser.dimsBackgroundDuringPresentation = false
            ser.searchBar.sizeToFit()
            tableV.tableHeaderView = ser.searchBar
            
            return ser
        }()
        
        self.tableV.dataSource = self
        self.tableV.delegate = self
        
        self.tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return test.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableV.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = test[indexPath.row]
        
        return cell
    }

    func  updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
}

