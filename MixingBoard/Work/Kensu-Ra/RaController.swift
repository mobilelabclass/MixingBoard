//
//  RaController.swift
//  MixItUp
//
//  Created by Khensu-Ra Love El on 3/3/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

import SwiftUI

struct RaController: View {
    @Binding var signal: Signal
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("📦 +🎶 ")
                    Spacer()
                    Toggle(isOn: $signal.toggleValue) {
                        Text("")
                    }
                    .fixedSize()
                }
                HStack {
                    Text("Roddy Size ")
                         Spacer()
                    Button(action: {
                        self.signal.intValue += 1;
                        if (self.signal.intValue > 10) {
                            self.signal.intValue = 0
                        }
                    }){
                        Text(" 🍄")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                    }
               
                }
                Slider(value: $signal.floatValue, in: 0.0...1.0, step: 0.1)
            }
        .padding()
        }
    }
}
struct RaController_Previews: PreviewProvider {
    static var previews: some View {
        RaController(signal: .constant(Signal(intValue: 0, floatValue: 0, toggleValue: false)) )
    }
}

