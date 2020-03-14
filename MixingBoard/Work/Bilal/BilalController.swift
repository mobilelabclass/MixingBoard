//
//  Controller.swift
//  SignalKit
//  Created by Bilal Sehgol on 3/4/20.
//  Copyright © 2020 BilalSehgol. All rights reserved.
//

import SwiftUI

struct BilalController: View {
    // Binding variable.
    @Binding var signal: Signal

    var body: some View {

        VStack{
            
            Slider(value: $signal.floatValue)
            

        }
            
    }
}

//struct Controller_Previews: PreviewProvider {
//    static var previews: some View {
//        Controller(signal: .constant(Signal(intValue: 10, floatValue: 20.0, toggleValue: true)))
//
//    }
//}
