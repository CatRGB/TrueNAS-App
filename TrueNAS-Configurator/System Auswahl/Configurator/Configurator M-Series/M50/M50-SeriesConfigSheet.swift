//
//  M30-SeriesConfigSheet.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 03.01.25.
//

import SwiftUI
import Foundation

enum M50ConfigStep: String, CaseIterable, Identifiable {
    
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
    
    case warranty = "Warranty"
    case bronzeSupport = "Bronze Support"
    case silverSupport = "Silver Support"
    
    case summary = "Summary"
    
    var id: Self { self }
}

struct M50ConfigSheet: View {
    
    @Binding var currentStep: M50ConfigStep
    @Binding var configuration: [M50ConfigStep: String]
    @Binding var showSheet: Bool
    
    @State private var hddAmount: Double = 0
    @State private var ssdAmount: Double = 0
    
    @State private var readIntensity: Double = 0
    @State private var writeIntensity: Double = 0
    
    let platformOption = ["M30"]
    let controller = ["select configuration", "Single Head", "Multi Dual"]
    let ram = ["select configuration", "64GB RAM"]
    
    let driveTypeHDDOption = ["select disk", "4TB SAS 72K HDD", "6TB SAS 72K HDD", "8TB SAS 72K HDD", "12TB SAS 72K HDD", "18TB SAS 72K HDD", "22TB SAS 72K HDD"]
    let driveTypeSSDOption = ["select disk", "1.9TB SAS SSD", "3.8TB SAS SSD", "7.6TB SAS SSD"]
    let driveTypeReadOption = ["select disk", "1.9TB SAS SSD-RI", "3.8TB SAS SSD-RI", "7.6TB SAS SSDR-RI"]
    let encryptionOption = ["select disk", "YES", "NO"]
    
    let operatingSystemOptions = ["select system", "Enterprise"]
    
    let warrantyOptions = ["select warrant", "(default) 1 Year", "3 Years"]
    let bronzeSupportOptions = ["select Bronze Support", "3 Years", "5 Years"]
    let silverSupportOptions = ["select Silver Support", "3 Years", "5 Years"]
    
    
    
    var body: some View {
        VStack {
            if (currentStep != .summary) {
                
            } else {
                M50SummaryView(configuration: configuration)
            }
        }
    }
}

struct M50SummaryView: View {
    let configuration: [M50ConfigStep: String]
    
    var body: some View {
        VStack {
            Text("M50 Summary")
                .font(.title)
                .padding()
            
            ForEach(M50ConfigStep.allCases, id: \.self) { step in
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
    var boundM50: Binding<String> {
        Binding<String> (
            get: { self.wrappedValue ?? "Empty" },
            set: { newValue in self.wrappedValue = newValue }
        )
    }
}
