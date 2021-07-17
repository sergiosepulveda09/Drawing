//
//  AnimatablePair.swift
//  Drawing
//
//  Created by Sergio Sepulveda on 2021-07-16.
//

import SwiftUI

struct CheckerBoard: Shape {
    
    var rows: Int
    var columns: Int
    public var animatableData: AnimatablePair<Double, Double>{
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
    
}

struct AnimatablePairPractice: View {
    
    @State private var rows: Int = 4
    @State private var columns: Int = 4
    
    var body: some View {
        CheckerBoard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    self.rows = 8
                    self.columns = 16
                }
            }
    }
}

struct AnimatablePair_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairPractice()
    }
}
