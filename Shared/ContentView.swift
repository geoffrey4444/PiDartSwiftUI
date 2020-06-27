//
//  ContentView.swift
//  Shared
//
//  Created by Geoffrey Lovelace on 6/26/20.
//

import SwiftUI

struct ContentView: View {
    @State var exponent_number_of_throws : Double = 4.0
    @State var pi_estimate = 0.0
    @State var progress = 0.0
    
    func estimate_pi() -> Double {
        var hits = 0
        var darts_thrown = 0
        progress = 0.0
        while (hits < Int(pow(Double(10), Double(exponent_number_of_throws)))) {
            let x = Double.random(in: 0.0 ..< 1.0)
            let y = Double.random(in: 0.0 ..< 1.0)
            if (x * x + y * y < 1.0) {
                hits += 1
            }
            darts_thrown += 1
        }
        var pi_estimate : Double = Double(hits)
        pi_estimate *= 4.0 / Double(darts_thrown)
        
        return pi_estimate
    }
    
    func dart_or_darts() -> String {
        exponent_number_of_throws > 0 ? " darts." : " dart."
    }
    
    var body: some View {
        VStack {
            Text("π Estimate")
                .font(.headline)
                .padding(.top)
            Text(String(pi_estimate)).padding(.all).frame(width: 400, height: 40.0)
            Button(action: {self.pi_estimate = estimate_pi()}) {
                Text("Estimate Pi")
            }
            .padding([.leading, .bottom, .trailing])
            HStack {
                Text("Fewer darts (faster)")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Spacer()
                Text("More darts (more accurate)")
                    .font(.subheadline)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing)
            }
            Slider(value: $exponent_number_of_throws, in: 0.0...8.0, step: 1.0)
                .padding([.leading, .bottom, .trailing])
            Text("The next estimate of π will throw "+String(Int(pow(10.0, exponent_number_of_throws)))+dart_or_darts() )
                .font(.subheadline)
                .padding(.bottom)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
