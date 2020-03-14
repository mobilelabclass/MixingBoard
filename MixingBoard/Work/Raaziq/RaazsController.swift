//
//  RaazsController.swift
//  VisualizerHW
//
//  Created by Raaziq Brown on 3/3/20.
//  Copyright © 2020 Raaziq Brown. All rights reserved.
//

import SwiftUI



struct RaazsController: View {
    
    //    @State var boxOneMove: Bool = false
    @Binding var signal: Signal
    
    
    var body: some View {
        
        
        
        ZStack{
            
            VStack{
                
                Slider(value: $signal.floatValue)
                    .padding(10)
                Text("Play With Me!")
                    .accentColor(.green)
                
                
                HStack{
                    
                    
                    
                    
                    Button (action:{
                        
                        print("press")
                        if self.signal.toggleValue == false {
                            self.signal.toggleValue = true
                        } else {
                            self.signal.toggleValue = false
                        }
                        
                        self.signal.intValue = self.signal.intValue +  1
                        
                        print("\(self.signal.intValue)")
                        
                        
                        
                    }){
                        
                        Circle()
                            .fill(Color.green)
                            .frame(width: 100, height: 100)
                       
                        .shadow(color: .black, radius: 5, x: 10, y: 5)
                        
                    }
                    
                    
                    
                    Button (action:{
                        print("redpress")
                        
                        if self.signal.toggleValue == false {
                            self.signal.toggleValue = true
                        } else {
                            self.signal.toggleValue = false
                        }
                        
                        self.signal.intValue = self.signal.intValue -  1
                        
                        print("\(self.signal.intValue)")
                        
                    }){
                        Circle()
                            .fill(Color.red)
                            .frame(width: CGFloat(100), height: CGFloat(100))

                        .shadow(color: .black, radius: 5, x: 10, y: 5)
                        
                    }
                    
                    
                  
                    
                    
                }
                
                
                
                
            }
            
        }
   
    }
}

//struct RaazsController_Previews: PreviewProvider {
//    static var previews: some View {
//        //RaazsController(signal: <#Binding<Signal>#>)
//    }
//}
