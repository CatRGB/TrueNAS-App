//
//  R50-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 15.08.24.
//

import Foundation
import SwiftUI

enum R50ConfigStep: String, CaseIterable, Identifiable {
    case platform = "Platform"
    case controller = "Controller"
    case configuration = "Ram Configuration"
    
    case driveTypeReadCache = "Read Cache"
    case driveTypeWriteCache = "Wirte Cache"
    case driveTypeHDD = "Drive Type SAS HDD"
    case driveTypeSSD = "Drive Type SAS SSD"
    case driveTypeReadIntensiveSSD = "Read Intensive SSD"
    case driveTypeReadIntensiveHDD = "Read Intensive HDD"
    case driveTypeEncryptedDrives = "Encrypted Drive"
    case driveTypeExpansion = "Expansion Drive Type"
    
    case driveAmountHDD = "Drive Amount HDD"
    case driveAmountSSD = "Drive Amount SSD"
    case driveAmountExpansion = "Expansion Drive Amount"
    
    case expansionShelves = "Expansion Shelves"
    case expansionType = "Expansion Type"
    
    case warranty = "Warranty"
    case bronzeSupport = "Bronze Support"
    case silverSupport = "Silver Support"
    
    case summary = "Summary"
    
    
    var id: Self { self }
}

struct R50ConfigSheet: View {
    
    @Binding var currentStep: R50ConfigStep
    @Binding var configuration: [R50ConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    @State private var shelvesAmountHDD: Double = 0
    @State private var shelvesAmountSSD: Double = 0
    @State private var shelvesSupported: Double =  0
    
    
    let platformOptions = ["select device", "R50"]
    let controller = ["select configuration", "Singel Head"]
    let ram = ["select RAM", "64GB RAM", "156GB RAM", "192GB RAM"]
    
    let driveTypeHDDOptions = ["select disk", "Empty", "4TB SAS HDD", "6TB SAS HDD", "8TB SAS HDD", "12TB SAS HDD", "18TB SAS HDD", "22TB SAS HDD"]
    let driveTypeSSDOptions = ["select disk", "Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    let driveTypeReadIntensiveOptions = ["select disk", "Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    
    let readCacheOptions = ["None", "4x 32TB NVMe"]
    let wirteCacheOptions = ["None", "4x 32TB NVMe"]
    
    let encryptedDriveOptions = ["select configuration", "Yes", "No"]
    
    let expansionShelvesTypeOptions = ["select Shelves", "Empty", "ES12", "ES24", "ES24F", "ES60", "ES102"]
    let driveExpansionShelvesHDDOptions = ["select Shelves disk", "Empty", "4TB SAS HDD", "6TB SAS HDD", "8TB SAS HDD", "12TB SAS HDD", "14TB SAS HDD", "18TB SAS HDD", "22TB SAS HDD"]
    let driveExpansionShelvesSSDOptions = ["select Shelves disk", "Empty", "19TB SAS HDD", "38TB SAS HDD", "76TB SAS HDD"]
    let driveExpansionShelvesReadIntensiveSSDOptions = ["select Read Intensive SSD", "Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    let encryptedDriveExpansionShelvesOptions = ["select configuration", "Yes", "No"]
    
    let operatingSystemOptions = ["select system", "Enterprise", "CORE", "SCALE"]
    let adaptor = ["select Adaptor","Empty", "2,5 Adaptor for SSD"]
    
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    let bronzeSupportOptions = ["select Bronze Support", "3 Years", "5 Years"]
    let silverSupportOptions = ["select Silver Support", "3 Years", "5 Years"]
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Form {
                    Picker("Platform", selection: $configuration[.platform].boundR50) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("RAM Configuration", selection: $configuration[.configuration].boundR50) {
                        ForEach(ram, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Controller", selection: $configuration[.controller].boundR50) {
                        ForEach(controller, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Read Cache", selection: $configuration[.driveTypeReadCache].boundR50) {
                        ForEach(readCacheOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Wirte Cache", selection: $configuration[.driveTypeWriteCache].boundR50) {
                        ForEach(wirteCacheOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Drive SAS HDD", selection: $configuration[.driveAmountHDD].boundR50) {
                        ForEach(driveTypeHDDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Drive SAS SSD", selection: $configuration[.driveAmountSSD].boundR50) {
                        ForEach(driveTypeSSDOptions, id:  \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Read Intensive SSD", selection: $configuration[.driveTypeReadIntensiveSSD].boundR50) {
                        ForEach(driveTypeReadIntensiveOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Encrypted Drive", selection: $configuration[.driveTypeEncryptedDrives].boundR50) {
                        ForEach(encryptedDriveOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    VStack {
                        Text("Select number of SAS HDD")
                        Slider(value: $hddAmount, in: 0...48, step: 1)
                            Text("\(Int(hddAmount)) SAS HDDs selected")
                        Button("OK") {
                            configuration[.driveTypeHDD] = "\(Int(hddAmount)) SAS HDDs selected"
                        }
                    }
                    VStack {
                        Text("Select number of SAS SSD")
                        Slider(value: $ssdAmount, in: 0...48, step: 1)
                        Text("\(Int(ssdAmount)) SAS SSDs selected")
                        Button("OK") {
                            configuration[.driveTypeSSD] = "\(Int(ssdAmount)) SAS SSDs selected"
                        }
                    }
                    Picker("Expansion Type", selection: $configuration[.expansionType].boundR50) {
                        ForEach(expansionShelvesTypeOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    VStack {
                        Text("Expansion Shelves")
                        Slider(value: $shelvesSupported, in: 0...2, step: 1)
                        Text("\(Int(shelvesSupported)) Expansion Shelves selected")
                        Button("OK") {
                            configuration[.expansionShelves] = "\(Int(shelvesSupported)) Expansion Shelves selected"
                        }
                    }
                    Picker("Expansion Drve HDD", selection: $configuration[.driveTypeExpansion].boundR50) {
                        ForEach(driveExpansionShelvesHDDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Expansion Drve SSD", selection: $configuration[.driveTypeExpansion].boundR50) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Read Intensive SSD", selection: $configuration[.driveTypeReadIntensiveSSD].boundR50) {
                        ForEach(driveTypeReadIntensiveOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Encrypted Drive", selection: $configuration[.driveTypeEncryptedDrives].boundR50) {
                        ForEach(encryptedDriveOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Expansion Shelves HHDs Amount")
                        Slider(value: $shelvesAmountHDD, in: 0...102, step: 1)
                        Text("\(Int(shelvesAmountHDD)) Expansion Shelves selected")
                        Button("OK") {
                            configuration[.expansionShelves] = "\(Int(shelvesAmountHDD)) Shelves SAS HDDs selected"
                        }
                    }
                    
                    VStack {
                        Text("Expansion Shelves SSDs Amount")
                        Slider(value: $shelvesAmountSSD, in: 0...102, step: 1)
                        Text("\(Int(shelvesAmountSSD)) Expansion Shelves selected")
                        Button("OK") {
                            configuration[.expansionShelves] = "\(Int(shelvesAmountSSD)) Shelves SAS SSDs selected"
                        }
                    }


                    Picker("Warranty & Support", selection: $configuration[.warranty].boundR50) {
                        ForEach(warrantyOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Bronze", selection: $configuration[.bronzeSupport].boundR50) {
                        ForEach(bronzeSupportOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Silver", selection: $configuration[.silverSupport].boundR50) {
                        ForEach(silverSupportOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                }
            } else {
                R50SummaryView(configuration: configuration)
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

struct R50SummaryView: View {
    let configuration: [R50ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(R50ConfigStep.allCases, id: \.self) { step in
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
    var boundR50: Binding<String> {
        Binding<String> (
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
