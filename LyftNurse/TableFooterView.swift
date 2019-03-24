//
//  TableFooterView.swift
//  LyftNurse
//
//  Created by Krishnan Sriram Rama on 3/23/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class TableFooterView: UITableViewHeaderFooterView {
    
    weak var button: UIButton!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    func initialize() {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See Me", for: .normal)
        self.contentView.addSubview(button)
        self.button = button
        
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: self.button.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: self.button.centerYAnchor),
            ])
        
        self.contentView.backgroundColor = .black
        self.button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        self.button.titleLabel?.textAlignment = .center
        self.button.layer.backgroundColor = UIColor.darkGray.cgColor
        self.button.layer.cornerRadius = 5.0
    }
}

