import SwiftUI

struct CustomText: View {
    
    var text: String
    var size: CGFloat

    var body: some View {
        Text(text).font(.system(size: size))
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText(text: "Cameron Partee", size: 30)
    }
}
