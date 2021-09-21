//
//  CheckBoxStyle.swift
//  Components
//
//  Created by Luis Ferreira on 20/09/21.
//

import Foundation
import UIKit

@objc
public enum CheckBoxStyle: Int {
    case light = 0
    case dark
    
    public init(rawValue: Int) {
        switch rawValue {
        case 0: self = .light
        case 1: self = .dark
        
        default: self = .light
        }
    }
    
    func build() -> CheckBoxStyleDelegate {
        switch self {
        case .light:
            return CheckBoxStyleLight()
        case .dark:
            return CheckBoxStyleDark()
        }
    }
}

protocol CheckBoxStyleDelegate {
    var titleColor: UIColor { get }
    var checkedImage: UIImage { get }
    var uncheckedImage: UIImage { get }
}

struct CheckBoxStyleLight: CheckBoxStyleDelegate {
    
    var titleColor: UIColor = .black
    
    var checkedImage: UIImage = UIImage(named: "checkbox") ?? UIImage()
    
    var uncheckedImage: UIImage = UIImage(named: "box") ?? UIImage()
}

struct CheckBoxStyleDark: CheckBoxStyleDelegate {
    
    var titleColor: UIColor = .white
    
    var checkedImage: UIImage = UIImage(named: "checkbox") ?? UIImage()
    
    var uncheckedImage: UIImage = UIImage(named: "box") ?? UIImage()
}
