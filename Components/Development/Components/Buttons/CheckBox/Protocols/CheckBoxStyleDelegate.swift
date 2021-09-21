//
//  CheckBoxStyleDelegate.swift
//  Components
//
//  Created by Luis Ferreira on 21/09/21.
//

import UIKit

protocol CheckBoxStyleDelegate {
    var titleColor: UIColor { get }
    var checkedImage: UIImage { get }
    var uncheckedImage: UIImage { get }
}

public protocol CheckBoxDelegate: AnyObject {
    func checked(_ button: CheckBox)
    func unchecked(_ button: CheckBox)
}
