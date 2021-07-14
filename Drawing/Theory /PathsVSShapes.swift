//
//  PathsVSShapes.swift
//  Drawing
//
//  Created by Sergio Sepulveda on 2021-07-13.
//

import SwiftUI

struct  Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockWise: Bool
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockWise)
        return path
    }
}

struct PathsVSShapes: View {
    var body: some View {
//        Triangle()
//            .fill(Color.red)
//            .stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .frame(width: 200, height: 200)
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockWise: true)
            .stroke(Color.blue ,lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}

struct PathsVSShapes_Previews: PreviewProvider {
    static var previews: some View {
        PathsVSShapes()
    }
}
