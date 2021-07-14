//
//  SpecialEffects.swift
//  Drawing
//
//  Created by Sergio Sepulveda on 2021-07-14.
//

import SwiftUI

struct SpecialEffects: View {
    
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color.green)
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color.blue)
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
//
//            Slider(value: $amount)
//                .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.black)
//        .edgesIgnoringSafeArea(.all)
        VStack {
            Image("Example")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .saturation(Double(amount))
            .blur(radius: (1 - amount) * 20)
        
            Text("amount")
            Slider(value: $amount)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }

}

struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffects()
    }
}
