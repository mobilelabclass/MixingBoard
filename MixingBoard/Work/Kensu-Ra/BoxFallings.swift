//
//  BoxFallings.swift
//  MixItUp
//
//  Created by Khensu-Ra Love El on 3/5/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

import SwiftUI


struct BoxFallings: View {

    @State var box1 : CGFloat = 150;
    @State var box2 : CGFloat = 110;
    @State var box3 : CGFloat = 100;
    @State var box4: CGFloat = 125

  
    
    let timer = Timer.publish(every: 0.2, on: .main, in:.default).autoconnect()
    


    var body: some View {
        ZStack {
            ZStack {
                Text("📦")
                    .font(.system(size: 40))
                    .position(x: 170.0, y : box1)
                
                Text("📦")
                    .font(.system(size: 40))
                    .position(x: 100.0, y : box2)
                Text("📦")
                    .font(.system(size: 40))
                    .position(x: 250.0, y : box3)
                Text("📦")
                    .font(.system(size: 40))
                    .position(x: 320.0, y : box4)

                
            }.onReceive(self.timer) { _ in
                
                    self.box1 += 60
                    self.box2 += 50
                    self.box3 += 45
                    self.box4 += 70
                    
                
                
                if self.box1 > 900 {
                    self.box1 = 100
                }
                if self.box2 > 900 {
                    self.box2 = 100
                }
                
                if self.box3 > 900 {
                    self.box3 = 100
                }
                if self.box4 > 900 {
                    self.box4 = 100
                }
            }
        }
    }
}

struct BoxFallings_Previews: PreviewProvider {
    static var previews: some View {
        BoxFallings()
    }
}
