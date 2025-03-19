//
//  F100-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 03.01.25.
//

import SwiftUI
import Foundation


enum F100ConfigStap: String, CaseIterable, Identifiable {
    
    case platform = "Platform"
    case controller = "Controller"
    case configuration = "RAM Configuration"
    
    case driveAmountShelveSSD = "Expansion Shelves NVMe SSD"
    case driveTypeSSD = "Drive Type NVMe Gen4 SSD"
    case driveAmountSSD = "Drive Amount SAS SSD"
    
    case accessoriesExpansionShelves = "Expansion Shelves"
    case expansionShelvesSupported = "Expansion Shelves Supported"
    
    case operatingSystem = "Operating System"
    
    case warranty = "Warranty"
    case bronzeSupport = "Bronze Support"
    case silverSupport = "Silver Support"
    
    case summary = "Summary"
    
    var id: Self { self }
}

struct F100ConfiSheet: View {
    
    @Binding var currentStep: F100ConfigStap
    @Binding var configuration: [F100ConfigStap: String]
    @Binding var showingSheet: Bool
    
    @State private var ssdAmount: Double = 0
    
    @State private var shelvesAmount: Double = 0
    @State private var shelvesSupported: Double = 0
    
    
    let platformOptions = ["select device", "F100"]
    let controller = ["select configuration", "Doual Head"]
    let ram = ["select RAM", "512GB RAM"]
    
    let driveTypeSSDOptions = ["select disk", "Empty", "7.6TB NVMe Gen4 SSD", "15.36TB NVMe Gen4 SSD", "30.72TB NVMe Gen4 SSD"]
    
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
                    Picker("Platform", selection: $configuration[.platform].boundF100) {
                        ForEach(platformOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("RAM Configuration", selection: $configuration[.configuration].boundF100) {
                        ForEach(ram, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Controller", selection: $configuration[.controller].boundF100) {
                        ForEach(controller, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Drive Type NVMe SSD", selection: $configuration[.driveAmountSSD].boundF100) {
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
                        Text("\(Int(shelvesSupported)) Expansion Shelves selected")
                        Button("OK") {
                            configuration[.expansionShelvesSupported] = "\(Int(shelvesSupported)) Expansion Shelves selected"
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
                    
                    VStack {
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
                }
            } else {
                F100SummaryView(configuration: configuration)
            }
            Spacer()
            
            HStack {
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
}

struct F100SummaryView: View {
    let configuration: [F100ConfigStap: String]
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
                .padding()
            
            ForEach(F100ConfigStap.allCases, id: \.self) { step in
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
    var boundF100: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
