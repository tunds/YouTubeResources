//
//  ViewController.swift
//  CurrentValueSubject
//
//  Created by Tunde on 13/04/2021.
//

import UIKit

class ViewController: UIViewController {

    private let firstNameTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "First Name"
        txtField.borderStyle = .roundedRect
        return txtField
    }()
    
    private let lastNameTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Last Name"
        txtField.borderStyle = .roundedRect
        return txtField
    }()
    
    private let occupationTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Occupation"
        txtField.borderStyle = .roundedRect
        return txtField
    }()
    
    private let confirmBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(confirmDidTouch), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.setTitle("Confirm", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return btn
    }()
    
    private let formContainerStackVw: UIStackView = {
        let stackVw = UIStackView()
        stackVw.spacing = 16
        stackVw.axis = .vertical
        stackVw.distribution = .fillEqually
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        return stackVw
    }()
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    @objc
    func confirmDidTouch() {
        
    }
}

private extension ViewController {
    
    func setup() {
        
        formContainerStackVw.addArrangedSubview(firstNameTxtField)
        formContainerStackVw.addArrangedSubview(lastNameTxtField)
        formContainerStackVw.addArrangedSubview(occupationTxtField)
        formContainerStackVw.addArrangedSubview(confirmBtn)

        view.addSubview(formContainerStackVw)
        
        NSLayoutConstraint.activate([
            formContainerStackVw.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                          constant: 16),
            formContainerStackVw.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                          constant: -16),
            formContainerStackVw.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            formContainerStackVw.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        formContainerStackVw
            .arrangedSubviews
            .forEach { $0.heightAnchor.constraint(equalToConstant: 44).isActive = true }
    }
}
