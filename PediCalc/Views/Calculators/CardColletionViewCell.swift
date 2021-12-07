//
//  CardColletionViewCell.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 05/02/21.
//

import UIKit

class CardColletionViewCell: UICollectionViewCell {
    
    let newView : UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: 0)))
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 24
        return view
    }()
    
    var calcView: UIView? {
        didSet {
            setupContentView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "PrimaryColor")
        layer.cornerRadius = 24
//        setupContentView()
    }
    
    func setupContentView() {
    
        guard let calculatorView = calcView else { return }
        contentView.addSubview(calculatorView)
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calculatorView.topAnchor.constraint(equalTo: contentView.topAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            calculatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
