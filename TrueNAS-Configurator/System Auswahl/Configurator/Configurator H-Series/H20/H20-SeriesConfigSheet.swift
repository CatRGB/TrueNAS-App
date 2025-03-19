//
//  H20-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 14.08.24.
//

import Foundation
import SwiftUI


enum H20ConfigStep: String, CaseIterable, Identifiable {
    case platform = "Platform"
    case controller = "Controller"
    case configuration = "RAM Configuration"
    case driveTypeHDD = "Drive Type SAS HDD"
    case driveAmountHDD = "Drive Amount SAS HDD"
    case driveAmountShelveHDD = "Expansion Shelves SAS HDD"
    case driveAmountShelveSSD = "Expansion Shelves SAS SSD"
    case driveTypeSSD = "Drive Type SAS SSD"
    case driveAmountSSD = "Drive Amount SAS SSD"
    case accessoriesExpansionShelves = "Expansion Shelves"
    case accessoriesAdaptor = "Adaptor"
    case operatingSystem = "Operating System"
    case warranty = "Warranty"
    case summary = "Summary"
    
    var id: Self { self }
}

struct H20ConfiSheet: View {
    
    @Binding var currentStep: H20ConfigStep
    @Binding var configuration: [H20ConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    @State private var shelvesAmount: Double = 0
    
    
    let platformOptions = ["select device", "H20"]
    let ram = ["select RAM", "128GB RAM", "256 GB RAM"]
    let controller = ["select configuration", "Singel Head", "Dual Head (HA)"]
    let driveTypeHDDOptions = ["select disk", "Empty", "4TB SAS HDD", "6TB SAS HDD", "8TB SAS HDD", "12TB SAS HDD", "14TB SAS HDD", "18TB SAS HDD", "22TB SAS HDD"]
    let driveTypeSSDOptions = ["select disk", "Empty", "15TB SAS SSD", "19TB SAS SSD", "38TB SAS SSD", "76TB SAS SSD"]
    let operatingSystemOptions = ["select system", "Enterprise", "CORE", "SCALE"]
    let expansionShelvesType = ["select Shelves", "Empty", "ES24", "ES24F", "ES60"]
    let driveExpansionShelvesOptions = ["select Shelves disk", "Empty", "4TB SAS HDD", "6TB SAS HDD", "8TB SAS HDD", "12TB SAS HDD", "14TB SAS HDD", "18TB SAS HDD", "22TB SAS HDD"]
    let adaptor = ["select Adaptor","Empty", "2,5 Adaptor for SSD"]
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Form {
                    Picker("Platform", selection: $configuration[.platform].boundH20) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("RAM Configuration", selection: $configuration[.configuration].boundH10) {
                        ForEach(ram, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Controller", selection: $configuration[.controller].boundH20) {
                        ForEach(controller, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Drive Type SAS HDDs", selection: $configuration[.driveAmountHDD].boundH20) {
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
                    
                    Picker("Drive Type SAS SSD", selection: $configuration[.driveAmountSSD].boundH20) {
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
                    
                    Picker("Expansion Shelves", selection: $configuration[.accessoriesExpansionShelves].boundH20) {
                        ForEach(expansionShelvesType, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Driver Type for Shelves", selection: $configuration[.accessoriesExpansionShelves].boundH20) {
                        ForEach(driveExpansionShelvesOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of SAS HDDs for Shelves")
                        Slider(value: $shelvesAmount, in: 0...60, step: 1)
                        Text("\(Int(shelvesAmount)) SAS HDDs selected")
                        Button("OK") {
                            configuration[.driveAmountShelveHDD] = "\(Int(shelvesAmount)) SAS HDD selected"
                        }
                        
                    }
                    
                    Picker("Adaptor", selection: $configuration[.accessoriesAdaptor].boundH20) {
                        ForEach(adaptor, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Operating System", selection: $configuration[.operatingSystem].boundH20) {
                        ForEach(operatingSystemOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Warranty", selection: $configuration[.warranty].boundH20) {
                        ForEach(warrantyOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                }
            } else {
                h20SummaryView(configuration: configuration)
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

struct h20SummaryView: View {
    let configuration: [H20ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(H20ConfigStep.allCases, id: \.self) { step in
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
    var boundH20: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
