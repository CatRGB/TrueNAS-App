//
//  MiniRConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 26.07.24.
//

import Foundation
import SwiftUI

enum MiniRConfigStep: String, CaseIterable, Identifiable {
    case platform = "Platform"
    case configuration = "Configuration"
    case driveTypeHDD = "Drive Type HDD"
    case driveAmountHDD = "Drive Amount HDD"
    case driveTypeSSD = "Drive Type SSD"
    case driveAmountSSD = "Drive Amount SSD"
    case accessoriesRailKit = "Rail Kit"
    case accessoriesAdaptor = "Adaptor"
    case operatingSystem = "Operating System"
    case warranty = "Warranty"
    case summary = "Summary"
    
    var id: Self { self }
}

struct MiniRConfiSheet: View {
    @Binding var currentStep: MiniRConfigStep
    @Binding var configuration: [MiniRConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    
    let platformOptions = ["select device", "Mini R"]
    let configurationOptions = ["select configuration","8 Core, 32 GB RAM, 2x 10 GbE", "8 Core, 64 GB RAM, 2x  10 GbE", "8 Core, 64 GB RAM, 2x  10 SFP+"]
    let driveTypeHDDOptions = ["Empty", "4TB SAS HDD", "6TB SAS HDD", "8TB SAS HDD", "12TB SAS HDD", "14TB SAS HDD", "18TB SAS HDD", "22TB SAS HDD"]
    let driveTypeSSDOptions = ["Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    let operatingSystemOptions = ["select system", "CORE", "SCALE"]
    let railKit = ["Empty", "Short Rail Kit 19-26,6", "Long Rail Kit 26,5-36,4"]
    let adaptor = ["Empty", "2,5 Adaptor for SSD"]
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Form {
                    Picker("Platform", selection: $configuration[.platform].boundR) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Configuration", selection:  $configuration[.configuration].boundR) {
                        ForEach(configurationOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Drive Type HDD", selection: $configuration[.driveTypeHDD].boundR) {
                        ForEach(driveTypeHDDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of HDDs")
                        Slider(value: $hddAmount, in: 0...12, step: 1)
                        Text("\(Int(hddAmount)) HDDs selected")
                        Button("OK") {
                            configuration[.driveTypeHDD] = "\(Int(hddAmount)) HDDs selected"
                        }
                    }
                    
                    Picker("Drive Type SSD", selection: $configuration[.driveAmountSSD].boundR) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of SSDs")
                        Slider(value: $ssdAmount, in: 0...12, step: 1)
                        Text("\(Int(ssdAmount)) SSDs selected")
                        Button("OK") {
                            configuration[.driveTypeSSD] = "\(Int(ssdAmount)) SSD selected"
                        }
                    }
                    
                    Picker("Rail Kit", selection: $configuration[.accessoriesRailKit].boundR) {
                        ForEach(railKit, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Adaptor", selection: $configuration[.accessoriesAdaptor].boundR) {
                        ForEach(adaptor, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Operating System", selection: $configuration[.operatingSystem].boundR) {
                        ForEach(operatingSystemOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Warranty", selection: $configuration[.warranty].boundR) {
                        ForEach(warrantyOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                }
            } else {
                MiniRSummaryView(configuration: configuration)
            }
            Spacer()
            
            if (currentStep != .summary) {
                Button("Show Summary") {
                    currentStep = .summary
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(16)
                .shadow(radius: 10)
                .transition(.move(edge: .bottom))
            }
            
            Button("Cancel") {
                showingSheet = false
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(16)
            .shadow(radius: 10)
            .transition(.move(edge: .bottom))
        }
    }
}

struct MiniRSummaryView: View {
    let configuration: [MiniRConfigStep: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(MiniRConfigStep.allCases, id: \.self) { step in
                if let value = configuration[step] {
                    Text("\(step.rawValue): \(value)")
                }
            }
            
            Button("Request Quote") {
                // Action für die E-Mail
                
                
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(16)
            .shadow(radius: 10)
            .transition(.move(edge: .bottom))
            
            .padding()
        }
    }
}

extension Binding where Value == String? {
    var boundR: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
            
        )
    }
}
