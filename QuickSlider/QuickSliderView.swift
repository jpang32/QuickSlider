//
//  ContentView.swift
//  QuickSlider
//
//  Created by Jared Pangallozzi on 4/16/22.
//

import SwiftUI

struct QuickSliderView: View {
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    let radius: CGFloat = 300
    @State private var angle: Double = 0
    
    var body: some View {
        
        
        VStack {    
            Circle()
                .strokeBorder(Color.green, lineWidth: 2)
                .frame(width: self.radius, height: self.radius)
                .overlay(
                    Image(systemName: "arrow.down")
                        .offset(x: self.radius / 2)
                        .rotationEffect(.degrees(self.angle))
                )
        }
        .animation(.default)
        .onReceive(timer) { _ in
            angle += 1
        }
         
            
    }
}

struct QuickSliderPreview: PreviewProvider {
    static var previews: some View {
        QuickSliderView()
    }
}
