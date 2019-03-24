//
//  NurseRatingsViewController.swift
//  LyftNurse
//
//  Created by Krishnan Sriram Rama on 3/23/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class NurseRatingsViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "ReviewSummaryTableViewCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "RatingsCell")
//        self.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension NurseRatingsViewController: UITableViewDelegate {
    
}

extension NurseRatingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RatingsCell")! //1.
            return cell //4.
        }
        var cell:UITableViewCell? =
            tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                   reuseIdentifier: "UITableViewCell")
        }
         if indexPath.row == 1 {
            cell!.detailTextLabel?.text = "I'm not normally one to leave reviews but I seriously can't recommend them enough. Everyone working here was as nice as can be and explained everything so well that I hardly had any questions throughout the whole experience. Price is worth it for a lifetime warranty. I even told them that I wish they could replace my doctor with this nurse"
            cell!.textLabel?.text = "Anthony B."
            cell?.detailTextLabel?.numberOfLines = 0
            cell?.detailTextLabel?.lineBreakMode = .byWordWrapping
            return cell!
        } else if indexPath.row == 2 {
            cell!.detailTextLabel?.text = "The customer service is awesome, I was treated very very good. Every thing was explained perfectly. Great environment. Would recommend to anyone."
            cell!.textLabel?.text = "Jeff S."
            cell?.detailTextLabel?.numberOfLines = 0
            cell?.detailTextLabel?.lineBreakMode = .byWordWrapping
            return cell!
        }
        return UITableViewCell(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 160
        case 1:
            return 160
        default:
            return 100
        }
    }
    
}
