//
//  CheckBoxView.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import UIKit

class CheckBoxField: CustomView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var optionBGView: UIView!
    
//    var answers: [Answers] = []

    var options: [CheckBoxOption] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadSubviews() {
        Bundle.main.loadNibNamed("CheckBoxField", owner: self, options: nil)
        if let cbannerView = self.contentView {
            self.addSubview(cbannerView)
            
            cbannerView.fillSuperview()
        }
        setupSubviews()
    }
    
    var verticalStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.alignment = .fill
//        stackView.distribution = .fill
        return stackView
    }()
    
    func setupSubviews() {
        titleLabel.setTitle(title: "")
        contentView.backgroundColor = .clear
        self.popView.backgroundColor = .clear
        
        self.optionBGView.addSubview(verticalStackView)
        
        verticalStackView.fillSuperview()
    }
    
    func newHorizontalStack() -> UIStackView {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
//        horizontalStack.alignment = .leading
        horizontalStack.distribution = .fillEqually
        horizontalStack.spacing = 10
        return horizontalStack
    }
    
    var allButtons: [CheckBoxButton] = []
    
    fileprivate func addCheckBoxButton(_ item: CheckBoxOption, _ currentStack: UIStackView!) {
        let checkBox = CheckBoxButton()
        checkBox.set(option: item)
        
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        checkBox.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        allButtons.append(checkBox)
        
        currentStack!.addArrangedSubview(checkBox)
    }
    
    func update() {
        allButtons = []
        
        var currentStack: UIStackView!
        
        for (no, item) in options.enumerated() {
            
            if no % 1 == 0 {
                currentStack = newHorizontalStack()
                verticalStackView.addArrangedSubview(currentStack)
                
                addCheckBoxButton(item, currentStack)
            } else {
                addCheckBoxButton(item, currentStack)
            }
        }
    }
    
    private var handler: ((_ checkedOption: CheckBoxOption) -> ())?
    
    func checked(handler: ((_ checkedOption: CheckBoxOption) -> ())? = nil) {
        
        self.handler = handler
    }
    
    @objc func buttonTapped(_ sender: CheckBoxButton) {
        print(sender.option?.title ?? "")
        print(sender.option?.identifier ?? "")
        
        allButtons.forEach({
            if $0 == sender {
                $0.isSelected = true
            } else {
                $0.isSelected = false
            }
        })
        
        if let handler = handler {
            handler(sender.option!)
        }
    }
    
}
