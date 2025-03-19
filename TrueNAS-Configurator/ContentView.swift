//
//  ContentView.swift
//  TrueNAS-Configurator
//
//  Created by Josi Salehi on 10.06.24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Grid {
                HStack {
                    Text("TrueNAS-Configurator")
                }
                .font(.title)
                .bold()
                .background(Color(UIColor.systemBackground))
                
                ScrollView {
                    Text("Hier könnte ein Info Text stehen, viel Spaß bei der DEMO")
                }
                .font(.title2)
                
                HStack {
                    NavigationLink(destination: System_Auswahl()) {
                        Text("Configure")
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(16)
                    .shadow(radius: 10)
                    .transition(.move(edge: .bottom))
                    
                }
            }
            .padding()
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}

