//
//  R40-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 15.08.24.
//

import Foundation
import SwiftUI


enum R40ConfigStep: String, CaseIterable, Identifiable {
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

struct R40ConfiSheet: View {
    
    @Binding var currentStep: R40ConfigStep
    @Binding var configuration: [R40ConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    @State private var shelvesAmount: Double = 0
    @State private var shelvesSupported: Double = 0
    
    
    let platformOptions = ["select device", "R40"]
    let controller = ["select configuration", "Singel Head"]
    let ram = ["select RAM", "32GB RAM", "64GB RAM", "156GB RAM", "192GB RAM"]
    
    let driveTypeHDDOptions = ["select disk", "Empty", "4TB SAS HDD", "6TB SAS HDD", "8TB SAS HDD", "12TB SAS HDD", "18TB SAS HDD", "22TB SAS HDD"]
    let driveTypeSSDOptions = ["select disk", "Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    let driveTypeReadIntensiveOptions = ["select disk", "Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    
    let readCacheOptions = ["None"]
    let wirteCacheOptions = ["None"]
    
    let encryptedDriveOptions = ["select configuration", "Yes", "No"]
    
    let expansionShelvesTypeOptions = ["select Shelves", "Empty", "ES12", "ES24", "ES24F", "ES60"]
    let driveExpansionShelvesOptions = ["select Shelves disk", "Empty", "4TB SAS HDD", "6TB SAS HDD", "8TB SAS HDD", "12TB SAS HDD", "14TB SAS HDD", "18TB SAS HDD", "22TB SAS HDD"]
    
    let operatingSystemOptions = ["select system", "Enterprise", "CORE", "SCALE"]
    let adaptor = ["select Adaptor","Empty", "2,5 Adaptor for SSD"]
    
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    let bronzeSupportOptions = ["select Bronze Support", "3 Years", "5 Years"]
    let silverSupportOptions = ["select Silver Support", "3 Years", "5 Years"]
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Form {
                    Picker("Platform", selection: $configuration[.platform].boundR40) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("RAM Configuration", selection: $configuration[.configuration].boundR40) {
                        ForEach(ram, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Controller", selection: $configuration[.controller].boundR40) {
                        ForEach(controller, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Read Cache", selection: $configuration[.readCache].boundR40) {
                        ForEach(readCacheOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Wirte Cache", selection: $configuration[.writeCache].boundR40) {
                        ForEach(wirteCacheOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Read Intensive SSD", selection: $configuration[.driveTypeReadIntensiveSSD].boundR40) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Drive Type SAS SSD", selection: $configuration[.driveAmountSSD].boundR40) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of SAS SSDs")
                        Slider(value: $ssdAmount, in: 0...48, step: 1)
                        Text("\(Int(ssdAmount)) SAS SSDs selected")
                        Button("OK") {
                            configuration[.driveTypeSSD] = "\(Int(ssdAmount)) SAS SSDs selected"
                        }
                    }
                    
                    Picker("Expansion Shelves", selection: $configuration[.accessoriesExpansionShelves].boundR40) {
                        ForEach(expansionShelvesTypeOptions, id: \.self) { option in
                            Text(option).tag(option)
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
                    
                    Picker("Driver Type for Shelves", selection: $configuration[.accessoriesExpansionShelves].boundR40) {
                        ForEach(driveExpansionShelvesOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Expansion Shelves Amount")
                        Slider(value: $shelvesAmount, in: 0...102, step: 1)
                        Text("\(Int(shelvesAmount)) SAS SSDs selected")
                        Button("OK") {
                            configuration[.driveAmountShelveSSD] = "\(Int(shelvesAmount)) SAS SSDs selected"
                        }
                    }
                    
                    Picker("Operating System", selection: $configuration[.operatingSystem].boundR40) {
                        ForEach(operatingSystemOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Warranty", selection: $configuration[.warranty].boundR40) {
                        ForEach(warrantyOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Bronze Support", selection: $configuration[.bronzeSupport].boundR40) {
                        ForEach(bronzeSupportOptions, id: \.self ) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Silver Support", selection: $configuration[.silverSupport].boundR40) {
                        ForEach(silverSupportOptions, id: \.self ) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                }
            } else {
                R40SummaryView(configuration: configuration)
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

struct R40SummaryView: View {
    let configuration: [R40ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(R40ConfigStep.allCases, id: \.self) { step in
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
    var boundR40: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
