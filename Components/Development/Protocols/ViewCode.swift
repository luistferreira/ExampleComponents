//
//  ViewCode.swift
//  Components
//
//  Created by Luis Ferreira on 20/09/21.
//

import Foundation

protocol ViewCode: AnyObject {
    func buildHierarchy()
    func buildConstraints()
    func additionalSetup()
    func buildViewCode()
}

extension ViewCode {
    func buildViewCode() {
        buildHierarchy()
        buildConstraints()
        additionalSetup()
    }
    
    func additionalSetup() { }
}
