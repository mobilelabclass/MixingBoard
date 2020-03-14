import SwiftUI

struct CustomButtons: View {
    
    var color: Color
    var text: String
    
    var body: some View {
        Button(action: {
        }) {
            Text(text)
        }
        .font(.system(size: 35))
        .frame(width: 120, height: 50)
        .background(color)
        .foregroundColor(Color.white)
    }
}

struct CustomButtons_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtons(color: Color.blue, text: "30")
    }
}
