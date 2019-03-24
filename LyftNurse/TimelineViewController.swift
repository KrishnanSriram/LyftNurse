//
//  TimelineViewController.swift
//  LyftNurse
//
//  Created by Krishnan Sriram Rama on 3/23/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "TimeLinRequestCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "TimeLineRequestCell")
        
        let nib2 = UINib(nibName: "TimelineHistoryCell", bundle: nil)
        self.tableview.register(nib2, forCellReuseIdentifier: "TimelineHistorycell")
    }

}

extension TimelineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Current Request"
        } else {
            return "Request history"
        }
    }
}

extension TimelineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 6
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineRequestCell")! //1.
            return cell
        }
        
        let number = Int.random(in: 100 ..< 500)
        var cost = String(number)
        cost = "$" + cost
        
        let day = String(Int.random(in: 1 ..< 30))
        let month = String(Int.random(in: 1..<12))
        let year = "2018"
        let date = month + "/" + day + "/" + year
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineHistorycell") as! TimelineHistoryCell //1.
        cell.serviceCharge.text = cost
        cell.requestDate.text = date
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
}
