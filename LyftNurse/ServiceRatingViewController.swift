//
//  ServiceRatingViewController.swift
//  LyftNurse
//
//  Created by Krishnan Sriram Rama on 3/24/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class ServiceRatingViewController: UIViewController {

    @IBOutlet var rate1ButtonTapped: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func buttonRate1Tapped(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Rate", preferredStyle: .actionSheet)
        let excellent = UIAlertAction(title: "Excellent", style: .default)
        let good = UIAlertAction(title: "Good", style: .default)
        let average = UIAlertAction(title: "Average", style: .default)
        let poor = UIAlertAction(title: "Poor", style: .default)
        
        optionMenu.addAction(excellent)
        optionMenu.addAction(good)
        optionMenu.addAction(average)
        optionMenu.addAction(poor)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func buttonRate2Tapped(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Rate", preferredStyle: .actionSheet)
        let excellent = UIAlertAction(title: "Excellent", style: .default)
        let good = UIAlertAction(title: "Good", style: .default)
        let average = UIAlertAction(title: "Average", style: .default)
        let poor = UIAlertAction(title: "Poor", style: .default)
        
        optionMenu.addAction(excellent)
        optionMenu.addAction(good)
        optionMenu.addAction(average)
        optionMenu.addAction(poor)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func buttonRate3Tapped(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Rate", preferredStyle: .actionSheet)
        let excellent = UIAlertAction(title: "Excellent", style: .default)
        let good = UIAlertAction(title: "Good", style: .default)
        let average = UIAlertAction(title: "Average", style: .default)
        let poor = UIAlertAction(title: "Poor", style: .default)
        
        optionMenu.addAction(excellent)
        optionMenu.addAction(good)
        optionMenu.addAction(average)
        optionMenu.addAction(poor)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func buttonSaveAndCloseTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
