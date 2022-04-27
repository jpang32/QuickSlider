//
//  ContentView.swift
//  QuickSlider
//
//  Created by Jared Pangallozzi on 4/16/22.
//

import SwiftUI

struct QuickSliderView: View {
    
    private let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    private let radius: CGFloat = 300
    private let game: Game = Game()
    
    @State private var angle: Double = 0.0
    
    var body: some View {
        
        
        VStack {    
            Circle()
                //.trim(from: <#T##CGFloat#>, to: <#T##CGFloat#>)
                .strokeBorder(Color.green, lineWidth: 2)
                .frame(width: self.radius, height: self.radius)
            /*
                .mask(Circle()
                    .trim(from: game.target - game.yellowRange, to: game.target + game.yellowRange)
                    //.stroke(Color.yellow, lineWidth: 2)
                )
             */
                .overlay(Circle()
                    .trim(from: game.target / 360.0 - game.yellowRange,
                          to: game.target / 360.0 + game.yellowRange)
                    .stroke(Color.yellow, lineWidth:2)
                    .frame(width: self.radius, height: self.radius)
                )
                //this is a test
                .overlay(Circle()
                    .trim(from: game.target / 360.0 - game.redRange,
                          to: game.target / 360.0 + game.redRange)
                    .stroke(Color.red, lineWidth:2)
                    .frame(width: self.radius, height: self.radius)
                )
                .overlay(
                    Image(systemName: "arrow.down")
                        .offset(x: self.radius / 2)
                        .rotationEffect(.degrees(self.angle))
                )
        }
        .animation(.default, value: self.angle)
        .onReceive(timer) { _ in
            self.angle = self.angle + game.getSpeed(currentAngle: self.angle)
        }
         
            
    }
}

struct QuickSliderPreview: PreviewProvider {
    static var previews: some View {
        QuickSliderView()
    }
}
