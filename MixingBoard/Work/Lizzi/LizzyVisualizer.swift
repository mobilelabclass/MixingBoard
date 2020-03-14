//
//  LizzyVisualizer.swift
//  MixingBoard
//
//  Created by Elizabeth Chiappini on 3/5/20.
//  Copyright © 2020 lizzychiappini. All rights reserved.
//

import SwiftUI

struct LizzyVisualizer: View {
    var signal: Signal
    
    var body: some View {
        VStack{
            if self.signal.toggleValue == true {
                ForEach(0..<signal.intValue, id: \.self) { _ in
                    Rectangle()
                        .fill(Color(red: Double(self.signal.floatValue), green: 200/255, blue: Double(self.signal.floatValue)))
                        .frame(width: 300, height: 50)
                }
            }
        }
    }
}

//struct LizzyVisualizer_Previews: PreviewProvider {
//    static var previews: some View {
//        LizzyVisualizer()
//    }
//}
