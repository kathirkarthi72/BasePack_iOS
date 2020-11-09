//
//  CountryListTableViewController.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import UIKit

public protocol CountryListDelegate: class {
    func selectedCountry(country: Country)
}

public class CountryList: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    var tableView: UITableView!
    var searchController: UISearchController?
    var resultsController = UITableViewController()
    var filteredCountries = [Country]()
    
    open weak var delegate: CountryListDelegate?
    
    private var countryList: [Country] {
        let countries = Countries()
        let countryList = countries.countries
        return countryList
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Country List"
        self.view.backgroundColor = .white
        
        
        tableView = UITableView(frame: view.frame)
        tableView.indicatorStyle = .white

        tableView.register(CountryCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        
        self.view.addSubview(tableView)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(handleCancel))
        
        self.setUpSearchBar()
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.backgroundColor = ColorManager.white.color
    }
    
    public func updateSearchResults(for searchController: UISearchController) {
        
        filteredCountries.removeAll()
        
        let text = searchController.searchBar.text!.lowercased()

        if text.isNumber {
            let countries = countryList.filter({$0.phoneExtension.contains(text)})
            filteredCountries = countries
            
        } else {
            
            let countries = countryList.filter({($0.name?.lowercased().contains(text))!})
            filteredCountries = countries
        }
        doOnMain {
            self.tableView.reloadData()
        }
    }
    
    func setUpSearchBar() {
        
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: ColorManager.greenTheme.color]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(cancelButtonAttributes, for: .normal)
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        
        //        self.tableView.tableHeaderView = searchController?.searchBar
        self.searchController?.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        //
        //        self.searchController?.searchBar.backgroundImage = UIImage()
        self.searchController?.dimsBackgroundDuringPresentation = false
        //        self.searchController?.searchBar.barTintColor = UIColor.white
        self.searchController?.searchBar.placeholder = "Search"
        //        self.searchController?.searchBar.tintColor = Color.theme.value
        //        self.searchController?.searchBar.backgroundColor = UIColor.white
        self.searchController?.searchResultsUpdater = self
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CountryCell
        let country = cell.country!
        
        self.searchController?.isActive = false
        self.delegate?.selectedCountry(country: country)

        tableView.deselectRow(at: indexPath, animated: true)
        self.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController!.isActive && searchController!.searchBar.text != "" {
            return filteredCountries.count
        }
        
        return countryList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! CountryCell
        
        if searchController!.isActive && searchController!.searchBar.text != "" {
            cell.country = filteredCountries[indexPath.row]
            return cell
        }
        cell.country = countryList[indexPath.row]
        return cell
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
}
