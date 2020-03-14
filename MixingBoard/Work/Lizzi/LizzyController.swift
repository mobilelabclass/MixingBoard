//
//  Controller.swift
//  MixingBoard
//
//  Created by Elizabeth Chiappini on 3/3/20.
//  Copyright © 2020 lizzychiappini. All rights reserved.
//

import SwiftUI

struct LizzyController: View {
    @Binding var signal: Signal
    
    var body: some View {
        VStack{
            HStack{
                Button (action: {
                    self.signal.intValue = self.signal.intValue + 1
                    if self.signal.intValue >= 9 {
                        self.signal.intValue = 1
                    }
                    //print(self.intValue)
                }) {
                    Text("SET \(signal.intValue)")
                        .font(.system(size: 30))
                        .bold()
                        .frame(width: 200, height: 100)
                        .border(Color.gray, width: 3)
                        .foregroundColor(Color.gray)
                }
                
                Button (action: {
                    if self.signal.toggleValue == false {
                        self.signal.toggleValue = true
                    } else {
                        self.signal.toggleValue = false
                    }
                    // self.toggleValue = true
                    print(self.signal.toggleValue)
                    
                }) {
                    Text("SHOW")
                        .font(.system(size: 30))
                        .bold()
                        .frame(width: 200, height: 100)
                        .border(Color.gray, width: 3)
                        .foregroundColor(Color.gray)
                }
            }
            
            Slider(value: $signal.floatValue, in: 0...1, step: 0.001)
            Text("COLOR")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(Color.gray)
            Button (action: {
                self.signal.toggleValue = false
                self.signal.intValue = 0
            }) {
                Text("RESET")
                    .font(.system(size: 30))
                    .bold()
                    .frame(width: 200, height: 100)
                    .border(Color.gray, width: 3)
                    .foregroundColor(Color.gray)
            }
        }
    }
}





//struct Controller_Previews: PreviewProvider {
//    static var previews: some View {
//        Controller()
//    }
//}
