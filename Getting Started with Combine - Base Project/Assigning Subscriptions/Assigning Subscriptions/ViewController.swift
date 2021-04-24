//
//  ViewController.swift
//  Assigning Subscriptions
//
//  Created by Tunde on 13/04/2021.
//

import UIKit

class ViewController: UIViewController {

    private let inputTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Enter some text here"
        txtField.borderStyle = .roundedRect
        return txtField
    }()
    
    private let textLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "The user entered:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 24, weight: .semibold)
        return lbl
    }()
        
    override func loadView() {
        super.loadView()
        setup()
    }
}

private extension ViewController {
    
    func setup() {
        
        view.addSubview(inputTxtField)
        view.addSubview(textLbl)
        
        NSLayoutConstraint.activate([
            inputTxtField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputTxtField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputTxtField.heightAnchor.constraint(equalToConstant: 44),
            inputTxtField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 8),
            textLbl.topAnchor.constraint(equalTo: inputTxtField.bottomAnchor,
                                         constant: 16),
            textLbl.leadingAnchor.constraint(equalTo: inputTxtField.leadingAnchor),
            textLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                              constant: -8)
        ])
    }
}
