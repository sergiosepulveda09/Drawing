//
//  DrawingGroupHighPerformance.swift
//  Drawing
//
//  Created by Sergio Sepulveda on 2021-07-14.
//

import SwiftUI

struct ColorCyclingCircle: View {
    
    var amount: Double = 0.0
    var steps: Int = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct DrawingGroupHighPerformance: View {
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)
            
            Text("Amount")
            Slider(value: $colorCycle)
        }
    }
}

struct DrawingGroupHighPerformance_Previews: PreviewProvider {
    static var previews: some View {
        DrawingGroupHighPerformance()
    }
}
