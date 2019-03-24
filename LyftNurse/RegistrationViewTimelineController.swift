//
//  RegistrationViewTimelineController.swift
//  LyftNurse
//
//  Created by Krishnan Sriram Rama on 3/23/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class RegistrationViewTimelineController: UIViewController {

    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var labelStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.labelStatus.text = "Loading...."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.activityLoader.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.transition(with: self.labelStatus, duration: 2.00,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            self?.labelStatus.text = "Checking provider information with StateFarm"
        }) { (true) in
            UIView.transition(with: self.labelStatus, duration: 3.00,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                self?.labelStatus.text = "Checking Bank details"
            }) { (true) in
                UIView.transition(with: self.labelStatus,
                                  duration: 2.00,
                                  options: .transitionCrossDissolve,
                                  animations: {
                                    self.labelStatus.text = "All VERIFIED & APPROVED"
                }, completion: { (true) in
                    self.activityLoader.stopAnimating()
                    self.activityLoader.isHidden = true
                })
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
