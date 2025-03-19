//
//  R20-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 15.08.24.
//

import Foundation
import SwiftUI


enum R20ConfigStep: String, CaseIterable, Identifiable {
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

struct R20ConfiSheet: View {
    
    @Binding var currentStep: R20ConfigStep
    @Binding var configuration: [R20ConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    @State private var shelvesAmount: Double = 0
    @State private var shelvesSupported: Double = 0
    
    
    let platformOptions = ["select device", "R20"]
    let controller = ["select configuration", "Singel Head"]
    let ram = ["select RAM", "32GB RAM", "64GB RAM", "156GB RAM", "192GB RAM"]
    
    let driveTypeHDDOptions = ["select disk", "Empty", "4TB SAS HDD", "6TB SAS HDD", "8TB SAS HDD", "12TB SAS HDD", "18TB SAS HDD", "22TB SAS HDD"]
    let driveTypeSSDOptions = ["select disk", "Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    let driveTypeReadIntensiveOptions = ["select disk", "Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    
    let readCacheOptions = ["None", "2x 16TB NVMe"]
    let wirteCacheOptions = ["None", "2x 16TB NVMe"]
    
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
                    Picker("Platform", selection: $configuration[.platform].boundR20) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("RAM Configuration", selection: $configuration[.configuration].boundR20) {
                        ForEach(ram, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Controller", selection: $configuration[.controller].boundR20) {
                        ForEach(controller, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Read Cache", selection: $configuration[.readCache].boundR20) {
                        ForEach(readCacheOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Wirte Cache", selection: $configuration[.writeCache].boundR20) {
                        ForEach(wirteCacheOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Read Intensive SSD", selection: $configuration[.driveTypeReadIntensiveSSD].boundR20) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Encrypted Drive", selection: $configuration[.encryptedDrive].boundR20) {
                        ForEach(encryptedDriveOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Drive Type SAS HDD", selection: $configuration[.driveTypeHDD].boundR20) {
                        ForEach(driveTypeHDDOptions, id: \.self) { option in
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
                    
                    Picker("Drive Type SAS SSD", selection: $configuration[.driveAmountSSD].boundR20) {
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
                    
                    Picker("Expansion Shelves", selection: $configuration[.accessoriesExpansionShelves].boundR20) {
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
                    
                    Picker("Driver Type for Shelves", selection: $configuration[.accessoriesExpansionShelves].boundR20) {
                        ForEach(driveExpansionShelvesOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Operating System", selection: $configuration[.operatingSystem].boundR20) {
                        ForEach(operatingSystemOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Warranty", selection: $configuration[.warranty].boundR20) {
                        ForEach(warrantyOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Bronze Support", selection: $configuration[.bronzeSupport].boundR10) {
                        ForEach(bronzeSupportOptions, id: \.self ) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Silver Support", selection: $configuration[.silverSupport].boundR10) {
                        ForEach(silverSupportOptions, id: \.self ) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                }
            } else {
                R20SummaryView(configuration: configuration)
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

struct R20SummaryView: View {
    let configuration: [R20ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(R20ConfigStep.allCases, id: \.self) { step in
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
    var boundR20: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
