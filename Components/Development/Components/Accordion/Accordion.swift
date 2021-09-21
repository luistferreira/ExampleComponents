//
//  Accordion.swift
//  Components
//
//  Created by Luis Ferreira on 21/09/21.
//

import UIKit

public protocol AccordionDelegate: AnyObject {
    func didOpen(accordion: Accordion)
    func didClose(accordion: Accordion)
}

open class Accordion: UIView {
    public weak var delegate: AccordionDelegate?
    
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = style.build().defaultBackgroundColor
        view.accessibilityIdentifier = "accordion_vw"
        
        return view
    }()
    
    private lazy var sideBarView: UIView = {
        let sideBarView = UIView()
        sideBarView.backgroundColor = style.build().sideBarColor
        sideBarView.isHidden = true
        sideBarView.accessibilityIdentifier = "accordion_side_bar_vw"
        return sideBarView
    }()
    
    private let divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .blue
        divider.isHidden = true
        divider.accessibilityIdentifier = "accordion_divider_vw"
        return divider
    }()
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleState))
        tap.numberOfTapsRequired = 1
        return tap
    }()
    
    private lazy var titleIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = style.build().plusIcon
        imageView.accessibilityIdentifier = "accordion_icon_im"
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = style.build().textColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.accessibilityIdentifier = "accordion_title_lb"
        return label
    }()
    
    private let contentView: UIView = {
        let detailView = UIView()
        detailView.backgroundColor = .clear
        detailView.isHidden = true
        detailView.accessibilityIdentifier = "accordion_detail_vw"
        return detailView
    }()
    
    public var title: String? {
        didSet {
            self.titleLabel.text = self.title
        }
    }
    
    public var icon: UIImage? {
        didSet {
            self.titleIcon.image = self.icon
        }
    }

    public func setContentView(view: UIView, withInset inset: UIEdgeInsets? = nil) {
        self.contentView.subviews.forEach { $0.removeFromSuperview() }
        self.contentView.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetConstraints(inSuperview: contentView, withInset: inset)
    }
    
    private(set) var isOpen: Bool = false
    private var style: GregAccordionStyle = .light
    
    // MARK: - Initialization
    public init(frame: CGRect = .zero, style: GregAccordionStyle = .light) {
        super.init(frame: frame)
        self.style = style
        configureStyle()
        buildViewCode()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder:) has not been implemented")
    }

    @objc
    public func toggleState() {
        isOpen.toggle()
        isOpen ? delegate?.didOpen(accordion: self) : delegate?.didClose(accordion: self)

        sideBarView.isHidden.toggle()
        divider.isHidden.toggle()
        contentView.isHidden.toggle()

        titleIcon.image = sideBarView.isHidden ? style.build().plusIcon : style.build().minusIcon

        titleView.backgroundColor = sideBarView.isHidden ? style.build().defaultBackgroundColor : style.build().openBackgroundColor
    }
}

// MARK: - Setting up style
private extension Accordion {
    func configureStyle() {
    }
}

extension Accordion: ViewCode {
    public func buildHierarchy() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(titleView)
        titleView.addSubview(titleLabel)
        titleView.addSubview(titleIcon)
        titleView.addSubview(sideBarView)
        containerStackView.addArrangedSubview(divider)
        containerStackView.addArrangedSubview(contentView)
    }
    
    public func buildConstraints() {
        containerStackView.insetConstraints(inSuperview: self)
        
        titleView.leftConstraint(parentView: containerStackView)
        titleView.rightConstraint(parentView: containerStackView)
        
        titleLabel.topConstraint(parentView: titleView, constant: 20)
        titleLabel.leftConstraint(parentView: titleView, constant: 24)
        titleLabel.bottomConstraint(parentView: titleView, constant: 20)
        titleLabel.heightConstraint(constant: 24, relatedBy: .greaterThanOrEqual)
        
        titleIcon.widthConstraint(constant: 24)
        titleIcon.heightConstraint(constant: 24)
        titleIcon.aside(leftItem: titleLabel, constant: 16)
        titleIcon.rightConstraint(parentView: titleView, constant: 16)
        titleIcon.topConstraint(parentView: titleView, constant: 20)
        
        sideBarView.widthConstraint(constant: 4)
        sideBarView.topConstraint(parentView: titleView)
        sideBarView.rightConstraint(parentView: titleView)
        sideBarView.bottomConstraint(parentView: titleView)
        
        divider.heightConstraint(constant: 1)
        divider.leftConstraint(parentView: containerStackView)
        divider.rightConstraint(parentView: containerStackView)
    }
    
    public func additionalSetup() {
        titleView.addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleIcon.translatesAutoresizingMaskIntoConstraints = false
        sideBarView.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}
