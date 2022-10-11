//
//  CalculatorsViewModel.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 05/02/21.
//

import Foundation
import UIKit

class CalculatorsViewModel: NSObject {
    
    var bodySurface: BodySurface!
    
    init(measures: BodySurface) {
        super.init()
        bodySurface = measures
        calculateBodySurface()
    }
    
    func calculateBodySurface() {
        
        guard let weight = Float(bodySurface.weight) else { return }
        guard let height = Float(bodySurface.height) else { return }
        
        let surface = 0.007184 * pow(height, 0.725) * pow(weight, 0.425)
        
        bodySurface.bodySuface = surface
        
    }
}
