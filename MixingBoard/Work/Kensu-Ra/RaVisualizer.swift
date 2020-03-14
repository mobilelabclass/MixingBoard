//
//  RaVisualizer.swift
//  MixItUp
//
//  Created by Khensu-Ra Love El on 3/3/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

import SwiftUI

struct RaVisualizer: View {
    let signal: Signal
    var body: some View {
        
        VStack {
            Text(signal.toggleValue ? "🖕🏾 You World!" : "Hello World!")
            Image("roddy")
                .resizable()
            .frame(width:(50*CGFloat(signal.intValue+1)), height:(50*CGFloat(signal.intValue+1)))
                .blur(radius: CGFloat(signal.floatValue*25))
            
            VStack {
                if (signal.toggleValue) {
                    BoxFallings()
                }
            }
        }
        
    }
}

struct RaVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        RaVisualizer(signal:Signal(intValue: 0, floatValue: 0, toggleValue: false))
    }
}
