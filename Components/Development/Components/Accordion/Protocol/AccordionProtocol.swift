//
//  AccordionProtocol.swift
//  Components
//
//  Created by Luis Ferreira on 21/09/21.
//

import UIKit

protocol AccordionProtocol {
    var defaultBackgroundColor: UIColor { get }
    var openBackgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var borderColor: UIColor { get }
    var plusIcon: UIImage { get }
    var minusIcon: UIImage { get }
    var sideBarColor: UIColor { get }
}
