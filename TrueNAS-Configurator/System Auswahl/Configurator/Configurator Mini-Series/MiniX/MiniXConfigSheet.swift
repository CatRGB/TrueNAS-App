//
//  MiniConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 19.06.24.
//

import Foundation
import SwiftUI

enum MiniConfigStep: String, CaseIterable, Identifiable {
    case platform = "Platform"
    case configuration = "Configuration"
    case driveTypeHDD = "Drive Type HDD"
    case driveAmountHDD = "Drive Amount HDD"
    case driveTypeSSD = "Drive Type SSD"
    case driveAmountSSD = "Drive Amount SSD"
    case accessories = "Accessories"
    case operatingSystem = "Operating System"
    case warranty = "Warranty"
    case summary = "Summary"
    
    var id: Self { self }
}

struct MiniConfigSheet: View {
    @Binding var currentStep: MiniConfigStep
    @Binding var configuration: [MiniConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    let platformOptions = ["select device", "Mini X", "Mini X+"]
    let configurationOptions = ["select configuration","4 Core, 16 GB RAM, 4x GbE", "4 Core, 32 GB RAM, 4x GbE"]
    let driveTypeHDDOptions = ["Empty", "4TB HDD", "6TB HDD", "8TB HDD", "12TB HDD", "18TB HDD", "22TB HDD"]
    let driveTypeSSDOptions = ["Empty", "19TB SSD", "38TB SSD", "76TB SSD", "SSD Read Cache", "SSD Write Cache"]
    let operatingSystemOptions = ["select system", "CORE", "SCALE"]
    let accessoriesOptions = ["Not 2.5 Adaptor for SSDs", "2.5 Adaptor for SSDs"]
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Form {
                    Picker("Platform", selection: $configuration[.platform].boundX) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    
                    Picker("Configuration", selection: $configuration[.configuration].boundX) {
                        ForEach(configurationOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Drive Type HDD", selection: $configuration[.driveTypeHDD].boundX) {
                        ForEach(driveTypeHDDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of HDDs")
                        Slider(value: $hddAmount, in: 0...5, step: 1)
                        Text("\(Int(hddAmount)) HDDs selected")
                        Button("OK") {
                            configuration[.driveAmountHDD] = "\(Int(hddAmount)) HDDs selected"
                        }
                    }
                    
                    Picker("Drive Type SSD", selection: $configuration[.driveTypeSSD].boundX) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of SSDs")
                        Slider(value: $ssdAmount, in: 0...2, step: 1)
                        Text("\(Int(ssdAmount)) SSDs selected")
                        Button ("OK") {
                            configuration[.driveAmountSSD] = "\(Int(ssdAmount)) SSDs selected"
                        }
                    }
                    
                    Picker("Accessories", selection: $configuration[.accessories].boundX) {
                        ForEach(accessoriesOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Operating System", selection: $configuration[.operatingSystem].boundX) {
                        ForEach(operatingSystemOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Warranty", selection: $configuration[.warranty].boundX) {
                        ForEach(warrantyOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                }
            } else {
                MiniSummaryView(configuration: configuration)
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

struct MiniSummaryView: View {
    let configuration: [MiniConfigStep: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(MiniConfigStep.allCases, id: \.self) { step in
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
    var boundX: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
            
        )
    }
}
