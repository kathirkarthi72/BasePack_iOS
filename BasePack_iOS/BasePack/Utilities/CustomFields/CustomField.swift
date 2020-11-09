//
//  CustomField.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit
import TweeTextField

class CustomField: UIView {
    
    var titleLabel = UILabel()
    
    var textFieldBGView = UIView()
    
    var textfield = CustomTweeAttributedTextField()
    
    /// Is Mandatory field
    var isMandatory: Bool = false {
        willSet {
            textfield.isMandatory = newValue
        }
    }
    
    var validate: ValidationType = .isBlank {
        willSet {
            textfield.validate = newValue
        }
    }
    
    func validationType(_ type: ValidationType, mandatory: Bool = false) {
        validate = type
        isMandatory = mandatory
    }
    
    var text: String {
        get {
            textfield.text ?? ""
        }
        set {
            textfield.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {

        addSubview(textFieldBGView)
        textFieldBGView.addSubview(textfield)
        addSubview(titleLabel)
              
//        textfield.setTextFieldProperties(placeholderString: "", borderColor: ColorManager.lightText.color, isSecureText: false, isMobileField: false, isFieldRequired: false)
        
        textfield.set(placeholder: "", isSecureText: false, isMobileField: false, isFieldRequired: false)
        
//        layer.borderColor = ColorManager.borderColor.color.cgColor
//        layer.borderWidth = 0.5
//        cornerRadius = 5.0
//        layer.masksToBounds = false
        
        layoutConfig()
        
        textFieldBGView.layer.borderColor = ColorManager.darkText.color.cgColor
        textFieldBGView.layer.borderWidth = 1
        textFieldBGView.cornerRadius = 5
        textFieldBGView.layer.masksToBounds = false
    }
    
    fileprivate func layoutConfig() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        textFieldBGView.translatesAutoresizingMaskIntoConstraints = false
        
        textfield.fillSuperview()

        NSLayoutConstraint.activate([textFieldBGView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                                     textFieldBGView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     textFieldBGView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     textFieldBGView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)])
        
    }
}
