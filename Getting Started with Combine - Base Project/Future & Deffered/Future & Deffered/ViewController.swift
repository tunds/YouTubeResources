//
//  ViewController.swift
//  Future & Deffered
//
//  Created by Tunde on 13/04/2021.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private let permissionLbl: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.text = "Status: Unknown"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let permissionBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(permissionBtnDidTouch), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.setTitle("Ask Permission", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return btn
    }()
    
    private let contentContainerStackVw: UIStackView = {
        let stackVw = UIStackView()
        stackVw.spacing = 16
        stackVw.axis = .vertical
        stackVw.distribution = .fillProportionally
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        return stackVw
    }()
    
    override func loadView() {
        super.loadView()
        setup()
    }

    @objc
    func permissionBtnDidTouch() {

    }
}

private extension ViewController {
    
    func setup() {
        
        contentContainerStackVw.addArrangedSubview(permissionLbl)
        contentContainerStackVw.addArrangedSubview(permissionBtn)

        view.addSubview(contentContainerStackVw)
        
        NSLayoutConstraint.activate([
            permissionBtn.heightAnchor.constraint(equalToConstant: 44),
            contentContainerStackVw.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                             constant: 16),
            contentContainerStackVw.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                              constant: -16),
            
            contentContainerStackVw.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentContainerStackVw.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
