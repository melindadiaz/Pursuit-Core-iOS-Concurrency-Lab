//
//  ConcurrencyTableViewCell.swift
//  Concurrency
//
//  Created by Melinda Diaz on 1/4/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit

class ConcurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var concurrencyImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCap: UILabel!
    @IBOutlet weak var countryPopulation: UILabel!
    
    func setUpCell(eachCell: Country) {
    countryName.text = eachCell.name
        countryCap.text = "Capital \(eachCell.capital)"
        countryPopulation.text = "Population \(eachCell.population)"
        concurrencyImage.getImages(image: "https://www.countryflags.io/\(eachCell.alpha2Code)/flat/64.png") { [weak self] (result) in
        switch result{
        case .failure(let appError):
            fatalError("Could not get image \(appError)")
        case.success(let myImages):
            DispatchQueue.main.async {
                self?.concurrencyImage.image = myImages
            }
        }
        
    }
}
}
