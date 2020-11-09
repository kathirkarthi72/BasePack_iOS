//
//  UILabelExtension.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func setLabelAttributes(labelText:String? ,textColor:UIColor,font:UIFont?,textAlignment:NSTextAlignment) {
        self.text = labelText
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = 0
        self.backgroundColor = .clear
    }

    func addMandatorySymbol() {
        let chequeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: "\(self.text ?? "") *")
        chequeAttributedString.setColorForText(textForAttribute: "*", withColor: .red, withFont: UIFont(name:Font.FontName.DMSansRegular.rawValue, size: 12.0)!)
        self.attributedText = chequeAttributedString
    }

    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.alignment = self.textAlignment
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
    func setAttributeTermsAndCondition(label:UILabel) {
        
        let string = NSAttributedString(string: "By clicking submit, you are agree to \n our ")
        
        label.textColor = .darkGray
        
        let attributedText = NSMutableAttributedString(string: "Terms and Conditions", attributes: [NSAttributedString.Key.font: UIFont.customFont(.ExoMedium, size: 12.0), NSAttributedString.Key.foregroundColor: ColorManager.liteBlueTheme.color, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        
        let combination = NSMutableAttributedString()
        combination.append(string)
        combination.append(attributedText)
        label.attributedText =   combination
        
        
    }
    
    func underLine(color: UIColor){
        if let text = self.text{
            
            let attributedString = NSMutableAttributedString(string: text)
            //NSAttributedStringKey.foregroundColor : UIColor.blue
            
            attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: color, range: NSRange(location: 0, length: text.count))
            
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.textColor!, range: NSRange(location: 0, length: text.count))
            
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
            
            //            self.setAttributedTitle(attributedString, for: .normal)
            
            //            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
            //            let underlineAttributedString = NSAttributedString(string: textUnwrapped, attributes: underlineAttribute)
            self.attributedText = attributedString
        }
    }
    func setPopupTitle(label:UILabel, titleText:String) {
        // label.font = Utility().getScaledFont(forFont: Font.FontName.DMSansRegular.rawValue, textStyle: .body)
        label.font = UIFont.customFont(.ExoRegular, size: 17.0)
        label.numberOfLines = 0
        label.text = titleText
        label.backgroundColor = .clear
        label.textColor = ColorManager.darkText.color
        label.adjustsFontForContentSizeCategory = false
    }
    
    func setTitle(title: String) {
        font = UIFont.customFont(.ExoLight, size: 15.0)
        numberOfLines = 0
        text = title
        backgroundColor = .clear
        textColor = ColorManager.darkText.color
        adjustsFontForContentSizeCategory = false
    }
    
    func setMainTitle(label:UILabel, titleText:String) {
        //label.font = Utility().getScaledFont(forFont: Font.FontName.DMSansMedium.rawValue, textStyle: .footnote)
        label.font = UIFont.customFont(.ExoMedium, size: 15.0)
        label.numberOfLines = 0
        label.text = titleText
        label.backgroundColor = .clear
        label.textColor = ColorManager.darkText.color
        label.adjustsFontForContentSizeCategory = false
    }
    
    func setFooterTitle(label:UILabel,titleText:String) {
        //label.font = Utility().getScaledFont(forFont: Font.FontName.DMSansRegular.rawValue, textStyle: .caption1)
        label.font = UIFont.customFont(.ExoRegular, size: 12.0)
        label.numberOfLines = 0
        label.text = titleText
        label.backgroundColor = .clear
        label.textColor = ColorManager.textColor.color
        label.adjustsFontForContentSizeCategory = false
    }
    
    func setCaptionTitle(label:UILabel,titleText:String) {
        //label.font = Utility().getScaledFont(forFont: Font.FontName.DMSansRegular.rawValue, textStyle: .caption2)
        label.font = UIFont.customFont(.ExoRegular, size: 11.0)
        label.numberOfLines = 0
        label.text = titleText
        label.backgroundColor = .clear
        label.textColor = ColorManager.textColor.color
        label.adjustsFontForContentSizeCategory = false
    }
    
    func setLabelCustomProperties(label:UILabel, titleText:String, textColor:UIColor, font:UIFont?, numberOfLines:Int, alignment : NSTextAlignment)
    {
        label.font = font
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.text = titleText
        label.textColor = textColor
        label.adjustsFontForContentSizeCategory = false
    }
    
    func dotlineStyle( color:UIColor) {
        DispatchQueue.main.async {
            self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            let yourViewBorder = CAShapeLayer()
            yourViewBorder.strokeColor = color.cgColor
            yourViewBorder.lineDashPattern = [2, 2]
            yourViewBorder.frame = self.bounds
            yourViewBorder.fillColor = nil
            yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
            self.layer.addSublayer(yourViewBorder)
        }
    }
    
    func addBottomLayer(color: UIColor, space:CGFloat, lineHeight: CGFloat) {
        doOnMain {
            self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            self.setNeedsLayout()
            self.layoutIfNeeded()
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height + space, width: self.frame.size.width, height: lineHeight)
            self.layer.addSublayer(border)
        }
    }
    
    func setFormTitle(titleText:String) {
        //label.font = Utility().getScaledFont(forFont: Font.FontName.DMSansRegular.rawValue, textStyle: .caption2)
        font = UIFont.customFont(.ExoSemiBold, size: 13.0)
        numberOfLines = 0
        text = titleText
        backgroundColor = .clear
        textColor = ColorManager.darkText.color
        adjustsFontForContentSizeCategory = false
        
        backgroundColor = ColorManager.titleBg.color
        
    }
    
    func setText(text: String, addStar: Bool) {
        
        let font: UIFont = UIFont.customFont(.ExoRegular, size: 12.0)
        
        let title = NSMutableAttributedString(string: text,
                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.8),
                                                           NSAttributedString.Key.font: font])
        
        if addStar {
            let asterix = NSAttributedString(string: " *", attributes: [.foregroundColor: ColorManager.textColor.color])
            title.append(asterix)
            
        }
        
        attributedText = title
    }
    
    func setNoDataLabelStyle() {
        font = UIFont.customFont(.ExoRegular, size: 12.0)
        textColor = ColorManager.darkText.color
    }
    
    func setRRCNo(number: String) {
        let rrcAttributedString = NSMutableAttributedString(string: "RRC No. - ",
                                                            attributes: [NSAttributedString.Key.font : UIFont.customFont(.ExoMedium, size: 16.0),
                                                                         NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        rrcAttributedString.append(NSAttributedString(string: number, attributes: [NSAttributedString.Key.font : UIFont.customFont(.ExoMedium, size: 16.0), NSAttributedString.Key.foregroundColor : ColorManager.greenTheme.color]))
        
        self.attributedText = rrcAttributedString
    }
}

extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        guard let attrString = label.attributedText else {
            return false
        }
        
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: .zero)
        let textStorage = NSTextStorage(attributedString: attrString)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
   
    
    
}
