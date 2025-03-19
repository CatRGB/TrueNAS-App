//
//  R30-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 15.08.24.
//

import Foundation
import SwiftUI


enum R30ConfigStep: String, CaseIterable, Identifiable {
    case platform = "Platform"
    case controller = "Controller"
    case configuration = "RAM Configuration"
    
    case driveTypeReadIntensiveSSD = "Read Intensive SSD"
    case driveAmountShelveSSD = "Expansion Shelves SAS SSD"
    case driveTypeHDD = "Drive Type SAS HDD"
    case driveTypeSSD = "Drive Type SAS SSD"
    case driveAmountSSD = "Drive Amount SAS SSD"
    case encryptedDrive = "Encrypted Drive"
    
    case readCache = "Read Cache"
    case writeCache = "Write Cache"
    
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

struct R30ConfiSheet: View {
    
    @Binding var currentStep: R30ConfigStep
    @Binding var configuration: [R30ConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    @State private var shelvesAmount: Double = 0
    @State private var shelvesSupported: Double = 0
    
    
    let platformOptions = ["select device", "R30"]
    let controller = ["select configuration", "Singel Head"]
    let ram = ["select RAM", "32GB RAM", "64GB RAM", "128 GB RAM", "256GB RAM", "192GB RAM", "1024GB RAM"]
    
    let driveTypeSSDOptions = ["select disk", "Empty", "15TB NVMe SSD", "76TB NVMe SSD"]
    let driveTypeReadIntensiveOptions = ["select disk", "Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    
    let operatingSystemOptions = ["select system", "Enterprise", "CORE", "SCALE"]
    
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    let bronzeSupportOptions = ["select Bronze Support", "3 Years", "5 Years"]
    let silverSupportOptions = ["select Silver Support", "3 Years", "5 Years"]
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Form {
                    Picker("Platform", selection: $configuration[.platform].boundR30) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("RAM Configuration", selection: $configuration[.configuration].boundR30) {
                        ForEach(ram, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Controller", selection: $configuration[.controller].boundR30) {
                        ForEach(controller, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of SAS HDDs")
                        Slider(value: $hddAmount, in: 0...12, step: 1)
                        Text("\(Int(hddAmount)) SAS HDDs selected")
                        Button("OK") {
                            configuration[.driveTypeHDD] = "\(Int(hddAmount)) SAS HDDs selected"
                        }
                    }
                    
                    Picker("Drive Type SAS SSD", selection: $configuration[.driveAmountSSD].boundR30) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of SAS SSDs")
                        Slider(value: $ssdAmount, in: 0...12, step: 1)
                        Text("\(Int(ssdAmount)) SAS SSDs selected")
                        Button("OK") {
                            configuration[.driveTypeSSD] = "\(Int(ssdAmount)) SAS SSDs selected"
                        }
                    }
                    
                    VStack {
                        Text("Expansion Shelves Supported")
                        Slider(value: $shelvesSupported, in: 0...2, step: 1)
                        Text("\(Int(shelvesSupported)) Expansion Shelves Supported selected")
                        Button("OK") {
                            configuration[.expansionShelvesSupported] = "\(Int(shelvesSupported)) Expansion Shelves Supported selected"
                        }
                    }
                    
                    Picker("Operating System", selection: $configuration[.operatingSystem].boundR30) {
                        ForEach(operatingSystemOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Warranty", selection: $configuration[.warranty].boundR30) {
                        ForEach(warrantyOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Bronze Support", selection: $configuration[.bronzeSupport].boundR30) {
                        ForEach(bronzeSupportOptions, id: \.self ) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Silver Support", selection: $configuration[.silverSupport].boundR30) {
                        ForEach(silverSupportOptions, id: \.self ) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                }
            } else {
                R30SummaryView(configuration: configuration)
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

struct R30SummaryView: View {
    let configuration: [R30ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(R30ConfigStep.allCases, id: \.self) { step in
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
    var boundR30: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}


