//
//  M30-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 03.01.25.
//

import SwiftUI
import Foundation

enum M40ConfigStep: String, CaseIterable, Identifiable {
    
    case platform = "Platform"
    case controller = "Controller"
    case configuration = "RAM Configuration"
    
    case readCache = "Read Cache"
    case wirteCache = "Write Cache"
    
    case driveType = "Drive Type"
    case driveAmount = "Drive Amount"
    case driveTypeHDD = "SAS HDD"
    case driveTypeSSD = "SAS SSD"
    case readIntensity = "Read Intensity"
    case encryptedDrive = "Encrypted Drive"
    
    case exppansionShelves = "Expansion Shelves"
    case driveAmountShelveHDD = "Shelves SAS HDD"
    case driveAmountShelveSSD = "Shelves SAS SSD"
    
    case warranty = "Warranty"
    case bronzeSupport = "Bronze Support"
    case silverSupport = "Silver Support"
    
    case summary = "Summary"
    
    var id: Self { self }
}

struct M40ConfigSheet: View {
    
    @Binding var currentStep: M30ConfigStep
    @Binding var configuration: [M40ConfigStep: String]
    @Binding var showSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    @State private var readIntensity: Double = 0
    @State private var writeIntensity: Double = 0
    
    let platformOption = ["M40"]
    let controller = ["select configuration", "Single Head", "Multi Dual"]
    
    let driveTypeHDDOption = ["select disk", "4TB SAS 72K HDD", "6TB SAS 72K HDD", "8TB SAS 72K HDD", "12TB SAS 72K HDD", "18TB SAS 72K HDD", "22TB SAS 72K HDD"]
    let driveTypeSSDOption = ["select disk", "1.9TB SAS SSD", "3.8TB SAS SSD", "7.6TB SAS SSD"]
    let driveTypeReadOption = ["select disk", "1.9TB SAS SSD-RI", "3.8TB SAS SSD-RI", "7.6TB SAS SSDR-RI"]
    let driveTypeWirteOption = ["select disk", "None", "16GB TureCache NVDMM"]
    let encryptionOption = ["select disk", "Yes", "No"]
    
    let expansionShelvesTypeOptions = ["select Shelves", "Empty", "ES12", "ES24", "ES24S", "ES60", "ES102"]
    let driveExpansionShelvesHDDOptions = ["select disk", "Empty", "4TB SAS 72K HDD", "6TB SAS 72K HDD", "8TB SAS 72K HDD", "12TB SAS 72K HDD", "18TB SAS 72K HDD", "22TB SAS 72K HDD"]
    let driveExpansionShelvesSSDOptions = ["select disk", "Empty", "1.9TB SAS SSD", "3.8TB SAS SSD", "7.6TB SAS SSD"]
    let driveExpansionShelvesReadOption = ["select disk", "Empty", "1.9TB SAS SSD-RI", "3.8TB SAS SSD-RI", "7.6TB SAS SSDR-RI"]
    let driveExpansionShelveEncryptionOption = ["select disk", "Empty", "Yes", "No"]
    
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    let bronzeSupportOptions = ["select Bronze Support", "3 Years", "5 Years"]
    let silverSupportOptions = ["select Silver Support", "3 Years", "5 Years"]
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                Picker("Platform", selection: $configuration[.platform].boundM40) {
                    ForEach(platformOption, id: \.self ) { option in
                        Text(option).tag(option)
                    }
                }
                Picker("Controller", selection: $configuration[.controller].boundM40) {
                    ForEach(controller, id: \.self ) { option in
                        Text(option).tag(option)
                    }
                }
                Picker("Read Cache", selection: $configuration[.readCache].boundM40) {
                    ForEach(driveTypeReadOption, id: \.self ) { option in
                        Text(option).tag(option)
                    }
                }
                Picker("Wirte Cache", selection: $configuration[.wirteCache].boundM40) {
                    ForEach(driveTypeWirteOption, id: \.self ) { option in
                        Text(option).tag(option)
                    }
                }
                Picker("Drive Type HDD", selection: $configuration[.driveTypeHDD].boundM40) {
                    ForEach(driveTypeHDDOption, id: \.self ) { option in
                        Text(option).tag(option)
                    }
                }
                Picker("Drive Type SSD", selection: $configuration[.])
            } else {
                M40SummaryView(configuration: configuration)
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
                
                Button("Cancle") {
                    showSheet = false
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

struct M40SummaryView: View {
    let configuration: [M40ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("M40 Summary")
                .font(.title)
                .padding()
            
            ForEach(M40ConfigStep.allCases, id: \.self) { step in
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
    var boundM40: Binding<String> {
        Binding<String> (
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
