//
//  Controller.swift
//  SignalKit
//  Created by Bilal Sehgol on 3/4/20.
//  Copyright © 2020 BilalSehgol. All rights reserved.
//

import SwiftUI

struct BilalVisualizer: View {
    // Binding variable.
    var signal: Signal

    var body: some View {

        VStack{
            
                  Circle()
                        .fill(Color.red)
                        .blur(radius: CGFloat(signal.floatValue*200), opaque: signal.toggleValue)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(20*signal.floatValue)))

                    Circle()
                        .fill(Color.green)
                        .blur(radius: CGFloat(signal.floatValue*200), opaque: false)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*signal.floatValue)))
            
                    Circle()
                       .fill(Color.blue)
                        .blur(radius: CGFloat(signal.floatValue*200), opaque: signal.toggleValue)
                        .transformEffect(CGAffineTransform(rotationAngle: CGFloat(20*signal.floatValue)))
                
                    Circle()
                     .fill(Color.purple)
                     .blur(radius: CGFloat(signal.floatValue*200), opaque: signal.toggleValue)
                     .transformEffect(CGAffineTransform(rotationAngle: CGFloat(20*signal.floatValue)))

        }
            
    }
}

//struct Visualizer_Previews: PreviewProvider {
//    static var previews: some View {
//        Visualizer(signal: .constant(Signal(intValue: 0, floatValue: 0.0, toggleValue: false)))
//
//    }
//}
