//
//  ListTableView.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import UIKit
import FittedSheets

typealias RHListSelected = ((_ cellData: Encodable & Decodable,_ key: String) -> ())

class RHListSelectionController: UITableViewController {
    
    var key: String = ""
    
    var viewModel: RHListSelectionViewModel = RHListSelectionViewModel()
    
    fileprivate var noDataLabel: UILabel = {
        let noDataFound = UILabel()
        noDataFound.text = "No data found!"
        noDataFound.textColor = .gray
        noDataFound.translatesAutoresizingMaskIntoConstraints = false
        return noDataFound
    }()
    
    private var listSelected: RHListSelected?
    
    func didSelcted(_ listSelected: @escaping RHListSelected) {
        self.listSelected = listSelected
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.register(TableViewFormHeaderView.self, forHeaderFooterViewReuseIdentifier: TableViewFormHeaderView.reuseIdentifier)
        //        tableView.register(UINib(nibName: NetworkProviderCell.reuseidentifier, bundle: nil), forCellReuseIdentifier: NetworkProviderCell.reuseidentifier)
        
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        tableView.rowHeight = 44 //key == "worker" ? 55 : 44
        
        if viewModel.source.isEmpty || viewModel.source[0].cellData.isEmpty {
            view.addSubview(noDataLabel)
        }
        
        tableView.indicatorStyle = .white
        noDataLabel.setNoDataLabelStyle()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noDataLabel.centerInSuperview()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.source.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.source[section].title
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.customFont(.ExoRegular, size: 14.0)
        header.textLabel?.textAlignment = .center
    }
    
    
    /* override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
     guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewFormHeaderView.reuseIdentifier) as? TableViewFormHeaderView else  {
     return UIView()
     }
     
     headerView.titleLabel.text = viewModel.source[section].title
     headerView.dropDownIcon.image = nil
     //        headerView.bgView.backgroundColor = .white
     return headerView
     }
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.source[section].cellData.count
    }
    
    fileprivate func loadOption(_ indexPath: IndexPath) -> UITableViewCell {
        let cellData = viewModel.source[indexPath.section].cellData[indexPath.row]
            
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.font = UIFont.customFont(.ExoRegular, size: 12.0)
            cell.textLabel?.textAlignment = .center
            
            switch key {
            case "status_filter":
//                let state = cellData as? Answers
//                cell.textLabel?.text = state?.name ?? ""
            break
            default:
                break
            }
            
            return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return loadOption(indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = viewModel.source[indexPath.section].cellData[indexPath.row]
        
        if let listSelected = listSelected {
            listSelected(cellData, key)
        }
    }
    
    
}
