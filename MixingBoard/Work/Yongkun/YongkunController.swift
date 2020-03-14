//
//  YongkunController.swift
//  ControlVisual
//
//  Created by Yongkun Li on 3/2/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct YongkunController: View {
    @Binding var signal: Signal
    @State var joystickPosition: CGSize = .init(width: 0, height: 0)
    let togglebuttonSize:CGFloat = 30
    let joystickSize:CGFloat = 100
    let joybuttonSize:CGFloat = 50
    
    var body: some View {
        VStack{
            // Toggle Button
            Button(action:{
                self.signal.toggleValue.toggle();
            }){ZStack{
                Circle()
                    .foregroundColor(.gray)
                    .shadow(radius: 5)
                    .frame(width: togglebuttonSize, height: togglebuttonSize)
                    .padding()
                Circle()
                    .stroke(lineWidth: 4)
                    .foregroundColor(.gray)
                    .shadow(radius: 5)
                    .frame(width: togglebuttonSize/3, height: togglebuttonSize/3)
                }
            }
            
            
            
            Spacer()
            
            
            
            HStack{
                //---------
                // Joystick
                //---------
                ZStack{
                    Circle()
                        .foregroundColor(.black)
                        .frame(width: joystickSize, height: joystickSize)
                    Circle()
                        .stroke( lineWidth: 3)
                        .frame(width: joystickSize-10, height: joystickSize-10)
                        .shadow(color: Color(red: 192/255, green: 189/255, blue: 191/255), radius: 2)
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: joystickSize-20, height: joystickSize-20)
                        .offset(joystickPosition)
                        .shadow(radius: 5)
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onChanged{ value in
                                // keep joystick in the right position
                                if (pow(value.translation.width, 2) + pow(value.translation.height, 2) <= pow(self.joystickSize/2, 2)) {
                                    self.joystickPosition.width = value.translation.width
                                    self.joystickPosition.height = value.translation.height
                                }else{
                                    let theta = atan(value.translation.width/value.translation.height)
                                    self.joystickPosition.width = sin(theta) * self.joystickSize/2
                                    self.joystickPosition.height = cos(theta) * self.joystickSize/2
                                    if (value.translation.height < 0){
                                        self.joystickPosition.width *= -1
                                        self.joystickPosition.height *= -1
                                    }
                                }
                                
                                // change value
                                self.signal.floatValue = Float((-self.joystickPosition.height+self.joystickSize/2)/self.joystickSize)
                        }
                        .onEnded{value in
                            self.joystickPosition = .init(width: 0, height: 0)
                            }
                    )
                }
                .padding(50)
                
                
                Spacer()
                
                
                //---------
                // Button B
                //---------
                Button(action:{
                    self.signal.intValue -= 1
                    if(self.signal.intValue < 0) {self.signal.intValue = 0}
                }){ZStack{
                    Circle()
                        .foregroundColor(.gray)
                        .shadow(radius: 5)
                    Text("B")
                        .font(.custom("HelveticaNeue", size: 36))
                        .foregroundColor(.black)
                        .shadow(radius: 1)
                    }
                }
                .frame(width: joybuttonSize, height: joybuttonSize)
                .offset(y:20)
                .padding(.trailing, 30)
                
                
                //---------
                // Button A
                //---------
                Button(action:{
                    self.signal.intValue += 1
                    if(self.signal.intValue > 10) {self.signal.intValue = 10}
                }){ZStack{
                    Circle()
                        .foregroundColor(.gray)
                        .shadow(radius: 5)
                    Text("A")
                        .font(.custom("HelveticaNeue", size: 36))
                        .foregroundColor(.black)
                        .shadow(radius: 1)
                    }
                }.frame(width: joybuttonSize, height: joybuttonSize)
                    .offset(y:-20)
                    .padding(.trailing, 40)
            }.padding(.bottom, 80)
            
            
            // select and start
            HStack{
                Button(action:{
                    
                }){ZStack{
                    Circle()
                        .foregroundColor(.gray)
                    }
                }
                .frame(width: togglebuttonSize, height: togglebuttonSize)
                .padding(.trailing, 10)
                
                Button(action:{
                    
                }){ZStack{
                    Circle()
                        .foregroundColor(.gray)
                    }
                }.frame(width: togglebuttonSize, height: togglebuttonSize)
                .padding(.leading, 10)
            }
            .padding(.bottom, 20)
        }.frame(width:400, height:400)
        .background(Color.blue)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 5)
            .shadow(color: .gray, radius: 2)
        )
    }
}

struct YongkunController_Previews: PreviewProvider {
    @State static var signal = Signal(intValue: 0, floatValue: 0, toggleValue: false);
    static var previews: some View {
        YongkunController(signal: $signal)
    }
}
