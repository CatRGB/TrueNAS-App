//
//  SystemFilter.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 01.07.24.
//

import Foundation
import SwiftUI

enum SystemSeries: String, CaseIterable {
    case all = "All-Series"
    case HSeriesFilter = "H-Series"
    case RSeriesFilter = "R-Series"
    case FSeriesFilter = "F-Series"
    case MSeriesFilter = "M-Series"
    case MiniSeriesFilter = "Mini-Series"
    
    var id: String { self.rawValue }
    
    var FilterButton: String {
        switch self {
        case .all:
            return "All-Series"
        case .HSeriesFilter:
            return "H-Series"
        case .RSeriesFilter:
            return "R-Series"
        case .FSeriesFilter:
            return "F-Series"
        case .MSeriesFilter:
            return "M-Series"
        case .MiniSeriesFilter:
            return "Mini-Series"
        }
    }
}
