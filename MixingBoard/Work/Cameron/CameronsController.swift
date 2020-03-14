import SwiftUI

struct CameronsController: View {
    
    // @Binding is changing var, sending data up
    @Binding var signal: Signal
    
    var body: some View {
        VStack {
            
            HStack {
                CustomButtons(color: Color.red, text: "\(signal.intValue)")
                CustomButtons(color: Color.purple, text: "\(signal.toggleValue.description.capitalized)")
                CustomButtons(color: Color.blue, text: String(format: "%.2f", signal.floatValue))
            }
            
            VStack {
                Toggle(isOn: $signal.toggleValue) {
                    CustomText(text: "On/Off", size: 25)
                }
                Stepper(value: $signal.intValue, in: 0...10) {
                    CustomText(text: "Int Value", size: 30)
                }
                Slider(value: $signal.floatValue)
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .padding(.bottom, 15)
            .padding(.top, 15)
        }
    }
}

struct CameronsController_Previews: PreviewProvider {
    static var previews: some View {
        CameronsController(signal: .constant(Signal(intValue: 5, floatValue: 0.2, toggleValue: true)))
    }
}
