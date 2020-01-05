//
//  DetailedViewController.swift
//  Concurrency
//
//  Created by Melinda Diaz on 12/6/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var capitalOutlet: UILabel!
    @IBOutlet weak var populationOutlet: UILabel!
    
    var countryData: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    func setUp() {
        guard let x = countryData else {
            showAlert(title: "No data", message: "did not pass data on segue")
            return
        }
        let imageURL = "https://www.countryflags.io/\(x.alpha2Code)/flat/64.png"
        
        
        nameOutlet.text = x.name
        capitalOutlet.text = x.capital
        populationOutlet.text = x.population.description
        countryImage.getImages(image: imageURL) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Image Error", message: "No image available \(appError)")
                    //self?.countryData.countryImage = UIImage(named: "i-cant-see-shit-captain")
                }
            case .success(let imageURL):
                DispatchQueue.main.async {
                    self?.countryData.countryImage = imageURL
                }
            }
        }
        
    }
    
    
    
}


