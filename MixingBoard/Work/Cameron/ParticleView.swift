import SwiftUI
import SpriteKit

struct ParticleView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let view = SKView(frame: UIScreen.main.bounds)
        view.backgroundColor = .clear
        
        let scene = SKScene(size: UIScreen.main.bounds.size)
        scene.backgroundColor = .clear
        
        let emitterNode = SKEmitterNode(fileNamed: "BdayRain.sks")
        emitterNode?.position = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height * 0.9)
        emitterNode?.zPosition = 2
        
        let emitterNodeTwo = SKEmitterNode(fileNamed: "CakeRain.sks")
        emitterNodeTwo?.position = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height * 0.9)
        emitterNodeTwo?.zPosition = 2
        
        scene.addChild(emitterNode!)
        scene.addChild(emitterNodeTwo!)
        
        view.presentScene(scene)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
