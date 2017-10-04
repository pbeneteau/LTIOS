//
//  Labels.swift
//  LTios
//
//  Created by Paul Bénéteau on 04/10/2017.
//  Copyright © 2017 Tastyapp. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        textColor = TextColor.Dark.title
        textAlignment = .center
        font = Font.regular.title
    }
}

class DescriptionLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        textColor = TextColor.Dark.text
        textAlignment = .center
        font = Font.regular.text
        numberOfLines = 10
    }
}

class NameLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        textColor = TextColor.Dark.text
        textAlignment = .justified
        font = Font.regular.bigText
    }
}
