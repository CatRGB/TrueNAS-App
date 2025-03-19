//
//  TrueNASSysteme.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 28.06.24.
//

import Foundation
import SwiftUI

enum TrueNASSysteme: String, CaseIterable, Identifiable {
    case h10 = "TrueNAS H10"
    case h20 = "TrueNAS H20"
    case r10 = "TrueNAS R10"
    case r20 = "TrueNAS R20"
    case r30 = "TrueNAS R30"
    case r40 = "TrueNAS R40"
    case r50 = "TrueNAS R50"
    case f60 = "TrueNAS F60"
    case f100 = "TrueNAS F100"
    case m30 = "TrueNAS M30"
    case m40 = "TrueNAS M40"
    case m50 = "TrueNAS M50"
    case m60 = "TrueNAS M60"
    case miniX = "TrueNAS Mini X"
    case miniR = "TrueNAS Mini R"
    
    var id: String { self.rawValue }
    
    var series: SystemSeries {
        switch self {
            
        case .h10:
            return .HSeriesFilter
        case .h20:
            return .HSeriesFilter
        case .r10:
            return .RSeriesFilter
        case .r20:
            return .RSeriesFilter
        case .r30:
            return .RSeriesFilter
        case .r40:
            return .RSeriesFilter
        case .r50:
            return .RSeriesFilter
        case .f60:
            return .FSeriesFilter
        case .f100:
            return .FSeriesFilter
        case .m30:
            return .MSeriesFilter
        case .m40:
            return .MSeriesFilter
        case .m50:
            return .MSeriesFilter
        case .m60:
            return .MSeriesFilter
        case .miniX:
            return .MiniSeriesFilter
        case .miniR:
            return .MiniSeriesFilter
        }
    }
    
    var imageName: String {
        switch self {
            
        case .h10:
            return "TrueNAS-R-Series-R20-Shopimage"
        case .h20:
            return "TrueNAS-H-SERIES-H20"
        case .r10:
            return "TrueNAS-R-Series-R10-Configurator"
        case .r20:
            return "TrueNAS-R-Series-R20-Shopimage"
        case .r30:
            return "TrueNAS-R-Series-R30"
        case .r40:
            return "TrueNAS-R-Series-R40-Shopimage"
        case .r50:
            return "TrueNAS-R-Series-R50-Shopimage"
        case .f60:
            return "TrueNAS-F-SERIES-F60"
        case .f100:
            return "TrueNAS-F-Series-F100-1"
        case .m30:
            return "TrueNAS-configurator-M30-Image-1"
        case .m40:
            return "TrueNAS-M-Series-M40-Shopimage"
        case .m50:
            return "TrueNAS-M-Series-M50-Shopimage"
        case .m60:
            return "TrueNAS-M-Series-M60-Shopimage"
        case .miniX:
            return "Mini_X_Closed"
        case .miniR:
            return "truenas-mini-r-close"
        }
    }
    
    var reck_space: String {
        switch self {
        case .h10:
            return "2U"
        case .h20:
            return "2U"
        case .r10:
            return "1U"
        case .r20:
            return "2U-10U"
        case .r30:
            return "1U"
        case .r40:
            return "2U-6U"
        case .r50:
            return "4U-12U"
        case .f60:
            return "2U"
        case .f100:
            return "2U"
        case .m30:
            return "4U"
        case .m40:
            return "4U"
        case .m50:
            return "4U"
        case .m60:
            return "4U"
        case .miniX:
            return "-"
        case .miniR:
            return "2U"
        }
    }
    var controller: String {
        switch self {
        case .h10:
            return "Dualcontroller"
        case .h20:
            return "Dualcontroller"
        case .r10:
            return "Single"
        case .r20:
            return "Single"
        case .r30:
            return "Single"
        case .r40:
            return "Single"
        case .r50:
            return "Single"
        case .f60:
            return "Dual"
        case .f100:
            return "Dual"
        case .m30:
            return "Single & Dual"
        case .m40:
            return "Single & Dual"
        case .m50:
            return "Single & Dual"
        case .m60:
            return "Single & Dual"
        case .miniX:
            return "-"
        case .miniR:
            return "?"
        }
    }
    
    var ram: String {
        switch self {
        case .h10:
            return "64 GB – 128 GB"
        case .h20:
            return "128 GB – 256 GB"
        case .r10:
            return "32 GB – 96 GB"
        case .r20:
            return "32 GB – 192 GB"
        case .r30:
            return "Up to 1024 GB"
        case .r40:
            return "64 GB – 192 GB"
        case .r50:
            return "32 GB – 192 GB"
        case .f60:
            return "512 GB"
        case .f100:
            return "512 GB"
        case .m30:
            return "64 GB"
        case .m40:
            return "128 GB – 192 GB"
        case .m50:
            return "256 GB – 384 GB"
        case .m60:
            return "768 GB"
        case .miniX:
            return "16 GB - 32 GB"
        case .miniR:
            return "32 GB - 64 GB"
        }
    }
    
    var drives: String {
        switch self {
            
        case .h10:
            return "Bis zu 72"
        case .h20:
            return "Bis zu 114"
        case .r10:
            return "Up to 16"
        case .r20:
            return "Up to 132"
        case .r30:
            return "Up to 16"
        case .r40:
            return "Up to 168"
        case .r50:
            return "Up to 132"
        case .f60:
            return "Up to 72"
        case .f100:
            return "Up to 120"
        case .m30:
            return "Up to 24"
        case .m40:
            return "Up to 144"
        case .m50:
            return "Up to 504"
        case .m60:
            return "Up to 1248"
        case .miniX:
            return "-"
        case .miniR:
            return "?"
        }
    }
    
    var ethernet: String {
        switch self {
        case .h10:
            return "4x 1G Base-T"
        case .h20:
            return "4x 1G Base-T"
        case .r10:
            return "2x 100 GbE"
        case .r20:
            return "2x 100 GbE"
        case .r30:
            return "2x 1 GbE (integriert)"
        case .r40:
            return "2x 100 GbE"
        case .r50:
            return "2x 100 GbE"
        case .f60:
            return "2x 10G Base-T & 4x 40/100 GbE (optical)"
        case .f100:
            return "2x 10G Base-T & 6x 40/100 GbE (optical)"
        case .m30:
            return "2x 40 GbE"
        case .m40:
            return "2x 40 GbE"
        case .m50:
            return "2x 100 GbE"
        case .m60:
            return "4x 100 GbE"
        case .miniX:
            return "2x 1G"
        case .miniR:
            return "2x 1/10GBaseT Ethernet LAN-Anschlüsse (10/100/1000) | 2 x SFP+ 10G Add On Card (Optional)"
        }
    }
    
    var optional: String {
        switch self {
            
        case .h10:
            return "4x 10/25 GbE (SFP28)"
        case .h20:
            return "4x 10/25 GbE (SFP28) und 2x 40/100 GbE (QSFP28)"
        case .r10:
            return "-"
        case .r20:
            return "-"
        case .r30:
            return "2x 100GbE oder 4x 10/25/100GbE"
        case .r40:
            return "-"
        case .r50:
            return "-"
        case .f60:
            return "-"
        case .f100:
            return "-"
        case .m30:
            return "-"
        case .m40:
            return "-"
        case .m50:
            return "-"
        case .m60:
            return "-"
        case .miniX:
            return "-"
        case .miniR:
            return "Long Rail Kit verfügbar – 26.5″ bis 36.4″ Rackmount-tiefe"
        }
    }
    
    var fibreChannel: String {
        switch self {
        case .h10:
            return "-"
        case .h20:
            return "-"
        case .r10:
            return "2 x 32 GbE (optional)"
        case .r20:
            return "2 x 32 GbE (optional)"
        case .r30:
            return "-"
        case .r40:
            return "2 x 32 GbE (optional)"
        case .r50:
            return "2 x 32 GbE (optional)"
        case .f60:
            return "20 GByte/s"
        case .f100:
            return "2x 16 Gb"
        case .m30:
            return "2x 16 Gb"
        case .m40:
            return "4x 16 Gb"
        case .m50:
            return "4x 16 Gb / 2x 32 Gb"
        case .m60:
            return "4x 32 Gb"
        case .miniX:
            return "-"
        case .miniR:
            return "-"
        }
    }
    
    var maxThroughput: String {
        switch self {
            
        case .h10:
            return "-"
        case .h20:
            return "-"
        case .r10:
            return "-"
        case .r20:
            return "-"
        case .r30:
            return "-"
        case .r40:
            return "-"
        case .r50:
            return "-"
        case .f60:
            return "20 GByte/s"
        case .f100:
            return "30 GByte/s"
        case .m30:
            return "-"
        case .m40:
            return "-"
        case .m50:
            return "-"
        case .m60:
            return "-"
        case .miniX:
            return "-"
        case .miniR:
            return "-"
        }
    }
    
    var expansionShelves: String {
        switch self {
        case .h10:
            return "1"
        case .h20:
            return "1"
        case .r10:
            return "-"
        case .r20:
            return "2"
        case .r30:
            return "-"
        case .r40:
            return "2"
        case .r50:
            return "2"
        case .f60:
            return "2 (Demnächst verfügbar)"
        case .f100:
            return "4 (Demnächst verfügbar)"
        case .m30:
            return "0"
        case .m40:
            return "2"
        case .m50:
            return "8"
        case .m60:
            return "12"
        case .miniX:
            return "-"
        case .miniR:
            return "-"
        }
    }
    var os: String {
        switch self {
        case .h10:
            return "Enterprise"
        case .h20:
            return "Enterprise"
        case .r10:
            return "CORE, SCALE, Enterprise"
        case .r20:
            return "CORE, SCALE, Enterprise"
        case .r30:
            return "CORE, SCALE, Enterprise"
        case .r40:
            return "CORE, SCALE, Enterprise"
        case .r50:
            return "CORE, SCALE, Enterprise"
        case .f60:
            return "Enterprise"
        case .f100:
            return "Enterprise"
        case .m30:
            return "Enterprise"
        case .m40:
            return "Enterprise"
        case .m50:
            return "Enterprise"
        case .m60:
            return "Enterprise"
        case .miniX:
            return "CORE, SCALE"
        case .miniR:
            return "CORE, SCALE"
        }
    }
    var garantie: String {
        switch self {
        case .h10:
            return "1 Jahr (erweiterbar)"
        case .h20:
            return "1 Jahr (erweiterbar)"
        case .r10:
            return "1 Jahr (erweiterbar)"
        case .r20:
            return "1 Jahr (erweiterbar)"
        case .r30:
            return "1 Jahr (erweiterbar)"
        case .r40:
            return "1 Jahr (erweiterbar)"
        case .r50:
            return "1 Jahr (erweiterbar)"
        case .f60:
            return "1 Jahr (erweiterbar)"
        case .f100:
            return "1 Jahr (erweiterbar)"
        case .m30:
            return "1 Jahr (erweiterbar)"
        case .m40:
            return "1 Jahr (erweiterbar)"
        case .m50:
            return "1 Jahr (erweiterbar)"
        case .m60:
            return "1 Jahr (erweiterbar)"
        case .miniX:
            return "1 Jahr (erweiterbar)"
        case .miniR:
            return "1 Jahr (erweiterbar)"
        }
    }
    var features: String {
        switch self {
        case .h10:
            return "uneingeschränkt"
        case .h20:
            return "uneingeschränkt"
        case .r10:
            return "uneingeschränkt"
        case .r20:
            return "uneingeschränkt"
        case .r30:
            return "uneingeschränkt"
        case .r40:
            return "uneingeschränkt"
        case .r50:
            return "uneingeschränkt"
        case .f60:
            return "uneingeschränkt"
        case .f100:
            return "uneingeschränkt"
        case .m30:
            return "uneingeschränkt"
        case .m40:
            return "uneingeschränkt"
        case .m50:
            return "uneingeschränkt"
        case .m60:
            return "uneingeschränkt"
        case .miniX:
            return "Keine HA Unterstützung"
        case .miniR:
            return "Keine HA Unterstützung"
        }
    }
    var lizenzkosten: String {
        switch self {
        case .h10:
            return "keine"
        case .h20:
            return "keine"
        case .r10:
            return "keine"
        case .r20:
            return "keine"
        case .r30:
            return "keine"
        case .r40:
            return "keine"
        case .r50:
            return "keine"
        case .f60:
            return "keine"
        case .f100:
            return "keine"
        case .m30:
            return "keine"
        case .m40:
            return "keine"
        case .m50:
            return "keine"
        case .m60:
            return "keine"
        case .miniX:
            return "keine"
        case .miniR:
            return "keine"
        }
    }
    var support: String {
        switch self {
        case .h10:
            return "Hier ist ein Knopf"
        case .h20:
            return "Hier ist ein Knopf"
        case .r10:
            return "Hier ist ein Knopf"
        case .r20:
            return "Hier ist ein Knopf"
        case .r30:
            return "Hier ist ein Knopf"
        case .r40:
            return "Hier ist ein Knopf"
        case .r50:
            return "Hier ist ein Knopf"
        case .f60:
            return "Hier ist ein Knopf"
        case .f100:
            return "Hier ist ein Knopf"
        case .m30:
            return "Hier ist ein Knopf"
        case .m40:
            return "Hier ist ein Knopf"
        case .m50:
            return "Hier ist ein Knopf"
        case .m60:
            return "Hier ist ein Knopf"
        case .miniX:
            return "Hier ist ein Knopf"
        case .miniR:
            return "Hier ist ein Knopf"
        }
    }
}

