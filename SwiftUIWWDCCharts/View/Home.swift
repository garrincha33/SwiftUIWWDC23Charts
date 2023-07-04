//
//  Home.swift
//  SwiftUIWWDCCharts
//
//  Created by Richard Price on 04/07/2023.
//

import SwiftUI

struct Home: View {
    @State private var graphType: GraphType = .donut
    
    var body: some View {
        VStack {
            ///Segmented Picker
            Picker("", selection: $graphType) {
                ForEach(GraphType.allCases, id: \.rawValue) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(.segmented)
            .labelsHidden()
            
            ///charts
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
