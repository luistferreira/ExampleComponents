//
//  ExampleViewController.swift
//  Components
//
//  Created by Luis Ferreira on 20/09/21.
//

import UIKit

class CheckBoxViewController: UIViewController {
    
    private let checkBoxView = CheckBoxView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = checkBoxView
    }
}
