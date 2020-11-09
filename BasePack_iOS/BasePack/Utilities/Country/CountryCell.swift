//
//  CountryCell.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    var nameLabel: UILabel?
    var extensionLabel: UILabel?
    var countryFlag: UILabel?
    
    var country: Country? {
        didSet {
            if let name = country!.name {
                nameLabel?.text = "\(name)"
                extensionLabel?.text = "+\(country!.phoneExtension)"
                countryFlag?.text = country?.flag
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        self.nameLabel?.text = ""
        self.extensionLabel?.text = ""
        self.countryFlag?.text = ""
    }
    
    func setup() {
        
        countryFlag = UILabel()
        //        countryFlag?.contentMode = .scaleAspectFit
        countryFlag?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(countryFlag!)
        countryFlag?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        countryFlag?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        countryFlag?.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 30).isActive = true
        countryFlag?.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 30).isActive = true
        
        nameLabel = UILabel()
//        nameLabel?.textColor = ColorManager.lightGray.value
        nameLabel?.font = .customFont(.ExoSemiBold, size: 18)
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel!)
        
        nameLabel?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nameLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 60).isActive = true
        
        extensionLabel = UILabel()
//        extensionLabel?.textColor = ColorManager.appTheme.value
        extensionLabel?.font = .customFont(.ExoSemiBold, size: 18)
        extensionLabel?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(extensionLabel!)
        extensionLabel?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        extensionLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
    }
}
