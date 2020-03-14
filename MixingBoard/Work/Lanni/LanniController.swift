import SwiftUI

struct LanniController: View {
    @Binding var signal: Signal
    

    
    var body: some View {
        ZStack{
            Rectangle ()
            .fill(Color.red)
             .frame(width: 400, height: 400)
            
        VStack{
            //speed
              HStack{
                Text("0.0")
                
                Slider(value: self.$signal.floatValue, in: 0.0...1.0, step: 0.1)
                    Text("\(self.signal.floatValue)")
                
            }
            
            //left and right
            Button(action:{
                self.signal.intValue += 1;
                if(self.signal.intValue>10)
                {
                    self.signal.intValue = 10
                }
            })
            {Text("left:\(self.signal.intValue)")}
      
        Button(action:{
                self.signal.intValue -= 1;
//                if(self.signal.intValue<0)
//                {
//                    self.signal.intValue = 0
//                }
            })
            {Text("right:\(self.signal.intValue)")}
        
        }
        }
        
        //        .onAppear() {
        //            self.signal.toggleValue = true
        //        }
        }
     
    
}

struct LanniController_Previews: PreviewProvider {
    static var previews: some View {
        LanniController(signal:.constant(Signal(intValue: 0, floatValue: 0.0, toggleValue: false)))
    }
}
