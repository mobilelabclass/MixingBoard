//
//  TianxuVisualizer.swift
//  TianxuVisualController
//
//  Created by Tianxu Zhou on 2020/3/3.
//  Copyright © 2020 Tianxu Zhou. All rights reserved.
//

import SwiftUI

struct TianxuVisualizer: View {
    
    var signal: Signal
    
    func ellipse()-> some View{
        return HStack{
            Ellipse()
                .offset(y:CGFloat(600-self.signal.floatValue*500))
                .scale(x:1,y:2*CGFloat(0.1-self.signal.floatValue/10)/3)
                .blur(radius: CGFloat(10-self.signal.floatValue*10))
        }
        
    }
    
    var body: some View {
        ZStack {
            Color.black

            VStack{
                Image("newsfeed")
                    .offset(y:CGFloat(880-self.signal.floatValue*500))
                    .mask(
                        HStack{
                            ellipse()
                            ellipse()
                        }
                )
                
            }.offset(y:CGFloat(-130))

        }
        
    }
}

struct TianxuVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        TianxuVisualizer(signal: Signal(intValue: 0, floatValue: 0, toggleValue: false))
    }
}
