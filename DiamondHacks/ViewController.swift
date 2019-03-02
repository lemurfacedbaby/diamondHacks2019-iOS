//
//  ViewController.swift
//  DiamondHacks
//
//  Created by Atomo on 3/2/19.
//  Copyright © 2019 RootManagement. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [AllJobsQuery.Data.Job]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = self.data {
            return data.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier:"cellid")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellid")
        }
        cell.textLabel?.text = data![indexPath.row].title
        cell.detailTextLabel?.text = data![indexPath.row].salary
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        apollo.fetch(query: AllJobsQuery()) { (result, err) in
            if let data = result!.data {
                self.data = data.jobs
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }


}

