//
//  SpecialEffects.swift
//  Drawing
//
//  Created by Vitali Martsinovich on 2023-08-04.
//

import SwiftUI

struct SpecialEffects: View {
    @State private var amount = 0.0
    var body: some View {
        VStack {
//            ZStack {
//                Circle()
//                    .fill(.red)
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(.green)
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(.blue)
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
            
            // Blur
            Image("aldrin")
                .resizable()
                .scaledToFit()
//                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffects()
    }
}
