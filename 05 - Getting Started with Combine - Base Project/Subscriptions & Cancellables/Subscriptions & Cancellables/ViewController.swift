//
//  ViewController.swift
//  Subscriptions & Cancellables
//
//  Created by Tunde on 13/04/2021.
//

import UIKit

class ViewController: UIViewController {

    private let countLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "00:00"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 50, weight: .heavy)
        return lbl
    }()
    
    private let startBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.setTitle("Start", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return btn
    }()
    
    private let stopBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.setTitle("Stop", for: .normal)
        btn.backgroundColor = .systemGray5
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return btn
    }()
    
    private let btnContainerStackVw: UIStackView = {
        let stackVw = UIStackView()
        stackVw.spacing = 8
        stackVw.distribution = .fillEqually
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        return stackVw
    }()
        
    override func loadView() {
        super.loadView()
        setup()
    }
    
    @objc
    func startTimer() {
        print("Start")
        
    }
    
    @objc
    func stopTimer() {
        print("Stop")
    }
}

private extension ViewController {
    
    func setup() {
        
        btnContainerStackVw.addArrangedSubview(startBtn)
        btnContainerStackVw.addArrangedSubview(stopBtn)
        
        view.addSubview(btnContainerStackVw)
        view.addSubview(countLbl)
        
        NSLayoutConstraint.activate([
            
            countLbl.leadingAnchor.constraint(equalTo: btnContainerStackVw.leadingAnchor),
            countLbl.trailingAnchor.constraint(equalTo: btnContainerStackVw.trailingAnchor),
            countLbl.bottomAnchor.constraint(equalTo: btnContainerStackVw.topAnchor,
                                             constant: -24),

            
            btnContainerStackVw.heightAnchor.constraint(equalToConstant: 50),
            btnContainerStackVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btnContainerStackVw.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnContainerStackVw.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                         constant: 16),
            btnContainerStackVw.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                         constant: -16),
        ])
    }
}

// Taken from: https://stackoverflow.com/questions/26794703/swift-integer-conversion-to-hours-minutes-seconds
extension Int {

    var format: String {

        let (h,m,s) = (self / 3600, (self % 3600) / 60, (self % 3600) % 60)

        let h_string = h < 10 ? "0\(h)" : "\(h)"
        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        let s_string =  s < 10 ? "0\(s)" : "\(s)"

        return "\(h_string):\(m_string):\(s_string)"
    }
}
