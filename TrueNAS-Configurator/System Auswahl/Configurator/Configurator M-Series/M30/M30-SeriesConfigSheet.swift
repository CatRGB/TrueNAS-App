//
//  M30-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 03.01.25.
//

import SwiftUI
import Foundation

enum M30ConfigStep: String, CaseIterable {
    
    case platform = "Platform"
    case controller = "Controller"
    case configuration = "RAM Configuration"
    
    case readCache = "Read Cache"
    case wirteCache = "Write Cache"
    
    case driveType = "Drive Type"
    case driveAmountHDD = "Drive Amount HDD"
    case driveAmountSSD = "Drive Amount SSD"
    case driveTypeHDD = "SAS HDD"
    case driveTypeSSD = "SAS SSD"
    case readIntensity = "Read Intensity"
    case encryptedDrive = "Encrypted Drive"
    
    case warranty = "Warranty"
    case bronzeSupport = "Bronze Support"
    case silverSupport = "Silver Support"
    
    case summary = "Summary"
    
    var id: Self { self }
}

struct M30ConfigSheet: View {
    
    @Binding var currentStep: M30ConfigStep
    @Binding var configuration: [M30ConfigStep: String]
    @Binding var showingSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    @State private var readIntensity: Double = 0
    @State private var writeIntensity: Double = 0
    
    let platformOption = ["M30"]
    let controller = ["select configuration", "Single Head", "Multi Dual"]
    let ram = ["select configuration", "64GB RAM"]
    
    let readCacheOption = ["select cache", "None", "800GB SAS SSD"]
    let wireCacheOption = ["select cache", "None", "16GB SAS SSD"]
    
    let driveTypeHDDOption = ["select disk", "Empty", "4TB SAS 72K HDD", "6TB SAS 72K HDD", "8TB SAS 72K HDD", "12TB SAS 72K HDD", "18TB SAS 72K HDD", "22TB SAS 72K HDD"]
    let driveTypeSSDOption = ["select disk", "Empty", "1.9TB SAS SSD", "3.8TB SAS SSD", "7.6TB SAS SSD"]
    let driveTypeReadOption = ["select disk", "Empty", "1.9TB SAS SSD-RI", "3.8TB SAS SSD-RI", "7.6TB SAS SSDR-RI"]
    let encryptionOption = ["select disk", "YES", "NO"]
    
    let operatingSystemOptions = ["select system", "Enterprise"]
    
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    let bronzeSupportOptions = ["select Bronze Support", "3 Years", "5 Years"]
    let silverSupportOptions = ["select Silver Support", "3 Years", "5 Years"]
    
    
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Form {
                    Picker("Platform", selection: $configuration[.platform].boundM30) {
                        ForEach(platformOption, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Controller", selection: $configuration[.controller].boundM30) {
                        ForEach(controller, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Read Cache", selection: $configuration[.readCache].boundM30) {
                        ForEach(readCacheOption, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Write Cache", selection: $configuration[.wirteCache].boundM30) {
                        ForEach(wireCacheOption, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("SAS HDD", selection: $configuration[.driveAmountHDD].boundM30) {
                        ForEach(driveTypeHDDOption, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("SAS SSD", selection: $configuration[.driveAmountSSD].boundM30) {
                        ForEach(driveTypeSSDOption, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                        
                    Picker("Read Intensive SSD", selection: $configuration[.readIntensity].boundM30) {
                        ForEach(driveTypeReadOption, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    Picker("Encrypted Drive", selection: $configuration[.encryptedDrive].boundM30) {
                        ForEach(encryptionOption, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Select number of HDDs")
                        Slider(value: $hddAmount, in: 0...24)
                        Text("\(Int(hddAmount)) SAS HDD selected")
                        Button("OK") {
                            configuration[.driveTypeHDD] = "\(Int(hddAmount)) SAS HDD selected"
                        }
                    }
                    
                    VStack {
                        Text("Select number of SSDs")
                        Slider(value: $ssdAmount, in: 0...24)
                        Text("\(Int(ssdAmount)) SAS SSD selected")
                        Button("OK") {
                            configuration[.driveTypeSSD] = "\(Int(ssdAmount)) SAS SSD selected"
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
                M30SummaryView(configuration: configuration)
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

struct M30SummaryView: View {
    let configuration: [M30ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("M30 Summary")
                .font(.title)
                .padding()
            
            ForEach(M30ConfigStep.allCases, id: \.self) { step in
                if let value = configuration[step] {
                    Text("\(step): \(value)")
                }
            }
            
            Button("Request Quote") {
                // Action für E-Mail
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
    var boundM30: Binding<String> {
        Binding<String> (
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
