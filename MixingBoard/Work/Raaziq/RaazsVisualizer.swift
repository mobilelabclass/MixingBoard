//
//  RaazsVisualizer.swift
//  VisualizerHW
//
//  Created by Raaziq Brown on 3/3/20.
//  Copyright © 2020 Raaziq Brown. All rights reserved.
//

import SwiftUI

struct RaazsVisualizer: View {
    
    var signal: Signal
    
    
    
    
    var body: some View {
        
        
        
        ZStack{
         
            VStack{
            
            HStack{
                
                VStack{
                    
                    RoundedRectangle(cornerRadius: CGFloat(10))
                        .foregroundColor(self.signal.toggleValue ? Color.green : Color.red)
                        .frame(width: CGFloat(50), height:CGFloat(50))
                        .offset(x: self.signal.toggleValue ? 0 : 100, y:  self.signal.toggleValue ? -350 : 200)
                    .animation(Animation.easeInOut(duration: 1.2))
                        
                        
                }
                
                VStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                      
                        .foregroundColor(self.signal.toggleValue ? Color.red : Color.green)
                        .frame(width: 50, height:50)
                        .offset(x: self.signal.toggleValue ? 100 : 0, y:  self.signal.toggleValue ? 200 : -350)
                     .animation(Animation.easeInOut(duration: 1.2))
                    
                }
                
            }
                 .padding(.trailing, 100)
                
                HStack{
                    Circle()
                    .fill(Color.red)
                    .frame(width: CGFloat(30 * self.signal.floatValue), height: CGFloat(30 * self.signal.floatValue))
                
                          if self.signal.toggleValue == true {
                                       
                                       ForEach(0..<self.signal.intValue, id: \.self) { _ in
                                           Circle()
                                               .fill(Color.red)
                                               .frame(width: CGFloat(30 * self.signal.floatValue), height: CGFloat(30 * self.signal.floatValue))
                                       }}
                          
                          if self.signal.toggleValue == false {
                                       
                                       ForEach(0..<self.signal.intValue, id: \.self) { _ in
                                           Circle()
                                               .fill(Color.green)
                                            .frame(width: CGFloat(30 * self.signal.floatValue), height: CGFloat(30 * self.signal.floatValue))
                                       }}

                    
                      }
               
           
            }
            

       
         
                  
    }
    
    }}

//struct RaazsVisualizer_Previews: PreviewProvider {
//    static var previews: some View {
//        RaazsVisualizer()
//    }
//}
