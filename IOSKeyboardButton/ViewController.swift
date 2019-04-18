//
//  ViewController.swift
//  IOSKeyboardButton
//
//  Created by Magnus Jensen on 18/04/2019.
//  Copyright © 2019 Magnus Jensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.82, green: 0.83, blue: 0.85, alpha: 1.00)
        
        let zero = makeButton(with: "0", and: NormalKeyButtonFormatter())
        zero.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(zero)
        
        let one = makeButton(with: "1", and: SpecielKeyButtonFormatter())
        one.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        view.addSubview(one)
        
    }

    private func makeButton(with title: CustomStringConvertible, and formatter: KeyboardButtonFormatter) -> KeyboardButton {
        let button = KeyboardButton(title: title, formatter: formatter)
        button.delegate = self
        return button
    }

}

extension ViewController: KeyboardButtonDelegate {
    func keyWasHit(_ button: KeyboardButton) {
        guard let title = button.titleLabel?.text else {
            return
        }
        
        let alert = UIAlertController(title: "Hit", message: "The key \(title) was hit", preferredStyle: .alert)
        alert.addAction(.init(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
