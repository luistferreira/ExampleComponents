//
//  ViewController.swift
//  Components
//
//  Created by Luis Ferreira on 20/09/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawButton()
    }
    @IBAction func checkBoxAction(_ sender: Any) {
        let vc = CheckBoxViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

private extension ViewController {
    func drawButton() {
        checkBoxButton.layer.cornerRadius = 8.0
    }
}
