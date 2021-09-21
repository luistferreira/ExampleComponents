//
//  ViewController.swift
//  Components
//
//  Created by Luis Ferreira on 20/09/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var accordionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawButton(8.0)
    }
    @IBAction func checkBoxAction(_ sender: Any) {
        let vc = CheckBoxViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func accordionAction(_ sender: Any) {
        let vc = AccordionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

private extension ViewController {
    func drawButton(_ radius: CGFloat) {
        checkBoxButton.layer.cornerRadius = radius
        accordionButton.layer.cornerRadius = radius
    }
}
