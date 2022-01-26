//
//  ViewController.swift
//  Assigning Subscriptions
//
//  Created by Tunde on 13/04/2021.
//

import UIKit
import Combine

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
    
    private var subscriptions = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        setup()
        createSubscriptions()
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
    
    func createSubscriptions() {
        
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidChangeNotification,
                       object: inputTxtField)
            .compactMap { ($0.object as? UITextField)?.text }
            .map { "The user entered: \($0)" }
            .assign(to: \.text, on: textLbl)
            .store(in: &subscriptions)
    }
}
