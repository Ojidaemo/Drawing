//
//  ChallengeThree.swift
//  Drawing
//
//  Created by Vitali Martsinovich on 2023-08-17.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var gradientStartX = 0.5
    var gradientStartY = 0.0
    
    var gradientEndX = 0.5
    var gradientEndY = 0.5
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: UnitPoint(x: gradientStartX, y: gradientStartY),
                            endPoint: UnitPoint(x: gradientEndX, y: gradientEndY)
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ChallengeThree: View {
    @State private var colorRectangle = 0.0
    @State private var gradientStartX = 0.5
    @State private var gradientStartY = 0.0
    @State private var gradientEndX = 0.5
    @State private var gradientEndY = 0.5

    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorRectangle, gradientStartX: gradientStartX, gradientStartY: gradientStartY, gradientEndX: gradientEndX, gradientEndY: gradientEndY)
                .frame(width: 300, height: 300)
            
            HStack {
                Text("Color")
                Slider(value: $colorRectangle)
            }
            HStack {
                Text("Start X")
                Slider(value: $gradientStartX)
            }

            HStack {
                Text("Start Y")
                Slider(value: $gradientStartY)
            }

            HStack {
                Text("End X")
                Slider(value: $gradientEndX)
            }

            HStack {
                Text("End Y")
                Slider(value: $gradientEndY)
            }
        }
    }
}

struct ChallengeThree_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeThree()
    }
}
