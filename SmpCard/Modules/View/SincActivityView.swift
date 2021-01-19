//
//  view.swift
//  SmpCard
//
//  Created by Максим Жуков on 17.12.2020.
//  Copyright © 2020 SMP. All rights reserved.
//

import UIKit

 struct ActivityView {
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1981339753, green: 0.202637136, blue: 0.249553293, alpha: 1)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    let labelview = UILabel()

    
    init(withText text: String) {

        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = .white
        activityIndicator.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -5).isActive = true
        
        
        
        
        view.addSubview(labelview)
        labelview.text = text
        labelview.translatesAutoresizingMaskIntoConstraints = false
        labelview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelview.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 5).isActive = true
        labelview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        labelview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        labelview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
    }

}
