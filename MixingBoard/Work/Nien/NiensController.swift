//
//  NiensController.swift
//  MixingBoard
//
//  Created by Nien Lam on 3/4/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct NiensController: View {
    @Binding var signal: Signal
  
    var body: some View {
        VStack {
            HStack {
                Text("Nien's Controller")
                    .font(.body)
                Spacer()
            }
            .padding(10)

            Spacer()
            
            HStack {
                Button("UP") {
                    self.signal.intValue += 1

                    if self.signal.intValue  > 10 {
                        self.signal.intValue = 10
                    }
                }

                Button("DOWN") {
                    self.signal.intValue -= 1
                    
                    if self.signal.intValue < 0 {
                        self.signal.intValue = 0
                    }
                }
            }
            
            
            Spacer()

            Slider(value: $signal.floatValue)
                .colorScheme(.dark)
                .padding()
            
            
            Spacer()
            Button("TOGGLE") {
                self.signal.toggleValue.toggle()
            }
            
            Spacer()
        }
        .frame(width: 400, height: 250)
        .border(Color.purple, width: 5)
    }
}
struct NiensController_Previews: PreviewProvider {
    static var previews: some View {
        NiensController(signal: .constant(Signal(intValue: 0, floatValue: 0, toggleValue: false)))
    }
}
