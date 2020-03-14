//
//  NicksVisualizer.swift
//  SimpleVersion
//
//  Created by Nicholas Grant on 3/2/20.
//  Copyright © 2020 nicholasgrant. All rights reserved.
//

import SwiftUI

struct NicksVisualizer: View {
    
    var signal: Signal
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.red, .purple]), startPoint: .bottom, endPoint: .top)
            
            VStack {
                
                Text(signal.toggleValue ? "🙈" : "🐵").font(.custom("Helvetica", size: (CGFloat(signal.floatValue * 150))))
                    .padding(30)
//                Text("Monkeys: \(intValue)")
                
                if self.signal.intValue == 10 {
                    withAnimation {
                        VStack {
                            
                            Text("Ten little monkeys jumping on a bed").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("One fell off and bumped his head").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("'This is too dangerous,' one monkey said").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("'Let's play safe before we wind up dead.'").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            
                            Text("🙉🙊🙉🙊🙉🙊🙉🙊🙉").font(.largeTitle)
                            
                        }
                    }
                }
                
                if self.signal.intValue == 9 {
                    withAnimation {
                        VStack {
                            
                            Text("Ten little monkeys went out to dine").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("One choked on a bone and then there were nine").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            
                            Text("🙊🙉🙊🙉🙊🙉🙊🙉").font(.largeTitle)
                            Text("🦴")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .cornerRadius(10)
                        }
                    }
                }
                
                if self.signal.intValue == 8 {
                    withAnimation {
                        VStack {
                            Text("Nine little monkeys gone fishing with bait").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("A shark swalled one and then there were eight").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("🙉🙊🙉🙊🙉🙊🙉").font(.largeTitle)
                            Text("🦈")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .cornerRadius(10)
                            
                        }
                    }
                }
                
                if self.signal.intValue == 7 {
                    withAnimation {
                        VStack {
                            Text("Seven little monkeys trying to stay alive").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("One chopped too much and then there were six").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("🙉🙊🙉🙊🙉🙊").font(.largeTitle)
                            Text("🪓").rotation3DEffect(.degrees(180), axis: (x: 5, y: 5, z: 0))
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .cornerRadius(10)
                        }
                    }
                }
                
                if self.signal.intValue == 6 {
                    withAnimation {
                        VStack {
                            Text("Six little monkeys trying to stay alive").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("One got killed and then there were five").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("🙉🙊🙉🙊🙉").font(.largeTitle)
                            Text("💀")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .cornerRadius(10)
                        }
                    }
                }
                
                if self.signal.intValue == 5 {
                    withAnimation {
                        VStack {
                            Text("Five little monkeys swinging on a door").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("One broke his neck and then there were four").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("🙉🙊🙉").font(.largeTitle)
                            Text("🚪")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .cornerRadius(10)
                        }
                    }
                }
                
                if self.signal.intValue == 4 {
                    withAnimation {
                        VStack {
                            Text("Four little monkeys had to take a pee").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("One flushed the toilet and then there were three").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("🙉🙊").font(.largeTitle)
                            Text("🚽")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .cornerRadius(10)
                        }
                    }
                }
                
                if self.signal.intValue == 3 {
                    withAnimation {
                        VStack {
                            Text("Three little monkeys on a trip to the zoo").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("A lion got loose and then there were two").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("🙉").font(.largeTitle)
                            Text("🦁")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .cornerRadius(10)
                        }
                    }
                }
                
                if self.signal.intValue == 2 {
                    withAnimation {
                        VStack {
                            Text("Two little monkeys laying in the sun").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                            Text("One caught fire and then there was one").font(.custom("Times New Roman", size: (20)))
                                .foregroundColor(Color.yellow)
                        }
                    }
                }
            }
        }
    }
}

//struct NicksVisualizer_Previews: PreviewProvider {
//    static var previews: some View {
//        NicksVisualizer(signal: Signal())
//    }
//}
