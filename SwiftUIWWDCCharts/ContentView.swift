//
//  ContentView.swift
//  SwiftUIWWDCCharts
//
//  Created by Richard Price on 04/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("Interactive Charts")
        }
    }
}

#Preview {
    ContentView()
}
