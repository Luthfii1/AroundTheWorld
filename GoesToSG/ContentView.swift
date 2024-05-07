//
//  ContentView.swift
//  GoesToSG
//
//  Created by Luthfi Misbachul Munir on 07/05/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    
    var body: some View {
        Button("Start ARKit experience") {
            Task {
                await openImmersiveSpace(id: "appSpace")
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
