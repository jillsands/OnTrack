//
//  OnTrackApp.swift
//  OnTrack
//
//  Created by Jillian Sands on 7/19/22.
//
// Color Palette: https://coolors.co/palette/ffffff-f0f0f0-dadada-5481b5-4d77a7-436a96-3d3d3d-2f2f2f-202020
import SwiftUI

@main
struct OnTrackApp: App {
    
    @StateObject private var plannerVM = PlannerViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(plannerVM)
        }
    }
}
