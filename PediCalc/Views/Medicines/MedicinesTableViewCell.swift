//
//  MedicinesTableViewCell.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 09/02/21.
//

import UIKit

class MedicinesTableViewCell: UITableViewCell {
    
    let cellView = MedicineCellView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupCellView()
//        self.heightAnchor.constraint(equalToConstant: 78).isActive = true
    }
    
    func setupCellView() {
        addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        cellView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
