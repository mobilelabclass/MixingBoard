import SwiftUI

struct CameronsVisualizer: View {
    
    var signal: Signal
    
    var body: some View {
        // animaitions go here
        VStack {
            HStack {
                CustomImage(name: "bottles", width: 70.0, height: 70.0).rotationEffect(.degrees(-Double(signal.intValue) * 15.0))
                CustomImage(name: "smile", width: 150, height: 150).opacity(Double(signal.floatValue))
                CustomImage(name: "bottles", width: 70.0, height:70.0).rotationEffect(.degrees(Double(signal.intValue) * 15.0))
            }
            if(signal.toggleValue) {
                ParticleView()
            }
            Spacer()
        }
       
    }
}

struct CameronsVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        CameronsVisualizer(signal: Signal(intValue: 5, floatValue: 0.7, toggleValue: false))
    }
}
