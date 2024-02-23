//
//  MonteCarloIntegrator.swift
//  MonteCarloIntegration
//
//  Created by Phys440Zachary on 2/23/24.
//

import Foundation
import Observation

@Observable class MonteCarloIntegrator {
    
    
    func calculateIntegral(lowerXLimit: Double, upperXLimit: Double, numGuesses: Int) async -> Double {
        var finalIntegral: Double = 0
        
        let myBoundingBox = BoundingBox()
        
        myBoundingBox.initBounds(newXBounds: [lowerXLimit, upperXLimit], newYBounds: [0.0,exp(-1*lowerXLimit)])
        
        let boxArea = myBoundingBox.volume
        
        let numInside: Int = await makeGuesses(numGuess: numGuesses, xBounds: [lowerXLimit, upperXLimit], yBounds: [0.0,exp(-1*lowerXLimit)])
        
        finalIntegral = (Double(numInside) / Double(numGuesses)) * boxArea
        return finalIntegral
    }
    
    func makeGuesses(numGuess: Int, xBounds: [Double], yBounds: [Double]) async -> Int {
        
        var numInside: Int = 0
        
        let guessesInsideArea = await withTaskGroup(of: Bool.self, returning: Int.self, body: { taskGroup in
            
            for i in 1 ... numGuess {
                taskGroup.addTask {
                    let xGuess = Double.random(in: xBounds[0] ... xBounds[1])
                    let yGuess = Double.random(in: yBounds[0] ... yBounds[1])
                    
                    if yGuess < exp(-1 * xGuess) {
                        return true
                    }
                    return false
                }
            }
            var combinedTaskResults: [Bool] = []
            for await result in taskGroup{
                combinedTaskResults.append(result)
            }
            var count: Int = 0
            for guess in combinedTaskResults{
                if guess {
                    count += 1
                }
            }
            numInside = count
            return count
        })
        return numInside
    }
    
    
}
