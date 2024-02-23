//
//  BoundingBox.swift
//  MonteCarloIntegration
//
//  Created by Phys440Zachary on 2/23/24.
//

import Foundation
import Observation


@Observable class BoundingBox {
    var xBounds: [Double] = []
    var yBounds: [Double] = []
    
    var volume: Double = 1
    
    func initBounds(newXBounds: [Double], newYBounds: [Double]) {
        self.xBounds = newXBounds
        self.yBounds = newYBounds
        
        self.volume = calculateVolume(x: xBounds, y: yBounds)
    }
    
    func calculateVolume(x: [Double], y: [Double]) -> Double {
        var vol: Double = 0.0
        
        if x.count == 2 && y.count == 2 && x[0] < x[1] && y[0] < y[1] {
            let xLength = x[1] - x[0]
            let yLength = y[1] - y[0]
            
            vol = xLength * yLength
        }
        else {
            print("Bounds are incorrect.")
        }
        return vol
    }
}
