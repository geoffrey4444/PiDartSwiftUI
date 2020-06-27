//
//  UserData.swift
//  PiDart
//
//  Created by Geoffrey Lovelace on 6/27/20.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var exponent_number_of_throws : Double = 4.0
    @Published var pi_estimate : Double = 0.0
    @Published var pi_estimate_string : String = "0.0"
    @Published var progress : Double = 0.0
    
    func estimate_pi() {
        DispatchQueue.global(qos: .userInitiated).async {
            var hits = 0
            var darts_thrown = 0
            while (darts_thrown < Int(pow(Double(10), Double(self.exponent_number_of_throws)))) {
                let x = Double.random(in: 0.0 ..< 1.0)
                let y = Double.random(in: 0.0 ..< 1.0)
                if (x * x + y * y < 1.0) {
                    hits += 1
                }
                darts_thrown += 1
            }
            DispatchQueue.main.async {
                self.pi_estimate = 4.0 * Double(hits) / Double(darts_thrown)
            }
        }
    }
}
