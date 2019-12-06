//
//  ViewController.swift
//  Concurrency
//
//  Created by Melinda Diaz on 12/6/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //fix constraints
    @IBOutlet weak var flagImage: UITableViewCell!
    @IBOutlet weak var countryNameLabel: UITableViewCell!
    @IBOutlet weak var countryCapitalLabel: UITableViewCell!
    @IBOutlet weak var countryPopulationLabel: UILabel!
    @IBOutlet weak var countryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.delegate = self
        countryTableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
