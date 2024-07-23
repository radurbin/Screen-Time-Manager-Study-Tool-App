//
//  ActivitiesView.swift
//  Monitor
//
//  Created by Pedro Somensi on 06/08/23.
//  Expanded by Riley Durbin on 07/23/24.
//

import SwiftUI

struct ActivitiesView: View {
    var activities: DeviceActivity
    
    var body: some View {
        VStack {
            Spacer(minLength: 50)
            
            // Display total usage time from DeviceActivity
            Text("Usage time: \(formatUsageTime(activities.duration))")
                .bold()
                .font(.title3)
            
            List(filteredAndSortedApps(activities.apps)) { app in
                ListItem(app: app)
            }
        }
    }
    
    // Function to format usage time based on whether hours is zero or not
    private func formatUsageTime(_ duration: TimeInterval) -> String {
        let totalSeconds = Int(duration)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        
        if hours > 0 {
            return String(format: "%dh %02dm %02ds", hours, minutes, seconds)
        } else {
            return String(format: "%02dm %02ds", minutes, seconds)
        }
    }
    
    // Function to filter and sort apps by duration in descending order
    private func filteredAndSortedApps(_ apps: [AppReport]) -> [AppReport] {
        return apps
            .filter { $0.duration > 0 }
            .sorted { $0.duration > $1.duration }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(activities: DeviceActivity(duration: 3422, apps: [
            AppReport(id: "1", name: "Twitter", duration: 600),
            AppReport(id: "2", name: "Facebook", duration: 1200),
            AppReport(id: "3", name: "Instagram", duration: 300),
            AppReport(id: "4", name: "EmptyApp", duration: 0) // This app will be filtered out
        ]))
    }
}
