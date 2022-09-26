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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
     */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        cell.imageView?.image = UIImage.init(named: countries[indexPath.row].flag)
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.systemGray6.cgColor
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = countries[indexPath.row].flag
            vc.countryName = countries[indexPath.row].name
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

