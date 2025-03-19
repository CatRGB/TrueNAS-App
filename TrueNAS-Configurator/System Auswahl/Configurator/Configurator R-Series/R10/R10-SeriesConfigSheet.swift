//
//  R10-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 15.08.24.
//

import Foundation
import SwiftUI


enum R10ConfigStep: String, CaseIterable, Identifiable {
    case platform = "Platform"
    case controller = "Controller"
    case configuration = "RAM Configuration"
    
    case driveTypeReadIntensiveSSD = "Read Intensive SSD"
    case driveAmountShelveSSD = "Expansion Shelves SAS SSD"
    case driveTypeHDD = "Drive Type SAS HDD"
    case driveTypeSSD = "Drive Type SAS SSD"
    case driveAmountSSD = "Drive Amount SAS SSD"
    case encryptedDrive = "Encrypted Drive"
    
    case accessoriesExpansionShelves = "Expansion Shelves"
    case expansionShelvesSupported = "Expansion Shelves Supported"
    
    case accessoriesAdaptor = "Adaptor"
    case operatingSystem = "Operating System"
    case warranty = "Warranty"
    case summary = "Summary"
    
    case bronzeSupport = "Bronze Support"
    case silverSupport = "Silver Support"
    
    var id: Self { self }
}

struct R10ConfiSheet: View {
    
    @Binding var currentStep: R10ConfigStep
    @Binding var configuration: [R10ConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    @State private var shelvesAmount: Double = 0
    
    
    let platformOptions = ["select device", "R10"]
    let ram = ["select RAM", "32GB RAM", "96GB RAM"]
    let controller = ["select configuration", "Singel Head"]
    let driveTypeReadIntensiveOptions = ["select disk", "Empty", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    let encryptedDrive = ["select configuration", "Yes", "No"]
    let driveTypeSSDOptions = ["select disk", "Empty", "15TB SAS SSD", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    let operatingSystemOptions = ["select system", "Enterprise"]
    let adaptor = ["select Adaptor","Empty", "2,5 Adaptor for SSD"]
    
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    let bronzeSupportOptions = ["select Bronze Support", "3 Years", "5 Years"]
    let silverSupportOptions = ["select Silver Support", "3 Years", "5 Years"]
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Form {
                    Picker("Platform", selection: $configuration[.platform].boundR10) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Controller", selection: $configuration[.controller].boundR10) {
                        ForEach(controller, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("RAM Configuration", selection: $configuration[.configuration].boundR10) {
                        ForEach(ram, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Drive Type SAS SSD", selection: $configuration[.driveAmountSSD].boundR10) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Read Intensive SSD", selection: $configuration[.driveTypeReadIntensiveSSD].boundR10) {
                        ForEach(driveTypeSSDOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Encrypted Drive", selection: $configuration[.encryptedDrive].boundR10) {
                        ForEach(encryptedDrive, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of SAS SSDs")
                        Slider(value: $ssdAmount, in: 0...16, step: 1)
                        Text("\(Int(ssdAmount)) SAS SSDs selected")
                        Button("OK") {
                            configuration[.driveTypeSSD] = "\(Int(ssdAmount)) SAS SSDs selected"
                        }
                    }
                    
                    Picker("Operating System", selection: $configuration[.operatingSystem].boundR10) {
                        ForEach(operatingSystemOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Warranty", selection: $configuration[.warranty].boundR10) {
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
                r10SummaryView(configuration: configuration)
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

struct r10SummaryView: View {
    let configuration: [R10ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(R10ConfigStep.allCases, id: \.self) { step in
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
    var boundR10: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
