//
//  MedicinesViewController.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 05/02/21.
//

import UIKit

class MedicinesViewController: UIViewController {

    let medicinesView = MedicinesView()
    let cdManager = CDManager()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        let listUnsortedMedicine = cdManager.listMedicines()
        medicinesView.medicines = listUnsortedMedicine.sorted(by: { $0.name! < $1.name! })
        DispatchQueue.main.async {
            self.medicinesView.tableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        self.title = "Medicamentos"
        
        medicinesView.rootViewController = self.navigationController
        
        setupSearchBar()
        setupMedicineView()
    }
    
    func setupMedicineView() {
        view.addSubview(medicinesView)
        medicinesView.translatesAutoresizingMaskIntoConstraints = false
        
        medicinesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        medicinesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        medicinesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        medicinesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

}

extension MedicinesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let nameToSearch = searchController.searchBar.text else { return }
        
        medicinesView.tableView.reloadData()
        
        if !nameToSearch.isEmpty {
            let toOrderList = cdManager.requestMedicineByName(nome: nameToSearch)
            medicinesView.medicines = toOrderList.sorted(by: { $0.name! < $1.name! })
            medicinesView.tableView.reloadData()
        } else {
            let toOrderList = cdManager.listMedicines()
            medicinesView.medicines = toOrderList.sorted(by: { $0.name! < $1.name! })
            medicinesView.tableView.reloadData()
        }
        
    }
    
    func setupSearchBar() {
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(named: "ActionColor")]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes as [NSAttributedString.Key : Any] , for: .normal)
        UISearchBar.appearance().tintColor = UIColor.init(named: "ActionColor")
        UISearchBar.appearance().backgroundColor = UIColor(named: "PrimaryColor")
        let search = UISearchController(searchResultsController: nil)
        
        search.searchBar.searchTextField.textColor = UIColor.init(named: "ActionColor")
        search.searchBar.setValue("Cancelar", forKey: "cancelButtonText")
        search.searchBar.placeholder = "Pesquisar"
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        self.navigationItem.searchController = search
        
    }
    
}
