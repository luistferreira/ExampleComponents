//
//  AccordionViewController.swift
//  Components
//
//  Created by Luis Ferreira on 21/09/21.
//

import UIKit

class AccordionViewController: UIViewController {

    private let accordionView = AccordionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = accordionView
    }

}
