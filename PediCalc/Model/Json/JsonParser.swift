//
//  JsonParser.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 11/02/21.
//
// swiftlint:disable force_try

import Foundation

class JsonParser {
    
    var medicinesJson = "Medicines"
    
    func parsingMedicines() -> [JSMedicine] {
        
        let decoder = JSONDecoder()
        var medicines: [JSMedicine] = []
        
        do {
            if let bundlePath = Bundle.main.path(forResource: medicinesJson, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                medicines = try! decoder.decode([JSMedicine].self, from: jsonData)
                
                return medicines
            }
        } catch {
            print(error)
        }
        return medicines
    }
    
}
