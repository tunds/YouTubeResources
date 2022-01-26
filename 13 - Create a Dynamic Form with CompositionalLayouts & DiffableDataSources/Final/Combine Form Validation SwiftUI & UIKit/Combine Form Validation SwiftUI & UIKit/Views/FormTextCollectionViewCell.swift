//
//  FormTextCollectionViewCell.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import UIKit

class FormTextCollectionViewCell: UICollectionViewCell {

    private lazy var txtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.layer.cornerRadius = 10
        txtField.layer.borderWidth = 1
        txtField.layer.borderColor = UIColor.systemGray5.cgColor
        return txtField
    }()

    func bind(_ item: FormComponent) {
        guard let item = item as? TextFormComponent else { return }
        setup(item: item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeViews()
    }
}

private extension FormTextCollectionViewCell {
    
    func setup(item: TextFormComponent) {
        
        // Setup
        txtField.placeholder = " \(item.placeholder)"
        txtField.keyboardType = item.keyboardType
        
        // Layout
        
        contentView.addSubview(txtField)
        
        NSLayoutConstraint.activate([
            txtField.heightAnchor.constraint(equalToConstant: 44),
            txtField.topAnchor.constraint(equalTo: contentView.topAnchor),
            txtField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            txtField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            txtField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
        
    }
}
