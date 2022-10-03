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
    }
}

