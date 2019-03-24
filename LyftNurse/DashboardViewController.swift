//
//  DashboardViewController.swift
//  LyftNurse
//
//  Created by Krishnan Sriram Rama on 3/23/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit
import MapKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var serviceCollectionView: UICollectionView!
    private var selectedService: IndexPath?
    private var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?
    private var selectedAnnotation: MKPointAnnotation?
    private var serviceCost = "000"
    private var issueTitle = "Please tap to fill"
    private var issueDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceCollectionView.delegate = self
        serviceCollectionView.dataSource = self
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.mapview.delegate = self
        
        self.selectedService = IndexPath(row: 0, section: 0)
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        
        let nib = UINib(nibName: "ServiceCostCellTableViewCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "ServiceCostCell")
        
        let nib2 = UINib(nibName: "NurseTableViewCell", bundle: nil)
        self.tableview.register(nib2, forCellReuseIdentifier: "NurseCell")
        
        let nib3 = UINib(nibName: "SubmitButtonCell", bundle: nil)
        self.tableview.register(nib3, forCellReuseIdentifier: "SubmitCell")
        
        self.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        self.mapview.showsUserLocation = true
        self.mapview.isZoomEnabled = true
        
        let nurse1Location = MKPointAnnotation()
        nurse1Location.title = "Nurse1"
        nurse1Location.coordinate = CLLocationCoordinate2D(latitude: 39.974178, longitude: -83.023354)
        self.mapview.addAnnotation(nurse1Location)
        
        //-6.821880
        //107.141678
        let nurse2Location = MKPointAnnotation()
        nurse2Location.title = "Nurse2"
        nurse2Location.coordinate = CLLocationCoordinate2D(latitude: 39.961870, longitude: -83.003600)
        self.mapview.addAnnotation(nurse2Location)
        
        //39.820461
        //-82.938461
        let nurse3Location = MKPointAnnotation()
        nurse3Location.title = "Nurse3"
        nurse3Location.coordinate = CLLocationCoordinate2D(latitude: 39.962320, longitude: -83.002120)
        self.mapview.addAnnotation(nurse3Location)
        
        //20.688190
        //-98.466830
        let nurse4Location = MKPointAnnotation()
        nurse4Location.title = "Nurse4"
        nurse4Location.coordinate = CLLocationCoordinate2D(latitude: 39.948700, longitude: -82.998970)
        self.mapview.addAnnotation(nurse4Location)
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableview.tableHeaderView = TableHeaderView(reuseIdentifier: "HeaderView")
        self.tableview.tableFooterView = nil
        self.tableview.backgroundColor = UIColor.clear
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

extension DashboardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.selectedService != nil {
            let previouscell = collectionView.cellForItem(at: self.selectedService!) as! ServiceCollectionViewCell
            previouscell.serviceTitle.font = UIFont(name: "HelveticaNeue", size: 13.0)
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! ServiceCollectionViewCell
        cell.serviceTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        self.selectedService = indexPath
    }
}

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCollectionViewCell
        
        switch indexPath.row {
        case 1:
            cell.serviceImage.image = UIImage(named: "diagnosis")
            cell.serviceTitle.text = "Diagnosis"
        case 2:
            cell.serviceImage.image = UIImage(named: "baby")
            cell.serviceTitle.text = "Baby"
        case 3:
            cell.serviceImage.image = UIImage(named: "dress")
            cell.serviceTitle.text = "Dressing"
        default:
            cell.serviceImage.image = UIImage(named: "bandage")
            cell.serviceTitle.text = "Bandage"
            cell.serviceTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        }
        
        
        return cell
    }
    
    
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Request details"
        case 1:
            return "Service cost"
        case 2:
            return "Nurse Info"
        default:
            return ""
        }
    }
}

extension DashboardViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if serviceCost == "000" {
            return 1
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight: CGFloat = 60.0
        if indexPath.section == 2 {
            switch indexPath.row {
            case 0:
                cellHeight = 100.0
            case 2:
                cellHeight = 60.0
            default:
                cellHeight = 40.0
            }
            
        }
        
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            var cell:UITableViewCell? =
                tableView.dequeueReusableCell(withIdentifier: "SimpleCell")
            if (cell == nil)
            {
                cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                       reuseIdentifier: "SimpleCell")
            }
            cell?.accessoryType = .detailButton
            cell!.detailTextLabel?.text = issueDescription
            cell!.textLabel?.text = issueTitle
            cell!.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
            cell!.detailTextLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 13.0)
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCostCell") as! ServiceCostCellTableViewCell
            cell.serviceCostLabel.text = serviceCost
            return cell //4.
        case 2:
            switch(indexPath.row) {
            case 0:
                let nursecell = tableView.dequeueReusableCell(withIdentifier: "NurseCell", for: indexPath) as! NurseTableViewCell
                return nursecell
            case 1:
                let normalcell = UITableViewCell(style: .default, reuseIdentifier: "NormalCell")
                normalcell.textLabel?.text = "Tap here for Ratings and reviews"
                normalcell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                normalcell.textLabel?.textColor = UIColor(red: 0.29, green: 0.53, blue: 0.91, alpha: 1.0)
                normalcell.accessoryType = .detailButton
                return normalcell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitCell")! //1.
                return cell //4.
            }
        default:
            return UITableViewCell(frame: .zero)

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0 && indexPath.row == 0) {
            // present modal view
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "servicerequest")
            self.showDetailViewController(vc as! ServiceRequestDetailsViewController, sender: self)
            tableView.deselectRow(at: indexPath, animated: false)
            serviceCost = "120"
            issueTitle = "Cuts & bruises"
            issueDescription = "Have a small cut in my leg......."
            self.tableview.reloadData()
        }
        if(indexPath.section == 2 && indexPath.row == 1) {
            // present modal view
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "ratings")
            self.showDetailViewController(vc as! NurseRatingsViewController, sender: self)
            tableView.deselectRow(at: indexPath, animated: false)
        }
        if(indexPath.section == 2 && indexPath.row == 2) {
            // present modal view
            let alert = UIAlertController(title: "Request submitted", message: "Your request to assist cut or a bruise injury has been submitted. Please check time lines section for updates", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // when ok is tapped
            }
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension DashboardViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer { self.currentLocation = locations.last }
        
        if currentLocation == nil {
            // Zoom to user location
            if let userLocation = locations.last {
                let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                self.mapview.setRegion(viewRegion, animated: false)
            }
        }
    }
}

extension DashboardViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
            
        else {
            let annotationView = self.mapview.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named: "place")
            annotationView.canShowCallout = true
            return annotationView
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        self.selectedAnnotation = view.annotation as? MKPointAnnotation
        
        if selectedAnnotation?.title == "Nurse1" {
            debugPrint("Load information about Nurse 1")
        }
    }
}
