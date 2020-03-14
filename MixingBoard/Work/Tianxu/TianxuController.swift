//
//  TianxuController.swift
//  TianxuVisualController
//
//  Created by Tianxu Zhou on 2020/3/3.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct TianxuController: View {
    let switchTimer=Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    @State var direction = -1.0
    @Binding var signal: Signal
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Slider(value: $signal.floatValue, in: 0.0...1.0, step: 0.1)
                        .accentColor(.gray)
                        .rotationEffect(.degrees(270))
                        .padding(50)
                        .offset(x:150)
                }
            }
            
            VStack{
                HStack{
                    Toggle(isOn: $signal.toggleValue) {
                        Text("Even Sleepier")
                            .foregroundColor(Color.gray)
                        
                    }
                    .foregroundColor(Color.gray)
                        .accentColor(Color.orange)
                    
                    
                    
                }.padding(100)
                    .offset(y:100)
            }
        }
        .onReceive(self.switchTimer){ _ in
            if self.signal.toggleValue{
                if self.signal.floatValue > 1.0
                {
                    self.direction = -1.0
                }
                else if self.signal.floatValue < 0.0 {
                    self.direction = 1.0
                }
                self.signal.floatValue += Float(0.1) * Float(self.direction)
                
            }
            
            
        }
    }
}

struct TianxuController_Previews: PreviewProvider {
    static var previews: some View {
        TianxuController(signal: .constant(Signal(intValue: 0, floatValue: 0, toggleValue: false)))
    }
}
