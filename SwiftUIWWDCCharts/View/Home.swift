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
                ForEach(appDownloads.sorted(by: { graphType == .bar ? false : $0.downloads > $1.downloads })) { download in
                    if graphType == .bar {
                        ///Bar Chart
                        BarMark(
                            x: .value("Month", download.month),
                            y: .value("Downloads", download.downloads)
                        )
                        .cornerRadius(8)
                        .foregroundStyle(by: .value("Month", download.month))
                    } else {
                        ///new swiftUI API SectorMark
                        SectorMark(
                            angle: .value("Downloads", download.downloads),
                            innerRadius: .ratio(graphType == .donut ? 0.61 : 0),
                            angularInset: graphType == .donut ? 2 : 8
                            
                            
                        )
                        .cornerRadius(8)
                        .foregroundStyle(by: .value("Month", download.month))
                        
                    }
                }
            }
            .chartLegend(position: .bottom, alignment: graphType == .bar ? .leading : .center, spacing: 20)
            .frame(height: 300)
            .padding(.top, 20)
            .animation(.snappy, value: graphType)
            Spacer(minLength: 0)
        }
        .padding()
    }
    @ViewBuilder
    func chartPopoverView(_ downloads: Double, _ month: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("App Downloads")
                .font(.title)
                .foregroundStyle(.gray)
            HStack(spacing: 4) {
                Text(String(format: "%.0f", downloads))
                    .font(.title3)
                    .textScale(.secondary)
                Text(month)
                    .font(.title3)
                    .textScale(.secondary)
            }
        }
        padding()
            .background(Color("PopupColor"), in: .rect(cornerRadius: 8))
    }
}

#Preview {
    ContentView()
}
