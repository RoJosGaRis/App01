//
//  ContentView.swift
//  AppAR
//
//  Created by Alumno on 04/10/23.
//

import SwiftUI
import RealityKit

struct PlanetasView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct PlanetasView_Previews : PreviewProvider {
    static var previews: some View {
        PlanetasView()
    }
}
#endif
