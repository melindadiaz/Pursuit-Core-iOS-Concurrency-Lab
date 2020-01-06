//
//  ViewController.swift
//  Concurrency
//
//  Created by Melinda Diaz on 12/6/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //TODO: Fix errors and pass data, make sure everything is working
    @IBOutlet weak var concurrencySearch: UISearchBar!
    @IBOutlet weak var countryTableView: UITableView!
    
    var concurrencyRef = [Country]() {
        didSet {
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }//YOU MUST RELOAD DATA!!!
        }
    }
    var userQuery = "" {
        didSet {
            concurrencyRef.filter{$0.name.lowercased().contains(userQuery.lowercased())}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.delegate = self
        countryTableView.dataSource = self
        concurrencySearch.delegate = self
        setUpCountries()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = countryTableView.indexPathForSelectedRow,
            let detailedVC = segue.destination as? DetailedViewController else { fatalError("Could not segue")}
        let eachCell = concurrencyRef[indexPath.row]
        detailedVC.countryData = eachCell
    }
    func setUpCountries() {
        APIClient.getCountries(for: "https://restcountries.eu/rest/v2/name/united") { [weak self] (result) in
           switch result {
           case .failure(let appError):
               DispatchQueue.main.async {
                   self?.showAlert(title: "Error", message: "Cannot load elements \(appError)")
               }
           case .success(let data):
               self?.concurrencyRef = data
           }
       }
}
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concurrencyRef.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? ConcurrencyTableViewCell else { fatalError("Could not load cells")}
        cell.setUpCell(eachCell: concurrencyRef[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            countryTableView.reloadData()
            return
        }
        userQuery = searchText
    }
    
}
