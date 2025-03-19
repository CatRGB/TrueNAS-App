//
//  R30_Series.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 16.08.24.
//

import SwiftUI

struct R30_Series: View {
    
    var selectedSystem: TrueNASSysteme
    
    @State private var showingSheet = false
    @State private var currentStap = R30ConfigStep.platform
    @State private var configuration: [R30ConfigStep: String] = [:]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        Image(selectedSystem.imageName)
                            .resizable()
                            .frame(width: 300, height: 300)
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
            Text("Configure R30")
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                .shadow(radius: 10)
                .transition(.move(edge: .bottom))
        }
        .padding()
        
        .sheet(isPresented: $showingSheet) {
            R30ConfiSheet(currentStep: $currentStap, configuration: $configuration, showingSheet: $showingSheet)
        }
        .navigationTitle("TrueNAS R30")
    }
}

#Preview {
    R30_Series(selectedSystem: .r30)
}


