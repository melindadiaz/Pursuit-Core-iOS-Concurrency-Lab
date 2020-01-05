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
    
//    func setUpCell(eachCell: Country.allCountries) {
//        countryName.text = eachCell.name
//        countryCap.text = eachCell.capital
//        countryPopulation.text = eachCell.population.description
        //           imageLabel.getImages(image: imageNumbers(number: eachCell.number)) { [weak self] (result) in
        //               switch result{
        //               case .failure(let appError):
        //                   fatalError("Could not get image \(appError)")
        //               case.success(let elementImages):
        //                   DispatchQueue.main.async {
        //                       self?.imageLabel.image = countryImages
        //                   }
        //               }
        //
        //           }
        //
    //}
}
