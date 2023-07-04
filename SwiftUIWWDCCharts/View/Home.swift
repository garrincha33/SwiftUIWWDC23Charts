//
//  Home.swift
//  SwiftUIWWDCCharts
//
//  Created by Richard Price on 04/07/2023.
//

import SwiftUI
import Charts

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
            Chart {
                ForEach(appDownloads) { download in
                    if graphType == .bar {
                        ///Bar Chart
                    } else {
                        ///new swiftUI API SectorMark
                        SectorMark(
                            angle: .value("Downloads", download.downloads),
                            angularInset: graphType == .donut ? 2 : 8
                            
                        )
                        .cornerRadius(8)
                        .foregroundStyle(by: .value("Month", download.month))
                    }
                }
            }
            .frame(height: 300)
            .padding(.top, 20)
            Spacer(minLength: 0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
