//
//  SiyuanVisualizer.swift
//  Assignment5
//
//  Created by Siyuan Zan on 3/4/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//



import SwiftUI

struct SiyuanVisualizer: View {
    var signal: Signal
    @State var count=4
    func ColorToggle(number:Int)->Color{
        var colors=[ Color(#colorLiteral(red: 0.06779225916, green: 0.2518874407, blue: 0.9502776265, alpha: 1)),Color(#colorLiteral(red: 0.9574583173, green: 0.1496190131, blue: 0.06830295175, alpha: 1)),Color.black,Color(#colorLiteral(red: 0.9319594502, green: 0.9268822074, blue: 0.008320843801, alpha: 1))]
        if(self.signal.toggleValue==true){
            if(number==0){
                colors=[Color(#colorLiteral(red: 0.8525763154, green: 0.2489299476, blue: 0.5445427895, alpha: 1)),Color(#colorLiteral(red: 0.9574583173, green: 0.1496190131, blue: 0.06830295175, alpha: 1)),Color.black,Color(#colorLiteral(red: 0.9319594502, green: 0.9268822074, blue: 0.008320843801, alpha: 1))]
            }
            if(self.signal.floatValue>0 && self.signal.floatValue<=1/3){
                colors=[Color(#colorLiteral(red: 0.06779225916, green: 0.2518874407, blue: 0.9502776265, alpha: 1)),Color(#colorLiteral(red: 0.8525763154, green: 0.2489299476, blue: 0.5445427895, alpha: 1)),Color.black,Color(#colorLiteral(red: 0.9319594502, green: 0.9268822074, blue: 0.008320843801, alpha: 1))]
            }
            if(self.signal.floatValue>1/3 && self.signal.floatValue<=2/3){
                colors=[Color(#colorLiteral(red: 0.06779225916, green: 0.2518874407, blue: 0.9502776265, alpha: 1)),Color(#colorLiteral(red: 0.9574583173, green: 0.1496190131, blue: 0.06830295175, alpha: 1)),Color(#colorLiteral(red: 0.8525763154, green: 0.2489299476, blue: 0.5445427895, alpha: 1)),Color(#colorLiteral(red: 0.9319594502, green: 0.9268822074, blue: 0.008320843801, alpha: 1))]
            }
            if(self.signal.floatValue>2/3 && self.signal.floatValue<=1){
                colors=[Color(#colorLiteral(red: 0.06779225916, green: 0.2518874407, blue: 0.9502776265, alpha: 1)),Color(#colorLiteral(red: 0.9574583173, green: 0.1496190131, blue: 0.06830295175, alpha: 1)),Color.black,Color(#colorLiteral(red: 0.8525763154, green: 0.2489299476, blue: 0.5445427895, alpha: 1))]
            }
            
            
        }
        return colors[number]
    }
    
    func offsetCheck(number:Int)->CGFloat{
        var offsets:[CGFloat]=[-10,-25,8,0]
        
        if(number==0){
            offsets=[CGFloat( 4*self.signal.intValue)-10,-25,8,0]
        }
        if(self.signal.floatValue>0 && self.signal.floatValue<=1/3){
            offsets=[-10,CGFloat( 4*self.signal.intValue)-25,8,0]
        }
        if(self.signal.floatValue>1/3 && self.signal.floatValue<=2/3){
            offsets=[-10,-25,CGFloat( 4*self.signal.intValue)+8,0]
            
        }
        if(self.signal.floatValue>2/3 && self.signal.floatValue<=1){
            offsets=[-10,-25,8,CGFloat( 4*self.signal.intValue)]
        }
        
        
        
        return offsets[number]
    }
    
    func Rectwidth(number:Int)->CGFloat{
        var widths=[CGFloat(160),CGFloat(40),CGFloat(40),CGFloat(40)]
        
        if(self.signal.floatValue>0 && self.signal.floatValue<=1/3){
            widths=[CGFloat(160-360*self.signal.floatValue),CGFloat(40+360*self.signal.floatValue),CGFloat(40),CGFloat(40)]
            return widths[number]
            
        }
        
        if(self.signal.floatValue>1/3 && self.signal.floatValue<=2/3){
            widths=[CGFloat(40),CGFloat(280-360*self.signal.floatValue),CGFloat(360*self.signal.floatValue-80),CGFloat(40)]
            return widths[number]}
        
        
        
        if(self.signal.floatValue>2/3 && self.signal.floatValue<=1){
            widths=[CGFloat(40),CGFloat(40),CGFloat(400-360*self.signal.floatValue),CGFloat(360*self.signal.floatValue-200)]
            
            return widths[number]}
        
        return widths[number]
        
        
    }
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            HStack(spacing:CGFloat(Int.random(in: -6..<0))){
                //        ZStack{
                ForEach(0..<self.count,id:\.self){ number in
                    SectionView(section:sectionData[number], ifStart: false)
                        .background(self.ColorToggle(number: number))
                        .frame(width: self.Rectwidth(number: number),height:220)
                        .offset(y:self.offsetCheck(number: number))
                    
                }
                
                
            }
            
        }
        .frame(width:320,height:380)
        .offset(y:-35)
            
        .background(Image("people").resizable())
        .background(Color(#colorLiteral(red: 0.9065316319, green: 0.9020314217, blue: 0.8888298869, alpha: 1)))
        .border( Color(#colorLiteral(red: 0.8045790792, green: 0.8000651002, blue: 0.7868789434, alpha: 1)), width: 8)
        
        
    }
}



struct SiyuanVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        SiyuanVisualizer(signal: Signal(intValue: 0, floatValue: 0.0, toggleValue: false))
    }
}

struct SectionView: View {
    var section: Section
    @State var ifStart=true
    
    func move(height:CGFloat,width:CGFloat)->CGFloat{
        let a = height/2
        let b = width*0.1
        return b-a
        
    }
    
    func move2(height:CGFloat,width:CGFloat)->CGFloat{
        let a = height/2
        let b = width*0.1
        return a-b
        
    }
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                //        Image("rect-1")
                //        .resizable()
                self.section.image
                    .resizable()
                    .offset(x:self.ifStart ? self.section.width1 : self.section.width2 ,y: self.ifStart ? self.move(height: geometry.size.height,width:50) : self.move2(height: geometry.size.height,width: 50))
                    .animation(Animation.linear(duration:2).repeatForever(autoreverses: true))
                    .scaleEffect(x:CGFloat(self.section.scaleEffect1),y:CGFloat(self.section.scaleEffect2))
                    .opacity( self.section.opacity)
                    .onAppear(){
                        self.ifStart.toggle()
                }
            }
            
        }
        
    }
}



struct Section:Identifiable{
    
    var id=UUID()
    var image: Image
    var color: Color
    var width1: CGFloat
    var width2: CGFloat
    var opacity:Double
    var scaleEffect1:Double
    var scaleEffect2:Double
    
    
    
}
//
let sectionData = [
    Section(image:Image("rect3") , color: Color.white, width1: -20,width2:20,opacity:1,scaleEffect1:0.4,scaleEffect2:0.5),
    Section(image:Image("rect2") , color: Color.white, width1: 0,width2:0,opacity:1,scaleEffect1:0.3,scaleEffect2:0.2),
    Section(image:Image("rect2") , color: Color.white, width1: 0,width2:0,opacity:0,scaleEffect1:0.4,scaleEffect2:0.5),
    Section(image:Image("line") , color: Color.white, width1: 0,width2:0,opacity:1,scaleEffect1:1,scaleEffect2:0.5)
    
]

