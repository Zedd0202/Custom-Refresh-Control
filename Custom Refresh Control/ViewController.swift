//
//  ViewController.swift
//  Custom Refresh Control
//
//  Created by Zedd on 21/04/2019.
//  Copyright © 2019 Zedd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.configureRefreshControl()
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func configureRefreshControl () {
        // Add the refresh control to your UIScrollView object.
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action:
            #selector(handleRefreshControl),
                                                  for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        // Update your content…
        
        // Dismiss the refresh control.
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell"
            , for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

}

