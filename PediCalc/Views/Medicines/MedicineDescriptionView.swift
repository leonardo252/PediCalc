//
//  MedicineDescriptionView.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 12/02/21.
//
// swiftlint:disable function_body_length

import UIKit

class MedicineDescriptionView: UIView {
    
    var medicine: Medicine?
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "BackgroundColor")
        configTableView()
    }
    
    func configTableView() {
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MedicineDescriptionView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // Name
        case 1:
            return 1 // Dose
        case 2:
            return medicine?.dose?.count ?? 0 // Doses
        case 3:
            return 1 // Diluicao
        case 4:
            return 1 // a diluicao
        case 5:
            return 1 // Rediluicao
        case 6:
            return 1 // a rediluicao
        case 7:
            return 1 // Notas
        case 8:
            return 1 // as notas
        case 9:
            return 1 // NOta de bula
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 28, weight: .bold)
            cell.textLabel?.text = medicine?.name ?? "Remedio"
            cell.textLabel?.numberOfLines = 0
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            cell.textLabel?.text = "Dose"
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            cell.textLabel?.numberOfLines = 0
            let dose = medicine?.dose![indexPath.row]
            cell.textLabel?.text = dose
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            cell.textLabel?.text = "Diluição"
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            cell.textLabel?.numberOfLines = 0
            let diluition = medicine?.dilution
            cell.textLabel?.text = diluition
            cell.selectionStyle = .none
            return cell
        case 5:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            cell.textLabel?.text = "Rediluição"
            cell.selectionStyle = .none
            return cell
        case 6:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            cell.textLabel?.numberOfLines = 0
            let rediluition = medicine?.redilution
            cell.textLabel?.text = rediluition
            cell.selectionStyle = .none
            return cell
        case 7:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            cell.textLabel?.text = "Nota"
            cell.selectionStyle = .none
            return cell
        case 8:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            cell.textLabel?.numberOfLines = 0
            let note = medicine?.notes
            cell.textLabel?.text = note
            cell.selectionStyle = .none
            return cell
        case 9:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            cell.textLabel?.textColor = .red
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "Vide a bula para mais informações"
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
