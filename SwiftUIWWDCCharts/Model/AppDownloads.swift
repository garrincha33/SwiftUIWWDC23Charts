//
//  AppDownloads.swift
//  SwiftUIWWDCCharts
//
//  Created by Richard Price on 04/07/2023.
//

import SwiftUI

struct AppDownloads: Identifiable {
    var id: UUID = .init()
    var date: Date
    var downloads: Double
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }
}

extension [AppDownloads] {
    func findDownloads(_ on: String) -> Double? {
        if let download = self.first(where: { $0.month == on
        }) {
            return download.downloads
        }
        return nil
    }
    
    func index(_ on: String) -> Int {
        if let index = self.firstIndex(where: {
            $0.month == on
        }) {
            return index
        }
        return 0
    }
}

var appDownloads: [AppDownloads] = [

    .init(date: .createDate(1, 1, 2023), downloads: 2500),
    .init(date: .createDate(2, 1, 2023), downloads: 3500),
    .init(date: .createDate(1, 30, 2023), downloads: 5500),
    .init(date: .createDate(4, 12, 2023), downloads: 7200),
    .init(date: .createDate(2, 8, 2023), downloads: 7800),
    .init(date: .createDate(11, 11, 2023), downloads: 8500),
    .init(date: .createDate(12, 1, 2023), downloads: 9500)

]

extension Date {
    static func createDate(_ day: Int, _ month: Int, _ year: Int) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        
        let calendar = Calendar.current
        let date = calendar.date(from: components) ?? .init()
        
        return date
    }
}
