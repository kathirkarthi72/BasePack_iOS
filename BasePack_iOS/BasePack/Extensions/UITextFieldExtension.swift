//
//  UITextFieldExtension.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit
import TweeTextField

extension TweeAttributedTextField {
    
    func setTextFieldProperties(placeholderString: String, placeholderColor:UIColor = ColorManager.lightText.color, borderColor: UIColor = ColorManager.darkText.color, textColor: UIColor = ColorManager.darkText.color, backgroundColor: UIColor = ColorManager.white.color, isSecureText:Bool, isMobileField: Bool = false, isFieldRequired:Bool = false) {
        
        self.isSecureTextEntry = isSecureText
        self.infoTextColor = UIColor.red //Color.theme.value
        self.textColor = textColor //ColorManager.darkText.color
        
        self.borderStyle = .none
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1
        
        self.layer.cornerRadius = 5
        
        
        let userFont = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .footnote)
        self.infoFontSize = 10
        self.minimumPlaceholderFontSize = 12
        self.originalPlaceholderFontSize = 13
        self.infoLabel.font = UIFont.customFont(.ExoRegular, size: 9.0)
        //        textField.tweePlaceholder = placeholderString
        self.placeholderColor = .clear
        //        textField.placeholderLabel.backgroundColor = .cyan
        //textField.lineColor = Color.lightText.value
        
        self.infoFontSize = 11.0

        
        self.font = UIFont.customFont(.ExoRegular, size: 17.0)
        // textField.attributedPlaceholder =
        
        let asterix = NSAttributedString(string: "*", attributes: [.foregroundColor: UIColor.red])
        
        let passwordAttriburedString = NSMutableAttributedString(string: placeholderString, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor, NSAttributedString.Key.font :self.infoLabel.font ?? userFont])
        
        //  textField.attributedPlaceholder = NSAttributedString(string: placeholderString, attributes: [NSAttributedString.Key.foregroundColor: ColorManager.lightText.color, NSAttributedString.Key.font :textField.infoLabel.font ?? userFont])
        
        self.backgroundColor = backgroundColor //ColorManager.white.color
        
        if isFieldRequired {
            passwordAttriburedString.append(asterix)
        }
        self.attributedTweePlaceholder = passwordAttriburedString

    }
    
    func set(placeholder: String,
             isSecureText: Bool = false,
             isMobileField: Bool = false,
             isFieldRequired:Bool = false) {
                
        self.isSecureTextEntry = isSecureText
        self.infoTextColor = UIColor.red //Color.theme.value
        self.textColor = textColor //ColorManager.darkText.color
        
//        self.borderStyle = .none
//
//        self.layer.borderColor = borderColor.cgColor
//        self.layer.borderWidth = 1
//        self.cornerRadius = 5
                
        let userFont = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .footnote)
        self.infoFontSize = 10
        self.minimumPlaceholderFontSize = 12
        self.originalPlaceholderFontSize = 13
        self.infoLabel.font = UIFont.customFont(.ExoRegular, size: 9.0)
        //        textField.tweePlaceholder = placeholderString
        self.placeholderColor = .clear
        //        textField.placeholderLabel.backgroundColor = .cyan
        //textField.lineColor = Color.lightText.value
        
        self.infoFontSize = 11.0

        
        self.font = UIFont.customFont(.ExoRegular, size: 17.0)
        // textField.attributedPlaceholder =
        
        let asterix = NSAttributedString(string: "*", attributes: [.foregroundColor: UIColor.red])
        
        let passwordAttriburedString = NSMutableAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: ColorManager.lightText.color, NSAttributedString.Key.font :self.infoLabel.font ?? userFont])
        
        self.backgroundColor = backgroundColor //ColorManager.white.color
        
        if isFieldRequired {
            passwordAttriburedString.append(asterix)
        }
        self.attributedTweePlaceholder = passwordAttriburedString
    }
    
    func addDropDownButton(icon: String = "Dropdown – 2") -> UIButton {
        let right = UIView(frame: .init(x: 0, y: 0, width: 30, height: 20))
        right.backgroundColor = .clear
        
        let dropDownButton = UIButton(type: .custom)
        dropDownButton.frame = .init(x: 5, y: 0, width: 20, height: 20)
        dropDownButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //        dropDownButton.titleLabel?.font = UIFont.custom(.regular, .callout)
        //        dropDownButton.setTitleColor(Color.theme.value, for: .normal)
        //        dropDownButton.titleLabel?.minimumScaleFactor = 0.5
        //        dropDownButton.contentMode = .left
        dropDownButton.setImage(UIImage(named: icon), for: .normal)
        
        right.layer.masksToBounds = true
        right.addSubview(dropDownButton)
        
        rightView = right
        rightViewMode = .always
        
        return dropDownButton
    }
    
    /// Add country code button
    func addCountryCodeButton() -> UIButton {
        let right = UIView(frame: .init(x: 0, y: 0, width: 75, height: frame.height))
        right.backgroundColor = .clear
        
        let countryCodeButton = UIButton(type: .custom)
        countryCodeButton.frame = .init(x: 0, y: 0, width: 75, height: frame.height)
        countryCodeButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        countryCodeButton.titleLabel?.font = UIFont.customFont(.ExoRegular, size: 15)
        countryCodeButton.setTitleColor(ColorManager.greenTheme.color, for: .normal)
        countryCodeButton.titleLabel?.minimumScaleFactor = 0.5
        countryCodeButton.contentMode = .left
        
        right.layer.masksToBounds = true
        
        right.addSubview(countryCodeButton)
        
        rightView = right
        rightViewMode = .always
        
        return countryCodeButton
    }
}
extension UITextField {
        
    func setLeftPadding(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPadding(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setRightPaddingImage(_ amount:CGFloat , image : UIImage, color: UIColor) {
        let gamount = self.frame.size.height / 2
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: gamount + 20, height: self.frame.size.height))
        
        let imgView = UIImageView(frame: CGRect(x: 5, y: (paddingView.frame.size.height/2) - 12.5, width: 25, height: 25))
        imgView.image = image.withRenderingMode(.alwaysTemplate)
        imgView.tintColor = color
        imgView.contentMode = .scaleAspectFit
        paddingView.addSubview(imgView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        paddingView.isUserInteractionEnabled = true
        paddingView.addGestureRecognizer(tap)
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        self.becomeFirstResponder()
    }
    
    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: frame.height - 1, width: frame.width, height: 1.0)
        bottomLine.backgroundColor = ColorManager.buttonYellow.color.cgColor
        borderStyle = BorderStyle.none
        layer.addSublayer(bottomLine)
    }
}
