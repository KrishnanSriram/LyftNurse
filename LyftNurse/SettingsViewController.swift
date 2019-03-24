//
//  SettingsViewController.swift
//  LyftNurse
//
//  Created by Krishnan Sriram Rama on 3/23/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        self.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
    }


}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Profile"
        } else {
            return "Preferences"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "UITableViewCell")
        cell?.textLabel?.text = "View Profile"
        cell?.textLabel?.textColor = UIColor.darkGray
        cell?.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
        
        return cell!
    }
    
    
}

extension SettingsViewController: UITableViewDelegate {
    
}
