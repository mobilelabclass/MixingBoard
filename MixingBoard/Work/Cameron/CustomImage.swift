import SwiftUI

struct CustomImage: View {
    
    var name: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Image(name)
        .resizable()
        .frame(width: width, height: height)
        .padding()
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(name: "smile", width: 150.0, height: 150.0)
    }
}
