//
//  ImagePaint.swift
//  Drawing
//
//  Created by Sergio Sepulveda on 2021-07-13.
//

import SwiftUI

struct ImagePaint: View {
    var body: some View {
//        Text("Hello World")
//            .frame(width: 100, height: 100)
//            .background(Image("Example").resizable())
        Capsule()
            .strokeBorder(/*ImagePaint(image: Image("Example"), scale: 0.1),*/ lineWidth: 20)
            //ImagePaint didn't work 
            .frame(width: 300, height: 200)
        
    }
}

struct ImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaint()
    }
}
