//
//  JsonModels.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 11/02/21.
//

import Foundation

struct JSMedicine: Codable {
    let name: String
    let dose: [String]
    let dilution: String
    let redilution: String
    let notes: String
}
