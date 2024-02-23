//
//  ContentView.swift
//  MonteCarloIntegration
//
//  Created by Phys440Zachary on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @Bindable var integrator = MonteCarloIntegrator()
    @State private var upperX = "1"
    @State private var lowerX = "0"
    @State private var guesses = "1"
        
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
            
            Button("Integrate",action: {Task.init{await self.calculate()}})
            HStack{
                Text("Result: ")
                Text("\(integrator.integrationValue)")
            }
            
            .padding()
        }
    }
    func calculate() async {
        if upperX < lowerX {
            upperX = lowerX
        }
        if Int(guesses)! < 1 {
            guesses = "1"
        }
        let _ : Double = await integrator.calculateIntegral(lowerXLimit: Double(lowerX)!, upperXLimit: Double(upperX)!, numGuesses: Int(guesses)!)
    }
}
