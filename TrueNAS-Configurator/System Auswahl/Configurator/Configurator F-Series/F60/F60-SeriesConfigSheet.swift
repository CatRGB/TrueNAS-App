//
//  F60-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 12.09.24.
//

import Foundation
import SwiftUI


enum F60ConfigStep: String, CaseIterable, Identifiable {
    case platform = "Platform"
    case controller = "Controller"
    case configuration = "RAM Configuration"
    
    case driveAmountShelveSSD = "Shelves NVMe SSD"
    case driveTypeSSD = "Drive Type SAS SSD"
    case driveAmountSSD = "Drive Amount SAS SSD"
    
    case accessoriesExpansionShelves = "Expansion Shelves"
    case expansionShelvesSupported = "Expansion Shelves Supported"
    
    case accessoriesAdaptor = "Adaptor"
    case operatingSystem = "Operating System"
    
    case warranty = "Warranty"
    case bronzeSupport = "Bronze Support"
    case silverSupport = "Silver Support"
    
    case summary = "Summary"
    
    var id: Self { self }
}

struct F60ConfigSheet: View {
    
    @Binding var currentStep: F60ConfigStep
    @Binding var configuration: [F60ConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    @State private var shelvesAmount: Double = 0
    @State private var shelvesSupported: Double = 0
    
    
    let platformOptions = ["select device", "F60"]
    let controller = ["select configuration", "Singel Head"]
    let ram = ["select RAM", "32GB RAM", "64GB RAM", "156GB RAM", "192GB RAM"]
    
    let driveTypeSSDOptions = ["select disk", "Empty", "7.6TB NVMe SSD", "15.36TB NVMe SSD", "30.72TB NVMe SSD"]
    
    let expansionShelvesTypeOptions = ["select Shelves", "Empty", "ES24F"]
    let driveExpansionShelvesOptions = ["select disk", "Empty", "7.6TB NVMe SSD", "15.36TB NVMe SSD", "30.72TB NVMe SSD"]
    
    let operatingSystemOptions = ["select system", "Enterprise"]
    
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    let bronzeSupportOptions = ["select Bronze Support", "3 Years", "5 Years"]
    let silverSupportOptions = ["select Silver Support", "3 Years", "5 Years"]
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Form {
                    Picker("Platform", selection: $configuration[.platform].boundF60) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("RAM Configuration", selection: $configuration[.configuration].boundF60) {
                        ForEach(ram, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Controller", selection: $configuration[.controller].boundF60) {
                        ForEach(controller, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Drive Type NVMe SSD", selection: $configuration[.driveAmountSSD].boundF60) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of NVMe SSDs")
                        Slider(value: $ssdAmount, in: 0...24, step: 1)
                        Text("\(Int(ssdAmount)) NVMe SSDs selected")
                        Button("OK") {
                            configuration[.driveTypeSSD] = "\(Int(ssdAmount)) NVMe SSDs selected"
                        }
                    }
                    
                    Picker("Expansion Shelves", selection: $configuration[.accessoriesExpansionShelves].boundF60) {
                        ForEach(expansionShelvesTypeOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Expansion Shelves Supported")
                        Slider(value: $shelvesSupported, in: 0...4, step: 1)
                        Text("\(Int(shelvesSupported)) Expansion Shelves Supported selected")
                        Button("OK") {
                            configuration[.expansionShelvesSupported] = "\(Int(shelvesSupported)) Expansion Shelves Supported selected"
                        }
                    }
                    
                    Picker("Driver Type for Shelves", selection: $configuration[.accessoriesExpansionShelves].boundF60) {
                        ForEach(driveExpansionShelvesOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Expansion Shelves Amount")
                        Slider(value: $shelvesAmount, in: 0...24, step: 1)
                        Text("\(Int(shelvesAmount)) NVMe SSDs selected")
                        Button("OK") {
                            configuration[.driveAmountShelveSSD] = "\(Int(shelvesAmount)) NVMe SSDs selected"
                        }
                    }
                    
                    Picker("Operating System", selection: $configuration[.operatingSystem].boundF60) {
                        ForEach(operatingSystemOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Warranty", selection: $configuration[.warranty].boundF60) {
                        ForEach(warrantyOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Bronze Support", selection: $configuration[.bronzeSupport].boundF60) {
                        ForEach(bronzeSupportOptions, id: \.self ) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Silver Support", selection: $configuration[.silverSupport].boundF60) {
                        ForEach(silverSupportOptions, id: \.self ) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                }
            } else {
                F60SummaryView(configuration: configuration)
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

struct F60SummaryView: View {
    let configuration: [F60ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(F60ConfigStep.allCases, id: \.self) { step in
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
    var boundF60: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
