//
//  JsonParserTests.swift
//  PediCalcTests
//
//  Created by Leonardo Gomes Fernandes on 17/02/21.
//

import UIKit
import XCTest

@testable import PediCalc

class JsonParserTests: XCTestCase {
    
    func test_JsonParser_parsingMedicines_ArrayFull() throws {
        // Given
        let jsonParser = JsonParser()
        
        // When
        let alimentosJS = jsonParser.parsingMedicines()
        
        // Then
        XCTAssertNotNil(alimentosJS)
    }
    
    func test_JsonParser_parsingAlimentos_EmptyArray() throws {
        // Given
        let jsonParser = JsonParser()
        jsonParser.medicinesJson = "aleatorio"
        
        // When
        let alimentosJS = jsonParser.parsingMedicines()
        
        // Then
        XCTAssertTrue(alimentosJS.isEmpty)
    }
}
