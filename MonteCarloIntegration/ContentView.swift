//
//  ContentView.swift
//  MonteCarloIntegration
//
//  Created by Phys440Zachary on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @Bindable var integrator = MonteCarloIntegrator()
    @State private var upperX = ""
    @State private var lowerX = ""
    @State private var guesses = ""
        
    var body: some View {
        VStack {
            HStack {
                Text("Lower x bound:")
                TextField("Enter bound", text: $lowerX)
            }
            HStack {
                Text("Upper x bound:")
                TextField("Enter bound", text: $upperX)
            }
            HStack {
                Text("Number of guesses:")
                TextField("Enter guesses", text: $guesses)
            }
            
            Button("Integrate", action: {Task.init{await self.calculate()}}) {
                
            }
            .padding()
        }
        .padding()
        
        }
    func calculate() async {
        let _ : Double = await integrator.calculateIntegral(lowerXLimit: Double(lowerX)!, upperXLimit: Double(upperX)!, numGuesses: Int(guesses)!)
    }
}
