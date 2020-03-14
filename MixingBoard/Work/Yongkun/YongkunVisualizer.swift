//
//  YongkunVisualizer.swift
//  ControlVisual
//
//  Created by Yongkun Li on 3/2/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct YongkunVisualizer: View {
    var signal: Signal
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isSleeping:Bool = false;
    @State var secondAngle:Double = 0
    @State var minuteAngle:Double = 270
    
    var body: some View {
        VStack{
            HStack{
                // window
                ZStack{
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .foregroundColor(self.signal.toggleValue ? Color("windowNightColor") : Color("windowDayColor"))
                        .overlay(ZStack{
                            Image(systemName: self.signal.toggleValue ? "moon.fill" : "sun.max.fill")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: 75, height: 75)
                                .offset(x: -20, y: -10)
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 10)
                                .foregroundColor(.black)
                            }
                    )
                    Rectangle()
                        .frame(width: 7, height: 120)
                        .foregroundColor(.black)
                    Rectangle()
                        .frame(width: 120, height: 7)
                        .foregroundColor(.black)
                }.padding()
                    .animation(Animation.easeInOut(duration: 1.5))
                
                Spacer()
                // clock
                ZStack{
                    Circle()
                        .foregroundColor(.orange)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 8)
                    )
                        .frame(width: 100, height: 100)
                    Circle()
                        .frame(width: 7, height: 7)
                    Rectangle()
                        .frame(width: 7, height: 40)
                        .foregroundColor(.white)
                        .offset(x: 0, y: -20)
                        .rotationEffect(.degrees(self.secondAngle), anchor: .center)
                    Rectangle()
                        .frame(width: 7, height: 24)
                        .foregroundColor(.white)
                        .offset(x: 0, y: -12)
                        .rotationEffect(.degrees(self.minuteAngle), anchor: .center)
                }.padding()
                    .onReceive(timer){_ in
                        self.secondAngle += Double((self.signal.intValue + 1) * 6)
                        if (self.secondAngle > 360){
                            self.secondAngle -= 360
                            self.minuteAngle += 6
                            if (self.minuteAngle > 360) {self.minuteAngle -= 360}
                        }
                }
            }.padding(25)
            
            
            Spacer()
            
            
            ZStack(alignment:.bottom){
                // table
                RoundedRectangle(cornerRadius: 10)
                    
                    .foregroundColor(Color("tableColor"))
                    .frame(height: 50)
                
                HStack{
                    Spacer()
                    // cat
                    ZStack(alignment:.leading){
                        if(self.signal.floatValue < 0.3){
                            Image("cat")
                                .resizable()
                                .frame(width: 240, height: 150)
                                .scaleEffect(self.signal.floatValue < 0.2 ? 1.05:1, anchor: .bottom)
                                .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true))
                        }else{
                            Image("cat")
                                .resizable()
                                .frame(width: 240, height: 150)
                        }
                        
                        // eyes
                        HStack{
                            Ellipse()
                                .frame(width: 8, height: CGFloat(self.signal.floatValue * 20))
                            Ellipse()
                                .frame(width: 8, height: CGFloat(self.signal.floatValue * 20))
                        }.foregroundColor(.white)
                            .offset(x: 54, y: 15)
                    }
                    
                }.padding(.trailing, 10)
            }
        }.animation(nil)
        .background( self.signal.toggleValue ? RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .init(x: 1, y: 0.1), startRadius: 50, endRadius: 500) : RadialGradient(gradient: Gradient(colors: [.yellow, .orange]), center: .init(x: 1, y: 0.1), startRadius: 50, endRadius: 500))
        .frame(width:400, height:400)
        .animation(Animation.easeInOut(duration: 1.5))
    }
}

struct YongkunVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        YongkunVisualizer(signal: Signal(intValue: 0, floatValue: 0, toggleValue: false))
    }
}
