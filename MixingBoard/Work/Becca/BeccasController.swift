//
//  BeccasController.swift
//  BeccaMoore_MixingBoard_Hw5
//
//  Created by Rebecca Moore on 3/5/20.
//  Copyright © 2020 Rebecca Moore. All rights reserved.
//


import SwiftUI

struct BeccasController: View {
    // Binding variable.
    @Binding var signal: Signal


    var body: some View {

        VStack{
            
            Slider(value: $signal.floatValue)
  
            
        
        }
            
    }
}

struct Controller_Previews: PreviewProvider {
    static var previews: some View {
        BeccasController(signal: .constant(Signal(intValue: 10, floatValue: 20.0, toggleValue: true)))

    }
}
