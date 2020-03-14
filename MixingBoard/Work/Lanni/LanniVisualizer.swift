

import SwiftUI

struct LanniVisualizer: View {
    var signal:Signal
    @State var roadMoving : CGFloat = 200;
    @State var carMoving : CGFloat = 200;

  let timer = Timer.publish(every:0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{

            ZStack{
                
                  Image("road")
                                     .resizable()
                //                     .edgesIgnoringSafeArea(.all)
                                     .frame(width: 400, height: 400)
                                     .position(x: 205, y : 200)
                 Image("road")
                     .resizable()
//                     .edgesIgnoringSafeArea(.all)
                     .frame(width: 400, height: 400)
                     .position(x: 205, y : roadMoving)

             }

            ZStack{
                        Image("car")
                            .resizable()
                            .frame(width: 45, height: 90)
                            .position(x:carMoving, y:100)
                           .animation(.easeInOut(duration: 0.2))
                    }
                
            .onReceive(self.timer){_ in
                // self.signal.toggleValue = true

                    //if self.signal.toggleValue {
                        self.roadMoving += CGFloat(40*self.signal.floatValue)
                        
                        
                        self.carMoving += CGFloat(self.signal.intValue)
                  //          }
                
                if self.roadMoving > 300 {
                    self.roadMoving = 200
                }
                
            }

        }
    .frame(width: 400, height: 400)
    .clipped()


    }
}

struct LanniVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        LanniVisualizer(signal: Signal(intValue: 0, floatValue: 0.0, toggleValue: false))
    }
}
