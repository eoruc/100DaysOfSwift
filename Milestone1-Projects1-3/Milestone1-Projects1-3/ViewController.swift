//
//  ViewController.swift
//  Milestone1-Projects1-3
//
//  Created by eoruc on 23.09.2022.
//

import UIKit

class ViewController: UITableViewController {
    var countries: [(name: String, flag: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path).sorted()
        
        for item in items   {
            if item.hasSuffix("@3x.png"){
                countries.append((name: String(item[..<item.firstIndex(of: "@")!]).uppercased(), flag: item))
            }
        }
        
    }
    
    /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
     */


}

