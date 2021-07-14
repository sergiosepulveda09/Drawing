//
//  CreatingCustomPaths.swift
//  Drawing
//
//  Created by Sergio Sepulveda on 2021-07-13.
//

import SwiftUI

struct CreatingCustomPaths: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 150, y: 100))
            path.addLine(to: CGPoint(x: 50, y: 300))
            path.addLine(to: CGPoint(x: 250, y: 300))
            path.addLine(to: CGPoint(x: 150, y: 100))
        }
//        .fill(Color.blue)
//        .stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 10)
        .stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        
    }
}

struct CreatingCustomPaths_Previews: PreviewProvider {
    static var previews: some View {
        CreatingCustomPaths()
    }
}
