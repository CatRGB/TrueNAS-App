//
//  MiniSeries.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 11.06.24.
//

import SwiftUI

struct MiniSeries: View {
    var selectedSystem: TrueNASSysteme

    @State private var showingSheet = false
    @State private var currentStep = MiniConfigStep.platform
    @State private var configuration: [MiniConfigStep: String] = [:]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        Image(selectedSystem.imageName)
                            .resizable()
                            .frame(width: 350, height: 370)

                        Image("Mini_X_Open")
                            .resizable()
                            .frame(width: 350, height: 370)
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
            Text("Configure Mini X")
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                .shadow(radius: 10)
                .transition(.move(edge: .bottom))

        }
        .padding()
        
        .sheet(isPresented: $showingSheet) {
            MiniConfigSheet(currentStep: $currentStep, configuration: $configuration, showingSheet: $showingSheet)
        }
        .navigationTitle("TrueNAS MiniX-Series")
    }
}

#Preview {
    MiniSeries(selectedSystem: .miniX)
}
