//
//  MedicineCellView.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 09/02/21.
//

import UIKit

class MedicineCellView: UIView {
    
    let name: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.text = "Medicine"
        name.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        name.numberOfLines = 0
        name.adjustsFontForContentSizeCategory = true
        return name
    }()

    let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: "ActionColor")
        view.layer.cornerRadius = 24
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "BackgroundColor")
        setupBackgroundView()
        setupNameLabel()
    }
    
    func setupBackgroundView() {
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.heightAnchor.constraint(equalToConstant: 80),
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    func setupNameLabel() {
        backgroundView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        name.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0).isActive = true
        name.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0).isActive = true
        name.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20).isActive = true
//        name.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        name.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
