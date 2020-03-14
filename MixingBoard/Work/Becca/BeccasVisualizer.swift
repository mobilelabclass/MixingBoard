//
//  BeccasVisualizer.swift
//  BeccaMoore_MixingBoard_Hw5
//
//  Created by Rebecca Moore on 3/5/20.
//  Copyright © 2020 Rebecca Moore. All rights reserved.
////  Inspiration from BilalSehgol & Cameron Partee
//  jar image - free clip art from http://clipart-library.com/clipart/n852056.htm



import SwiftUI





struct BeccasVisualizer: View {
    // Binding variable.
    var signal: Signal
    
    

    var body: some View {

        VStack{
            ZStack {
                Image("jar")
            
                
                    Circle()
                        .fill(Color.yellow)
                    .frame(width: 80, height: 80)
                        .blur(radius: CGFloat(signal.floatValue*200), opaque: signal.toggleValue)
                    
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 40, height: 40)
                     
                
                }
            }
        }
    }


//struct Visualizer_Previews: PreviewProvider {
//    static var previews: some View {
//        BeccasVisualizer(signal: .constant(Signal(intValue: 0, floatValue: 0.0, toggleValue: false)))
//
//    }
//}
