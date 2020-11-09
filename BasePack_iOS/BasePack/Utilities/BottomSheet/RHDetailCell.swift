//
//  DetailCell.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//
import UIKit

/// Detail cell
class RHDetailCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    static let reuseidenetifier: String = "RHDetailCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override var reuseIdentifier: String? {
        return RHDetailCell.reuseidenetifier
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        title.text = nil
        detail.text = nil
    }
    
}
