//
//  PhotoTableViewCell.swift
//  PhotoTableViewCell
//
//  Created by Tunde on 20/09/2021.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    static let cellId = "PhotoTableViewCell"
    
    private(set) var imgVw: UIImageView = {
        let imgVw = UIImageView(image: nil)
        imgVw.translatesAutoresizingMaskIntoConstraints = false
        imgVw.backgroundColor = .gray
        imgVw.contentMode = .scaleAspectFit
        return imgVw
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PhotoTableViewCell {
    
    func setup() {
        self.contentView.addSubview(imgVw)
        NSLayoutConstraint.activate([
            imgVw.heightAnchor.constraint(equalToConstant: 150),
            imgVw.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgVw.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imgVw.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgVw.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
