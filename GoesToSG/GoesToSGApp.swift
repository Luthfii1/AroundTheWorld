//
//  GoesToSGApp.swift
//  GoesToSG
//
//  Created by Luthfi Misbachul Munir on 07/05/24.
//

import SwiftUI
import ARKit

@main
struct MyApp: App {
    @State var session = ARKitSession()
    @State var immersionState: ImmersionStyle = .mixed
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        ImmersiveSpace(id: "appSpace") {
            MixedImmersionView()
            .task {
                print("Hallo")
                let planeData = PlaneDetectionProvider(alignments: [.horizontal])
                
                if PlaneDetectionProvider.isSupported {
                    do {
                        try await session.run([planeData])
                        for await update in planeData.anchorUpdates {
                            // Update app state.
                        }
                    } catch {
                        print("ARKit session error \(error)")
                    }
                }
            }
        }
        .immersionStyle(selection: $immersionState, in: .mixed)
    }
}
