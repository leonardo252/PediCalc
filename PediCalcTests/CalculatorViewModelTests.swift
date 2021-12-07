//
//  CalculatorViewModelTests.swift
//  PediCalcTests
//
//  Created by Leonardo Gomes Fernandes on 17/02/21.
//

import UIKit
import XCTest

@testable import PediCalc

class CalculatorViewModelTests: XCTestCase {
    
    func test_calculateBodySurface_bodySurface() throws {
        // Given
        let measures = BodySurface(weight: "10", height: "70", bodySuface: 0)
        let ViewModel = CalculatorsViewModel(measures: measures)
        let result: Float = 0.41597044
        
        // When
        ViewModel.calculateBodySurface()
        
        // Then
        XCTAssertEqual(ViewModel.bodySurface.bodySuface, result)
    }
    
    func test_calculateBodySurface_bodySurfaceWrong() throws {
        // Given
        let measures = BodySurface(weight: "10", height: "85", bodySuface: 0)
        let ViewModel = CalculatorsViewModel(measures: measures)
        let result: Float = 0.41597044
        
        // When
        ViewModel.calculateBodySurface()
        
        // Then
        XCTAssertNotEqual(ViewModel.bodySurface.bodySuface, result)
    }

}
