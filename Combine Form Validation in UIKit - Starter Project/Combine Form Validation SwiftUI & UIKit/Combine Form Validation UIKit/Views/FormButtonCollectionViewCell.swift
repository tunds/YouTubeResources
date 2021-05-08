//
//  FormButtonCollectionViewCell.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import UIKit

class FormButtonCollectionViewCell: UICollectionViewCell {

    private lazy var actionBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return btn
    }()
    
    private var item: ButtonFormItem?

    func bind(_ item: FormComponent) {
        guard let item = item as? ButtonFormItem else { return }
        self.item = item
        setup(item: item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeViews()
        item = nil
    }
}

private extension FormButtonCollectionViewCell {
    
    func setup(item: ButtonFormItem) {
        
        actionBtn.addTarget(self, action: #selector(actionDidTap), for: .touchUpInside)
        actionBtn.setTitle(item.title, for: .normal)

        contentView.addSubview(actionBtn)
        
        NSLayoutConstraint.activate([
            actionBtn.heightAnchor.constraint(equalToConstant: 44),
            actionBtn.topAnchor.constraint(equalTo: contentView.topAnchor),
            actionBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            actionBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            actionBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    @objc
    func actionDidTap() {
        
        guard let item = item else { return }
        
    }
}
