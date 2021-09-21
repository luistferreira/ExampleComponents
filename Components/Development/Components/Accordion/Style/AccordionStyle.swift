//
//  AccordionStyle.swift
//  Components
//
//  Created by Luis Ferreira on 21/09/21.
//

import UIKit

public enum GregAccordionStyle: Int {
    case light = 0
    case dark
    
    public init(rawValue: Int) {
        switch rawValue {
        case 0: self = .light
        case 1: self = .dark
            
        default: self = .light
        }
    }
    
    func build() -> AccordionProtocol {
        switch self {
        case .light:
            return AccordionStyleLight()
        case .dark:
            return AccordionStyleDark()
        }
    }
}

struct AccordionStyleLight: AccordionProtocol {
    var defaultBackgroundColor: UIColor = .lightGray
    var openBackgroundColor: UIColor = .lightGray
    var textColor: UIColor = .black
    var borderColor: UIColor = .black
    var plusIcon: UIImage = UIImage(named: "plus") ?? UIImage()
    var minusIcon: UIImage = UIImage(named: "minus") ?? UIImage()
    var sideBarColor: UIColor = .black
}

struct AccordionStyleDark: AccordionProtocol {
    var defaultBackgroundColor: UIColor = .white
    var openBackgroundColor: UIColor = .white
    var textColor: UIColor = .black
    var borderColor: UIColor = .black
    var plusIcon: UIImage = UIImage(named: "plus") ?? UIImage()
    var minusIcon: UIImage = UIImage(named: "minus") ?? UIImage()
    var sideBarColor: UIColor = .white
}
