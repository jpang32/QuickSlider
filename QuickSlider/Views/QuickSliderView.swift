//
//  ContentView.swift
//  QuickSlider
//
//  Created by Jared Pangallozzi on 4/16/22.
//

import SwiftUI

struct QuickSliderView: View {
    
    private var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var timerOn: Bool = true
    
    private let radius: CGFloat = 300
    @State private var angle: Double = 0.0
    
    private let game: Game = Game()
    
    /*
    private func toggle_timer(timerOn: timerOn) {
        if self.timerOn {
            self.timer.upstream.autoconnect()
        } else {
            self.timer.upstream.connect().cancel()
        }
    }]*/
    
    var body: some View {
        
        
        VStack {    
            ZStack {
                Circle()
                    //.trim(from: <#T##CGFloat#>, to: <#T##CGFloat#>)
                    .strokeBorder(Color.green, lineWidth: 2)
                    .frame(width: self.radius, height: self.radius)
                    .overlay(
                        Image(systemName: "arrow.down")
                            .offset(x: self.radius / 2)
                            .rotationEffect(.degrees(self.angle))
                )
                Circle()
                    .trim(from: 0.5 - game.yellowRange, to: 0.5 + game.yellowRange)
                    .stroke(Color.yellow, lineWidth: 2)
                    .frame(width: self.radius, height:self.radius)
                    .rotationEffect(.degrees(game.target - 180.0))
                Circle()
                    .trim(from: 0.5 - game.redRange, to: 0.5 + game.redRange)
                    .stroke(Color.red, lineWidth: 2)
                    .frame(width: self.radius, height:self.radius)
                    .rotationEffect(.degrees(game.target - 180.0))
            }
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
