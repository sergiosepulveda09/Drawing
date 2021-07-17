//
//  ContentView.swift
//  Drawing
//
//  Created by Sergio Sepulveda on 2021-07-12.
//

import SwiftUI

//struct ColorCyclingCircle: View {
//
//    var amount: Double = 0.0
//    var steps: Int = 100
//
//    var body: some View {
//        ZStack {
//            ForEach(0..<steps) { value in
//                Circle()
//                    .inset(by: CGFloat(value))
//                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
//                        self.color(for: value, brightness: 1),
//                        self.color(for: value, brightness: 0.5)
//                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
//            }
//        }
//        .drawingGroup()
//    }
//    func color(for value: Int, brightness: Double) -> Color {
//        var targetHue = Double(value) / Double(self.steps) + self.amount
//        if targetHue > 1 {
//            targetHue -= 1
//        }
//
//        return Color(hue: targetHue, saturation: 1, brightness: brightness)
//    }
//}

struct ColorCyclingRectangle: View {
    var amount: Double = 0.0
    var steps: Int = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
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

struct Arrow: InsettableShape {
    
    var insetAmount: CGFloat = 0
    var animatableData: CGFloat {
        get {
            insetAmount
        }
        set {
            self.insetAmount = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        let upperWidthLeft: CGFloat = rect.minX + rect.maxX / 6
        let upperWidthRight: CGFloat = rect.maxX - rect.maxX / 6
        let lowerWidthLeft: CGFloat  = rect.maxX / 2.8
        let lowerWidthRight: CGFloat = rect.maxX - rect.maxX / 2.8
        
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: upperWidthLeft , y: rect.height / 3))
        path.addLine(to: CGPoint(x: lowerWidthLeft, y: rect.height / 3))
        path.addLine(to: CGPoint(x: lowerWidthLeft, y: rect.maxY))
        path.addLine(to: CGPoint(x: lowerWidthRight, y: rect.maxY))
        path.addLine(to: CGPoint(x: lowerWidthRight, y: rect.height / 3))
        path.addLine(to: CGPoint(x: upperWidthRight, y: rect.height / 3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
    
}

struct ContentView: View {
    
    @State private var insetAmount: CGFloat = 5
    @State private var amount: Double = 0
    var body: some View {
        VStack {
            Spacer()
            Arrow()
    //            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .strokeBorder(Color.blue, style: StrokeStyle(lineWidth: insetAmount, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300)
                .onTapGesture {
                    withAnimation {
                        self.insetAmount = CGFloat.random(in: 5...20)
                    }
            }
            Spacer()
            VStack {
                ColorCyclingRectangle(amount: amount)
                    .frame(width: 300, height: 200)
                Text("Amount")
                Slider(value: $amount)
                    .accentColor(Color(hue: amount, saturation: 1, brightness: 1))
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
