//
//  CoreDataManagerTests.swift
//  PediCalcTests
//
//  Created by Leonardo Gomes Fernandes on 17/02/21.
//

import UIKit
import XCTest

@testable import PediCalc

class CoreDataManagerTests: XCTestCase {
    
    func test_CDManager_saveContext_true() throws {
        // Given
        let cdManager = CDManager()
        
        // When
        let resultSaveContx = cdManager.saveContext()
        
        // Then
        XCTAssertTrue(resultSaveContx)
    }
    
    func test_CDManager_saveMedicine_true() throws {
        // Given
        let cdManager = CDManager()
        let medicine = JSMedicine(name: "Name", dose: ["Dose"], dilution: "Dilution", redilution: "Redilution", notes: "Notes")
        
        // When
        let resultSaveMed = cdManager.saveMedicine(jsMedicine: medicine)
        
        // Then
        XCTAssertTrue(resultSaveMed)
    }
    
    func test_CDManager_populateMedicines_true() throws {
        // Given
        let cdManager = CDManager()
        let medicine = JSMedicine(name: "Name", dose: ["Dose"], dilution: "Dilution", redilution: "Redilution", notes: "Notes")
        let litsMedicine = [medicine, medicine,medicine]
        
        // When
        let resultSaveListMed = cdManager.populateMedicines(medicines: litsMedicine)
        
        // Then
        XCTAssertTrue(resultSaveListMed)
    }
    
    func test_CDManager_requestMedicineByName_listMedicines() throws {
        // Given
        let cdManager = CDManager()
        let medicineName = "Diazepam"
        
        // When
        let mediceListResult = cdManager.requestMedicineByName(nome: medicineName)
        
        // Then
        XCTAssertEqual(mediceListResult[0].name, medicineName)
    }
    
    func test_CDManager_listMedicines_listMedicines() throws {
        // Given
        let cdManager = CDManager()
        
        // When
        let mediceListResult = cdManager.listMedicines()
        
        // Then
        XCTAssertNotNil(mediceListResult)
    }
    
}
