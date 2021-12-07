//
//  UITabBarViewController.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 05/02/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let calculators = UINavigationController(rootViewController: CalculatorsViewController())
//        alimentos.tabBarItem = UITabBarItem(title: "Alimentos", image: UIImage(named: "lista_icon"), tag: 0)
        calculators.tabBarItem = UITabBarItem(title: "Calculadoras", image: UIImage(named: "Calculator"), tag: 0)
        calculators.tabBarItem.title = "Calculadoras"

        let medicines = UINavigationController(rootViewController: MedicinesViewController())
        medicines.tabBarItem = UITabBarItem(title: "Medicamentos", image: UIImage(named: "Medicines"), tag: 1)
        
        let tabBarList = [calculators, medicines]
        setupStyle()
        viewControllers = tabBarList
    }

    func setupStyle() {
        tabBar.tintColor = UIColor.init(named: "ActionColor")
        tabBar.unselectedItemTintColor = UIColor.init(named: "UnselectItem")
        tabBar.barTintColor = UIColor(named: "PrimaryColor")
        tabBar.isTranslucent = false
    }

    func removeSeparetor() {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
