//
//  JsonParser.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 11/02/21.
//
// swiftlint:disable force_try

import Foundation

enum JSONParserError: Error {

    case badJson
}

class JsonParser {
    
    var medicinesJson = "Medicines"
    
    func parsingMedicines() throws -> [JSMedicine] {
        
        let decoder = JSONDecoder()
        var medicines: [JSMedicine] = []
        
        do {
            if let bundlePath = Bundle.main.path(forResource: medicinesJson, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                medicines = try! decoder.decode([JSMedicine].self, from: jsonData)
                
                return medicines
            }
        } catch {
            throw JSONParserError.badJson
        }
        return medicines
    }
    
}
