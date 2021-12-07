//
//  MedicineDescriptionViewController.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 12/02/21.
//

import UIKit

class MedicineDescriptionViewController: UIViewController {
    
    let descriptionView = MedicineDescriptionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "BackgroundColor")
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.backItem?.title = "Voltar"
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        self.title = "Medicamento"
        // Do any additional setup after loading the view.
        
        setupDescriptionView()
    }
    
    func setupDescriptionView() {
        view.addSubview(descriptionView)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            descriptionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

}
