//
//  switchview.swift
//  SimpleVersion
//
//  Created by Nicholas Grant on 3/1/20.
//  Copyright © 2020 nicholasgrant. All rights reserved.
//

import SwiftUI

struct NicksController: View {
    
    @Binding var signal: Signal
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
            VStack {
                Toggle(isOn: $signal.toggleValue) {
                    Text("")
                }.fixedSize()
                    .padding(20)
                
                HStack {
                    Text("small monkey").font(.custom("Times New Roman", size: (20)))
                        .rotationEffect(.degrees(270))
                        .foregroundColor(Color.yellow)
                    Slider(value: $signal.floatValue, in: 0.0...1.0, step: 0.1)
                    Text("giant monkey").font(.custom("Times New Roman", size: (20)))
                        .rotationEffect(.degrees(90))
                        .foregroundColor(Color.yellow)
                }
                
                HStack {
                    Button(action: {
                        if self.signal.intValue < 10 {
                            self.signal.intValue += 1
                        }
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Button(action: {
                        
                        if self.signal.intValue > 0 {
                            self.signal.intValue -= 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                    }.padding()
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }
}

//struct switchview_Previews: PreviewProvider {
//    static var previews: some View {
//        NicksController(signal: .constant(Signal()))
//    }
//}
