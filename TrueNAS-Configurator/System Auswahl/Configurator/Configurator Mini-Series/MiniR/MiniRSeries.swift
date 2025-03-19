//
//  MiniRSeries.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 26.07.24.
//

import SwiftUI

struct MiniRSeries: View {
    var selectedSystem: TrueNASSysteme
    
    @State private var showingSheet = false
    @State private var currentStep = MiniRConfigStep.platform
    @State private var configuration: [MiniRConfigStep: String] = [:]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        Image(selectedSystem.imageName)
                            .resizable()
                            .frame(width: 310, height: 310)

                        Image("truenas-mini-r-open")
                            .resizable()
                            .frame(width: 310, height: 310)
                    }
                    .scrollTargetLayout()
                    Spacer()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 10)
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 10) {
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
        Button  {
            self.currentStep = .platform
            self.showingSheet = true
        } label: {
            Text("Configure Mini R")
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                .shadow(radius: 10)
                .transition(.move(edge: .bottom))

        }
        .padding()
        
        .sheet(isPresented: $showingSheet) {
            MiniRConfiSheet(currentStep: $currentStep, configuration: $configuration, showingSheet: $showingSheet)
        }
        .navigationTitle("TrueNAS MiniR-Series")
    }
}

#Preview {
    MiniRSeries(selectedSystem: .miniR)
}

