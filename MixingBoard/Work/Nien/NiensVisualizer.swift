//
//  NiensController.swift
//  MixingBoard
//
//  Created by Nien Lam on 3/4/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct NiensVisualizer: View {
    var signal: Signal

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Nien's Visualizer")
                            .font(.body)
                        Text("intValue: \(signal.intValue)")
                        Text("floatValue: \(signal.floatValue)")
                        Text("toggleValue: \(signal.toggleValue.description)")
                    }
                    Spacer()
                }
                
                Spacer()
            }
            .padding(10)

            Rectangle()
                .frame(width: CGFloat(signal.floatValue * 150.0) + 40,
                       height: CGFloat(signal.floatValue * 150.0) + 40)
                .rotationEffect(.degrees(Double(20.0 * Double(signal.intValue))))

        }
        .frame(width: 400, height: 400)
        .background(signal.toggleValue ? Color.red : Color.green)
        .border(Color.orange, width: 5)
    }
}

struct NiensVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        NiensVisualizer(signal: Signal(intValue: 0, floatValue: 0, toggleValue: false))
    }
}
