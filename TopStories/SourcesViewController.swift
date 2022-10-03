//
//  ViewController.swift
//  TopStories
//
//  Created by Evan Spahr on 9/29/22.
//

import UIKit

class SourcesViewController: UITableViewController {
    
    var sources = [[String: String]]()
    let apiKey = "d45229539c5d4c6ea40599abe7ec48c8"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "News Sources"
        let query = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(apiKey)"
        
        let url = URL(string: query)!
        if let data = try? Data(contentsOf: url) {
            if let json = try? JSON(data: data), json["status"] == "ok" {
                parse(json: json)
            } else {
                showError()
            }
        } else {
            showError()
        }
    }
    
    func parse(json: JSON) {
        for result in json["sources"].arrayValue {
            print(result)
            
            let id = result["id"].stringValue
            let name = result["name"].stringValue
            let description = result["description"].stringValue
            
            let source = ["id": id, "name": name, "description": description]
            sources.append(source)
        }
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Loading Error", message: "There was a problem loading the news feed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

