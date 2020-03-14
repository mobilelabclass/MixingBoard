//
//  ContentView.swift
//  MixingBoard
//
//  Created by Nien Lam on 2/29/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

// Signal structure.
struct Signal {
    // Range: 0 - 10
    var intValue: Int
    
    // Range: 0 - 1.0
    var floatValue: Float
    
    // True or False
    var toggleValue: Bool
}

// Container structure for name and controller view.
struct Controller {
    var name: String
    var view: (_ signal : Binding<Signal>) -> AnyView
}

// Container structure for name and visualizer view.
struct Visualizer {
    var name: String
    var view: (_ signal : Signal) -> AnyView
}

struct ContentView: View {
    @State var signal = Signal(intValue: 0, floatValue: 0, toggleValue: false)
    
    @State var visualizers = [Visualizer]()
    @State var controllers = [Controller]()
    
    @State var currentVisualizerIndex = 0
    @State var currentControllerIndex = 0
    
    @State var showOverlay = false
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Show active visualizer.
                makeVisualizer(currentIndex: currentVisualizerIndex)
                    .contentShape(Rectangle())
                    .onTapGesture(count: 2) {
                        self.showOverlay.toggle()
                    }
                /*
                VStack {
                    HStack {
                        makeVisualizer(currentIndex: 1)
                        makeVisualizer(currentIndex: 2)
                        makeVisualizer(currentIndex: 3)
                    }

                    HStack {
                        makeVisualizer(currentIndex: 4)
                        makeVisualizer(currentIndex: 5)
                        makeVisualizer(currentIndex: 6)
                    }
                }
                .scaleEffect(0.68)
                .onTapGesture(count: 2) {
                    self.showOverlay.toggle()
                }*/

                Spacer()
                
                // Show active controller.
                makeController(currentIndex: currentControllerIndex)
//                    .offset(y: -100)
            }
        }
        .colorScheme(.light)
        .onAppear() {
            self.addContent()
        }
    }
    
    // Helper method for getting visualizer based on current index.
    func makeVisualizer(currentIndex: Int) -> some View {
        guard visualizers.count > currentVisualizerIndex else { return AnyView(EmptyView()) }
        
        let visualizer = visualizers[currentIndex]
        
        return AnyView(
            ZStack {
                // Visualizer view.
                visualizer.view(signal)
                    .frame(width: 400, height: 400)
                    .clipped()

                    
                if showOverlay {
                    makeVisualizerOverlay(name: visualizer.name)
                }
            }
            .frame(width: 400, height: 400)
        )
    }
    
    func makeVisualizerOverlay(name: String) -> some View {
        ZStack {
            Color.black.opacity(0.45)
            
            VStack {
                HStack {
                    Text("\(name)\'s Visualizer")
                        .font(.system(size: 20))
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding(.top, 10)
        }
        .border(Color.black, width: 3)
        .contentShape(Rectangle())
        .gesture(DragGesture().onEnded { value in
            if value.translation.width < 0 {
                self.currentVisualizerIndex = min(self.currentVisualizerIndex + 1, self.visualizers.count - 1)
            } else if 0 < value.translation.width {
                self.currentVisualizerIndex = max(self.currentVisualizerIndex - 1, 0)
            }
        })
    }
    
    
    // Helper method for getting controller based on current index.
    func makeController(currentIndex: Int) -> some View {
        guard controllers.count > currentControllerIndex else { return AnyView(EmptyView()) }
        
        let controller = controllers[currentIndex]
        
        return AnyView(
            ZStack {
                // Controller view.
                controller.view($signal)
                    .frame(width: 400, height: 400)
                    .clipped()

                // Controls overlay.
                if showOverlay {
                    makeControllerOverlay(name: controller.name)
                }
            }
            .frame(width: 400, height: 400)
        )
    }
    
    func makeControllerOverlay(name: String) -> some View {
        ZStack {
            Color.black.opacity(0.45)
            
            VStack {
                HStack {
                    Text("\(name)\'s Controller")
                        .font(.system(size: 20))
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding(.top, 10)
        }
        .border(Color.black, width: 3)
        .contentShape(Rectangle())
        .gesture(DragGesture().onEnded { value in
            if value.translation.width < 0 {
                self.currentControllerIndex = min(self.currentControllerIndex + 1, self.controllers.count - 1)
            } else if 0 < value.translation.width {
                self.currentControllerIndex = max(self.currentControllerIndex - 1, 0)
            }
        })
    }
    
    // Helper method to add visualizer to array.
    func addVisualizer(name: String, view: @escaping (_ signal : Signal) -> AnyView) {
        let visualizer = Visualizer(name: name, view: view)
        visualizers.append(visualizer)
    }
    
    // Helper method to add controller to array.
    func addController(name: String, view: @escaping (_ signal : Binding<Signal>) -> AnyView) {
        let controller = Controller(name: name, view: view)
        controllers.append(controller)
    }
    
    // Helper method for adding visualizers and controllers.
    func addContent() {
        // Nien
        self.addVisualizer(name: "Nien") { AnyView(NiensVisualizer(signal: $0)) }
        self.addController(name: "Nien") { AnyView(NiensController(signal: $0)) }
        
        // Yongkun
        self.addVisualizer(name: "Yongkun") { AnyView(YongkunVisualizer(signal: $0)) }
        self.addController(name: "Yongkun") { AnyView(YongkunController(signal: $0)) }
        
        // Siyuan
        self.addVisualizer(name: "Siyuan") { AnyView(SiyuanVisualizer(signal: $0)) }
        self.addController(name: "Siyuan") { AnyView(SiyuanController(signal: $0)) }
        
        // Lanni
        self.addVisualizer(name: "Lanni") { AnyView(LanniVisualizer(signal: $0)) }
        self.addController(name: "Lanni") { AnyView(LanniController(signal: $0)) }
        
        // Nick
        self.addVisualizer(name: "Nick") { AnyView(NicksVisualizer(signal: $0)) }
        self.addController(name: "Nick") { AnyView(NicksController(signal: $0)) }

        // Cameron
        self.addVisualizer(name: "Cameron") { AnyView(CameronsVisualizer(signal: $0)) }
        self.addController(name: "Cameron") { AnyView(CameronsController(signal: $0)) }

        // Bilal
        self.addVisualizer(name: "Bilal") { AnyView(BilalVisualizer(signal: $0)) }
        self.addController(name: "Bilal") { AnyView(BilalController(signal: $0)) }

        // Raaziq
        self.addVisualizer(name: "Raaziq") { AnyView(RaazsVisualizer(signal: $0)) }
        self.addController(name: "Raaziq") { AnyView(RaazsController(signal: $0)) }

        // Becca
        self.addVisualizer(name: "Becca") { AnyView(BeccasVisualizer(signal: $0)) }
        self.addController(name: "Becca") { AnyView(BeccasController(signal: $0)) }

        // Kensu-Ra
        self.addVisualizer(name: "Kensu-Ra") { AnyView(RaVisualizer(signal: $0)) }
        self.addController(name: "Kensu-Ra") { AnyView(RaController(signal: $0)) }

        // Tianxu
        self.addVisualizer(name: "Tianxu") { AnyView(TianxuVisualizer(signal: $0)) }
        self.addController(name: "Tianxu") { AnyView(TianxuController(signal: $0)) }

        // Lizzy
        self.addVisualizer(name: "Lizzy") { AnyView(LizzyVisualizer(signal: $0)) }
        self.addController(name: "Lizzy") { AnyView(LizzyController(signal: $0)) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*
                 // Show active visualizer.
 //                makeVisualizer(currentIndex: currentVisualizerIndex)
 //                    .onTapGesture(count: 2) {
 //                        self.showOverlay.toggle()
 //                    }
                 
                 VStack {
                     HStack {
                         makeVisualizer(currentIndex: 1)
                         makeVisualizer(currentIndex: 2)
                         makeVisualizer(currentIndex: 3)
                     }

                     HStack {
                         makeVisualizer(currentIndex: 4)
                         makeVisualizer(currentIndex: 5)
                         makeVisualizer(currentIndex: 6)
                     }
                 }
                 .scaleEffect(0.68)
                 .onTapGesture(count: 2) {
                     self.showOverlay.toggle()
                 }

 //                Spacer()
                 
                 // Show active controller.
                 makeController(currentIndex: currentControllerIndex)
                     .offset(y: -100)
             }
 */
