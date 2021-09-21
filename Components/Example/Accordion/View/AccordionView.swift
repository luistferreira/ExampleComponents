//
//  AccordionView.swift
//  Components
//
//  Created by Luis Ferreira on 21/09/21.
//

import UIKit

open class AccordionView: UIView {
    private let lightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let darkView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    // swiftlint:disable line_length
    private lazy var accordionLight: Accordion = {
        let label = UILabel()
        label.text = "Aliquam vel est lorem."
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let accordion = Accordion()
        accordion.delegate = self
        accordion.title = "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet"
        accordion.setContentView(view: label, withInset: UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24))

        return accordion
    }()

    public func toggleAccordions() {
        accordionDark.toggleState()
        accordionLight.toggleState()
    }
    
    private lazy var accordionDark: Accordion = {
        let label = UILabel()
        label.text = "Aliquam vel est lorem."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let accordion = Accordion(style: .dark)
        accordion.delegate = self
        accordion.tintColor = .white
        accordion.title = "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet"
        accordion.setContentView(view: label, withInset: UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24))

        return accordion
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewCode()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildViewCode()
    }
}

extension AccordionView: AccordionDelegate {
    public func didOpen(accordion: Accordion) {}
    public func didClose(accordion: Accordion) {}
}

extension AccordionView: ViewCode {
    func buildHierarchy() {
        addSubview(lightView)
        addSubview(darkView)
        lightView.addSubview(accordionLight)
        darkView.addSubview(accordionDark)
    }
    
    func buildConstraints() {
        lightView.topConstraint(parentView: self)
        lightView.leftConstraint(parentView: self)
        lightView.rightConstraint(parentView: self)
        lightView.heightConstraintEqualTo(parentView: self, multiplier: 0.5)
        
        darkView.overConstraint(topItem: lightView)
        darkView.leftConstraint(parentView: self)
        darkView.rightConstraint(parentView: self)
        darkView.heightConstraintEqualTo(parentView: self, multiplier: 0.5)
        
        accordionLight.centerYConstraint(parentView: lightView, constant: 50)
        accordionLight.leftConstraint(parentView: lightView, constant: 24)
        accordionLight.rightConstraint(parentView: lightView, constant: 24)
        
        accordionDark.centerYConstraint(parentView: darkView, constant: -40)
        accordionDark.leftConstraint(parentView: darkView, constant: 24)
        accordionDark.rightConstraint(parentView: darkView, constant: 24)
    }
    
    func additionalSetup() {
        backgroundColor = .white
    }
}
