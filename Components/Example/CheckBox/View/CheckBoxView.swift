//
//  ExampleView.swift
//  Components
//
//  Created by Luis Ferreira on 20/09/21.
//

import UIKit

final class CheckBoxView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8.0
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentDarkView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8.0
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var checkBox: CheckBox = {
        let checkBox = CheckBox(style: .light, isChecked: false)
        checkBox.setTitle("Check", for: .normal)
        checkBox.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return checkBox
    }()
    
    private lazy var checkBoxChecked: CheckBox = {
        let checkBox = CheckBox(style: .light, isChecked: true)
        checkBox.setTitle("Checked", for: .normal)
        checkBox.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return checkBox
    }()
    
    private lazy var checkBoxDark: CheckBox = {
        let checkBox = CheckBox(style: .dark, isChecked: false)
        checkBox.setTitle("Check", for: .normal)
        checkBox.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return checkBox
    }()
    
    private lazy var checkBoxCheckedDark: CheckBox = {
        let checkBox = CheckBox(style: .dark, isChecked: true)
        checkBox.setTitle("Checked", for: .normal)
        checkBox.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return checkBox
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        buildViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CheckBoxView: ViewCode {
    func buildHierarchy() {
        addSubview(contentView)
        contentView.addSubview(checkBox)
        contentView.addSubview(checkBoxChecked)
        
        addSubview(contentDarkView)
        contentDarkView.addSubview(checkBoxDark)
        contentDarkView.addSubview(checkBoxCheckedDark)
    }
    
    func buildConstraints() {
        setupCheckBoxLightConstraints()
        setupCheckBoxDarkConstraints()
    }
    
    func additionalSetup() {
        backgroundColor = .white
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBoxChecked.translatesAutoresizingMaskIntoConstraints = false
        checkBoxDark.translatesAutoresizingMaskIntoConstraints = false
        checkBoxCheckedDark.translatesAutoresizingMaskIntoConstraints = false
    }
}

private extension CheckBoxView {
    
    func setupCheckBoxLightConstraints() {
        contentView.topConstraint(parentView: self, constant: 200)
        contentView.centerXConstraint(parentView: self)
        contentView.heightConstraint(constant: 100)
        
        checkBox.leftConstraint(parentView: contentView, constant: 20)
        checkBox.centerYConstraint(parentView: contentView)
        checkBox.widthConstraint(constant: 150)
        checkBox.heightConstraint(constant: 24)
                
        checkBoxChecked.aside(leftItem: checkBox, constant: 20)
        checkBoxChecked.rightConstraint(parentView: contentView, constant: 20)
        checkBoxChecked.centerYConstraint(parentView: contentView)
        checkBoxChecked.widthConstraint(constant: 150)
        checkBoxChecked.heightConstraint(constant: 24)
    }
    
    func setupCheckBoxDarkConstraints() {
        contentDarkView.overConstraint(topItem: contentView, constant: 20)
        contentDarkView.centerXConstraint(parentView: self)
        contentDarkView.heightConstraint(constant: 100)
            
        checkBoxDark.leftConstraint(parentView: contentDarkView, constant: 20)
        checkBoxDark.centerYConstraint(parentView: contentDarkView)
        checkBoxDark.widthConstraint(constant: 150)
        checkBoxDark.heightConstraint(constant: 24)
            
        checkBoxCheckedDark.aside(leftItem: checkBoxDark, constant: 20)
        checkBoxCheckedDark.rightConstraint(parentView: contentDarkView, constant: 20)
        checkBoxCheckedDark.centerYConstraint(parentView: contentDarkView)
        checkBoxCheckedDark.widthConstraint(constant: 150)
        checkBoxCheckedDark.heightConstraint(constant: 24)
    }
}
