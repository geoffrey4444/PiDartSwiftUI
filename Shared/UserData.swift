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
    @Published var progress : Double = 0.0
    @Published var calculating : Bool = false
    
    func estimate_pi() {
        DispatchQueue.global(qos: .userInitiated).async {
            var hits = 0
            var darts_thrown = 0
            let darts_to_throw : Int = Int(pow(Double(10), Double(self.exponent_number_of_throws)))
            
            DispatchQueue.main.async {
                self.progress = 0.0
                self.calculating = true
            }
            
            while (darts_thrown < darts_to_throw) {
                let x = Double.random(in: 0.0 ..< 1.0)
                let y = Double.random(in: 0.0 ..< 1.0)
                if (x * x + y * y < 1.0) {
                    hits += 1
                }
                
                if (100 * hits % darts_to_throw == 0) {
                    DispatchQueue.main.async {
                        self.progress = min(self.progress + 0.01, 1.0)
                    }
                }
                
                
                darts_thrown += 1
            }
            DispatchQueue.main.async {
                self.pi_estimate = 4.0 * Double(hits) / Double(darts_thrown)
                self.progress = 0.0
                self.calculating = false
            }
        }
    }
}
