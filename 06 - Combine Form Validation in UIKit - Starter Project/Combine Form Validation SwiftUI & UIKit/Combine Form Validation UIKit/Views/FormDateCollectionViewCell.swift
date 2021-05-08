//
//  FormDateCollectionViewCell.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import UIKit

class FormDateCollectionViewCell: UICollectionViewCell {
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private lazy var errorLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.systemRed
        lbl.text = " "
        return lbl
    }()
    
    private lazy var contentStackVw: UIStackView = {
        let stackVw = UIStackView()
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        stackVw.axis = .vertical
        stackVw.spacing = 8
        return stackVw
    }()
    
    private var item: DateFormComponent?
    private var indexPath: IndexPath?
    
    func bind(_ item: FormComponent,
              at indexPath: IndexPath) {
        guard let item = item as? DateFormComponent else { return }
        self.item = item
        self.indexPath = indexPath
        setup(item: item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeViews()
        item = nil
        indexPath = nil
    }
}

private extension FormDateCollectionViewCell {
    
    func setup(item: DateFormComponent) {
        
        datePicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)

        datePicker.datePickerMode = .date
        
        contentView.addSubview(contentStackVw)
        
        contentStackVw.addArrangedSubview(datePicker)
        contentStackVw.addArrangedSubview(errorLbl)

        NSLayoutConstraint.activate([
            contentStackVw.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackVw.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            contentStackVw.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackVw.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    @objc func datePickerChanged(picker: UIDatePicker) {

        guard let indexPath = indexPath,
              let item = item else { return }

    }
}
