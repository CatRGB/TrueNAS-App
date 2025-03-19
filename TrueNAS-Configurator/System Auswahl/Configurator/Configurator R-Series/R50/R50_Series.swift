//
//  R50_Series.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 06.09.24.
//

import SwiftUI

struct R50_Series: View {
    var selectedSystem: TrueNASSysteme
    
    @State private var showingSheet = false
    @State private var currentStap = R50ConfigStep.platform
    @State private var configuration: [R50ConfigStep: String] = [:]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        Image(selectedSystem.imageName)
                            .resizable()
                            .frame(width: 350, height: 320)
                    }
                    .scrollTargetLayout()
                    Spacer()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 10)
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack (alignment: .leading, spacing: 10) {
                        Text("Produktname: \(selectedSystem.rawValue)")
                        Text("OS: \(selectedSystem.os)")
                        Text("RAM: \(selectedSystem.ram)")
                        Text("Laufwerke: \(selectedSystem.drives)")
                        Text("Ethernet: \(selectedSystem.ethernet)")
                        Text("Optional: \(selectedSystem.optional)")
                        Text("Fibre Channel: \(selectedSystem.fibreChannel)")
                        Text("Max Durchsatz: \(selectedSystem.maxThroughput)")
                        Text("Erweiterungsshelves: \(selectedSystem.expansionShelves)")
                        Text("Garantie: \(selectedSystem.garantie)")
                        Text("Features: \(selectedSystem.features)")
                        Text("Lizenzkosten: \(selectedSystem.lizenzkosten)")
                        Text("Support: \(selectedSystem.support)")
                    }
                }
                .padding()
            }
        }
        Button {
            self.currentStap = .platform
            self.showingSheet = true
        } label: {
            Text("Configure R50")
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                .shadow(radius: 10)
                .transition(.move(edge: .bottom))
        }
        .padding()
        
        .sheet(isPresented: $showingSheet) {
            R50ConfigSheet(currentStep: $currentStap, configuration: $configuration, showingSheet: $showingSheet)
        }
        .navigationTitle("TrueNAS R50")
    }
}


#Preview {
    R50_Series(selectedSystem: .r50)
}
