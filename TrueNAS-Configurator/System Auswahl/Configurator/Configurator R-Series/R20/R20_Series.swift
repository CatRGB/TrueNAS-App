//
//  R20_Series.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 16.08.24.
//

import SwiftUI

struct R20_Series: View {
    
    var selectedSystem: TrueNASSysteme
    
    @State private var showingSheet = false
    @State private var currentStap = R20ConfigStep.platform
    @State private var configuration: [R20ConfigStep: String] = [:]
    
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
            Text("Configure R20")
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                .shadow(radius: 10)
                .transition(.move(edge: .bottom))
        }
        .padding()
        
        .sheet(isPresented: $showingSheet) {
            R20ConfiSheet(currentStep: $currentStap, configuration: $configuration, showingSheet: $showingSheet)
        }
        .navigationTitle("TrueNAS R20")
    }
}

#Preview {
    R10_Series(selectedSystem: .r20)
}


