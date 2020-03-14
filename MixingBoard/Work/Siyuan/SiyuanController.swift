//
//  SiyuanController.swift
//  Assignment5
//
//  Created by Siyuan Zan on 3/2/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI

struct SiyuanController: View {
    @Binding var signal:Signal
    @State var rotatedown=false
    @State var rotatetoggle=false
    @State var rotateup=false
    
    var body: some View {
        VStack(spacing:100){
            Button(action:{
                self.rotateup.toggle()
                self.signal.intValue-=1;
                if(self.signal.intValue<0)
                {
                    self.signal.intValue=0
                }
            })
            {
                Text("up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.9155147672, green: 0.8700567484, blue: 0.2019431591, alpha: 1)))
            }
            .frame(width:200,height:50)
            .background(Image("background").resizable())
            .rotationEffect(.degrees(30))
            .offset(x:-50,y:100)
            .animation(nil)
            .rotationEffect(self.rotateup ? .degrees(-5):.degrees(5), anchor:.leading)
            .animation(.default)
            HStack{
                
                Rectangle()
                    .frame(width:15,height:15)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                Slider(value: self.$signal.floatValue, in: 0.0...1, step: 0.1)
                    .accentColor(Color.black)
                    .padding()
                Rectangle()
                    .frame(width:25,height:25)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                
                
            }
            .rotationEffect(.degrees(5))
            .padding()
            Button(action:{
                self.rotatedown.toggle()
                self.signal.intValue+=1;
                if(self.signal.intValue>10)
                {
                    self.signal.intValue=10
                }
            })
            {Text("down")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(#colorLiteral(red: 0.06779225916, green: 0.2518874407, blue: 0.9502776265, alpha: 1)))
                
            }
            .frame(width:180,height:50)
            .background(Image("background").resizable())
            .rotationEffect(.degrees(-25))
            .offset(x:-130,y:-60)
            .animation(nil)
            .rotationEffect(self.rotatedown ? .degrees(-5):.degrees(5), anchor:.leading)
            .animation(.default)
            
            Button(action:{
                self.signal.toggleValue.toggle()
                self.rotatetoggle.toggle()
            })
            {Text( "toggle")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(#colorLiteral(red: 0.8525763154, green: 0.2489299476, blue: 0.5445427895, alpha: 1)))
                
                
                
                
            }
            .frame(width:300,height:50)
            .background(Color.black)
            .rotationEffect(.degrees(20))
            .offset(x:70,y:-100)
            .animation(nil)
            .rotationEffect(self.rotatetoggle ? .degrees(3):.degrees(-3), anchor:.leading)
            .animation(.default)
            
            
            
            
            
        }.scaleEffect(0.9)
            .frame(width:400,height:400)
        
    }
}

struct SiyuanController_Previews: PreviewProvider {
    static var previews: some View {
        SiyuanController(signal:.constant(Signal(intValue: 0, floatValue: 0.0, toggleValue: false)))
    }
}
