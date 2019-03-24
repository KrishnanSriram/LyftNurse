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
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Profile"
        case 1:
            return "Primary Care Info"
        case 2:
            return "Nurse preferences"
        case 3:
            return "Payment Info"
        default:
            return "Insurance Info"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 2
        case 2:
            return 2
        case 3:
            return 2
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                       reuseIdentifier: "SimpleCell")
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "SSN"
                cell.detailTextLabel?.text = "345-54-4567"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            case 1:
                cell.textLabel?.text = "Name"
                cell.detailTextLabel?.text = "Brad Pitt"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            case 2:
                cell.textLabel?.text = "Address"
                cell.detailTextLabel?.text = "527, Tansy Ln, Westerville, OH 43016"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            case 3:
                cell.textLabel?.text = "Preferred contact number"
                cell.detailTextLabel?.text = "614-765-0923"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            default:
                return UITableViewCell(frame: .zero)
            }
        }
        else if indexPath.section == 1 {
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                       reuseIdentifier: "SimpleCell")
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Primary Physician"
                cell.detailTextLabel?.text = "Dr. Mark R. Dahl MD"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            case 1:
                cell.textLabel?.text = "Preferred hospital "
                cell.detailTextLabel?.text = "OhioHealth Riverside Methodist Hospital"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            default:
                return UITableViewCell(frame: .zero)
            }
        } else if indexPath.section == 2 {
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                       reuseIdentifier: "SimpleCell")
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Nurse Gender"
                cell.detailTextLabel?.text = "Male"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            case 1:
                cell.textLabel?.text = "Security"
                cell.detailTextLabel?.text = "Low"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            default:
                return UITableViewCell(frame: .zero)
            }
        } else if indexPath.section == 3 {
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                       reuseIdentifier: "SimpleCell")
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Bank"
                cell.detailTextLabel?.text = "JP Morgan Chace"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            case 1:
                cell.textLabel?.text = "Account Type"
                cell.detailTextLabel?.text = "Card - 2342-2344-3467-8457 - 03/20"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            default:
                return UITableViewCell(frame: .zero)
            }
        } else {
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                       reuseIdentifier: "SimpleCell")
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Provider"
                cell.detailTextLabel?.text = "StateFarm"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            case 1:
                cell.textLabel?.text = "Type"
                cell.detailTextLabel?.text = "SDJKLJNSDFG"
                cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
                return cell
            default:
                return UITableViewCell(frame: .zero)
            }
        }
    }
    
    
}

extension SettingsViewController: UITableViewDelegate {
    
}
