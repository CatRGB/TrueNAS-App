//
//  System_Auswahl.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 10.06.24.
//

import SwiftUI

struct System_Auswahl: View {
    @State private var selectedSystem: TrueNASSysteme? = nil
    @State private var isMiniXNavigationActive: Bool = false
    @State private var isMiniRNavigationActive: Bool = false
    @State private var isH10NavigationActive: Bool = false
    @State private var isH20NavigationActive: Bool = false
    @State private var isR10NavigationActive: Bool = false
    @State private var isR20NavigationActive: Bool = false
    @State private var isR30NavigationActive: Bool = false
    @State private var isR40NavigationActive: Bool = false
    @State private var isR50NavigationActive: Bool = false
    @State private var isF60NavigationActive: Bool = false
    @State private var isF1000NavigationActive: Bool = false
    @State private var isM30NavigationActive: Bool = false
    @State private var filterSeries: SystemSeries = .all
    
    var filteredSystems: [TrueNASSysteme] {
        if filterSeries == .all {
            return TrueNASSysteme.allCases
        } else {
            return TrueNASSysteme.allCases.filter { $0.series == filterSeries }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(filteredSystems) { system in
                            Button {
                                selectedSystem = system
                            } label: {
                                Image(system.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 310, height: 210)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 1)

                if let system = selectedSystem {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Selected System: \(system.rawValue)")
                            .font(.title)
                            .padding(.top)
                        Text("OS: \(system.os)")
                    }
                    .padding()
                } else {
                    Text("Please select a system")
                        .font(.title)
                        .padding(.top)
                }

                Spacer()

                if let system = selectedSystem {
                    Button {
                        if system == .miniX {
                            isMiniXNavigationActive = true
                        }
                        if system == .miniR {
                            isMiniRNavigationActive = true
                        }
                        if system == .h10 {
                            isH10NavigationActive = true
                        }
                        if system == .h20 {
                            isH20NavigationActive = true
                        }
                        if system == .r10 {
                            isR10NavigationActive = true
                        }
                        if system == .r20 {
                            isR20NavigationActive = true
                        }
                        if system == .r30 {
                            isR30NavigationActive = true
                        }
                        if system == .r40 {
                            isR40NavigationActive = true
                        }
                        if system == .r50 {
                            isR50NavigationActive = true
                        }
                        if system == .f60 {
                            isF60NavigationActive = true
                        }
                        if system == .f100 {
                            isF1000NavigationActive = true
                        }
                        if system == .m30 {
                            isM30NavigationActive = true
                        }
                    } label: {
                        Text("Select TrueNAS")
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                Menu {
                    Section("All-System") {
                        Button("All-Series") {
                            filterSeries = .all
                        }
                    }
                    Section("Mini-Series") {
                        Button("Mini-Series") {
                            filterSeries = .MiniSeriesFilter
                        }
                        Divider()
                    }
                    Section("Enterprise-Systeme") {
                        Button("H-Series") {
                            filterSeries = .HSeriesFilter
                        }
                        Button("R-Series") {
                            filterSeries = .RSeriesFilter
                        }
                        Button("F-Series") {
                            filterSeries = .FSeriesFilter
                        }
                        Button("M-Series") {
                            filterSeries = .MSeriesFilter
                        }
                    }
                    
                } label: {
                    Label("Filter: \(filterSeries.FilterButton)", systemImage: "ellipsis.circle")
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(16)
                        .shadow(radius: 10)
                        .transition(.move(edge: .bottom))
                }
                
                if selectedSystem == .miniX {
                    NavigationLink(
                        destination: MiniSeries(selectedSystem: selectedSystem ?? .miniX),
                        isActive: $isMiniXNavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .miniR {
                    NavigationLink(
                        destination: MiniRSeries(selectedSystem: selectedSystem ?? .miniR),
                        isActive: $isMiniRNavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .h10 {
                    NavigationLink(
                        destination: H10_Series(selectedSystem: selectedSystem ?? .h10),
                        isActive: $isH10NavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .h20 {
                    NavigationLink(
                        destination: H20_Series(selectedSystem: selectedSystem ?? .h20),
                        isActive: $isH20NavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .r10 {
                    NavigationLink(
                        destination: R10_Series(selectedSystem: selectedSystem ?? .r10),
                        isActive: $isR10NavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .r20 {
                    NavigationLink(
                        destination: R20_Series(selectedSystem: selectedSystem ?? .r20),
                        isActive: $isR20NavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .r30 {
                    NavigationLink(
                        destination: R30_Series(selectedSystem: selectedSystem ?? .r30),
                        isActive: $isR30NavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .r40 {
                    NavigationLink(
                        destination: R40_Series(selectedSystem: selectedSystem ?? .r40),
                        isActive: $isR40NavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .r50 {
                    NavigationLink(
                        destination: R50_Series(selectedSystem: selectedSystem ?? .r50),
                        isActive: $isR50NavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .f60 {
                    NavigationLink(
                        destination: F60_Series(selectedSystem: selectedSystem ?? .f60),
                        isActive: $isF60NavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .f100 {
                    NavigationLink(
                        destination: F100_Series(selectedSystem: selectedSystem ?? .f100),
                        isActive: $isF1000NavigationActive
                    ) {
                        EmptyView()
                    }
                }; if selectedSystem == .m30 {
                    NavigationLink(
                        destination: M30_Series(selectedSystem: selectedSystem ?? .m30),
                        isActive: $isM30NavigationActive
                    ) {
                        EmptyView()
                    }
                }
                
            }
            .padding()
            .navigationTitle("System selection")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    System_Auswahl()
}
