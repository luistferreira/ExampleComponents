//
//  CheckBoxButton.swift
//  Components
//
//  Created by Luis Ferreira on 20/09/21.
//

import UIKit

public protocol CheckBoxDelegate: AnyObject {
    func checked(_ button: CheckBox)
    func unchecked(_ button: CheckBox)
}

open class CheckBox: UIButton {
    
    private var checkBoxStyle: CheckBoxStyle = .light
    private var isChecked: Bool = false
    
    public weak var delegate: CheckBoxDelegate?
    
    public init(frame: CGRect = .zero, style: CheckBoxStyle = .light, isChecked: Bool = false) {
            super.init(frame: frame)
            set(style, isChecked: isChecked)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        set(checkBoxStyle, isChecked: isChecked)
    }
    
    public func set(_ style: CheckBoxStyle, isChecked: Bool = false) {
        checkBoxStyle = style
        self.isChecked = isChecked
        configureStyle()
    }
    
    override open func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
    }
}

public extension CheckBox {
    func set(isChecked: Bool) {
        self.isChecked = isChecked
    }
    
    func checked() -> Bool {
        return isChecked
    }
}

private extension CheckBox {
    func configureStyle() {
        let token = checkBoxStyle.build()
        setTitleColor(token.titleColor, for: .normal)
        setImageState()
        addTarget(self, action: #selector(didPressed), for: .touchUpInside)
    }
    
    func setImageState() {
        let token = checkBoxStyle.build()
        let image = isChecked ? token.checkedImage : token.uncheckedImage
        setImage(image, for: .normal)
    }
    
    @objc
    func didPressed() {
        isChecked = !isChecked
        setImageState()
        
        isChecked ? delegate?.checked(self) : delegate?.unchecked(self)
    }
}
