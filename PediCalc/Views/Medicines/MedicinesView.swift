//
//  MedicinesView.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 08/02/21.
//

import UIKit

class MedicinesView: UIView {
    
    var rootViewController: UINavigationController?

    var medicines: [Medicine] = []
    
    let segmented: UISegmentedControl = {
        let segmentItems = ["Todas", "Salvas"]
        let control = UISegmentedControl(items: segmentItems)
        control.addTarget(MedicinesView.self, action: #selector(segmentControl(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0
        control.backgroundColor = UIColor(named: "BackgorundColor")
        control.selectedSegmentTintColor = UIColor(named: "ActionColor")
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        return control
    }()
 
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = true
        table.backgroundColor = UIColor(named: "BackgroundColor")
        table.estimatedRowHeight = UITableView.automaticDimension
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "BackgroundColor")
        tableView.register(MedicinesTableViewCell.self, forCellReuseIdentifier: "MedicineCell")
//        setupSegmentedConstraints()
        setupTableViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            // First segment tapped
            break
        case 1:
            // Second segment tapped
            break
        default:
            break
        }
    }

    func setupSegmentedConstraints() {
        addSubview(segmented)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmented.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            segmented.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmented.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.90)
        ])
    }

    func setupTableViewConstraints() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: segmented.bottomAnchor, constant: 10),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        tableView.rowHeight = 78
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension MedicinesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedicineCell", for: indexPath) as? MedicinesTableViewCell else { return UITableViewCell() }
        
        cell.cellView.name.text = medicines[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = MedicineDescriptionViewController()
        viewController.descriptionView.medicine = medicines[indexPath.row]
        rootViewController?.pushViewController(viewController, animated: true)
    }

}
