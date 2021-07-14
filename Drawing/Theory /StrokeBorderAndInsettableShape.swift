//
//  StrokeBorderAndInsettableShape.swift
//  Drawing
//
//  Created by Sergio Sepulveda on 2021-07-13.
//

import SwiftUI

struct Arc1: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockWise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockWise)
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
}

struct StrokeBorderAndInsettableShape: View {
    var body: some View {
        Arc1(startAngle: .degrees(-90), endAngle: .degrees(90), clockWise: true)
            .strokeBorder(Color.blue, lineWidth: 20)
            
    }
}

struct StrokeBorderAndInsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorderAndInsettableShape()
    }
}
