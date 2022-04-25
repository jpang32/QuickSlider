//
//  Game.swift
//  QuickSlider
//
//  Created by Jared Pangallozzi on 4/22/22.
//

import Foundation

struct Game {
    
    var target: Double = Double(Int.random(in: 0...359))
    // Unit: degrees / sec^2
    var acceleration: Double = 30.0
    
    // Given as percentages of circle for .trim() function
    var yellowRange: Double = 1.0 / 12.0
    var redRange: Double = 1.0 / 20.0
    
    init() {
        print(self.target)
    }
    
    func getSpeed(currentAngle: Double) -> Double {
        return (1.0 / abs(self.target - currentAngle.truncatingRemainder(dividingBy: 360)) * self.acceleration)
    }
    
    
}
