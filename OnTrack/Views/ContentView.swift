//
//  ContentView.swift
//  OnTrack
//  Created by Jillian Sands on 7/19/22.
//
/* This app is an independent personal project by Jillian Sands. It simplifies the W-MATA DC metro system for passengers to view routes, stations, amenities, and schedules. This app employs SF Symbols and data directly from the www.wmata.com. */
import SwiftUI
/* The homepage of the app: begin on a tabbed navigation view with a list of all the metro routes. */
struct ContentView: View {
    
    var body: some View {
        /* A tab view, where the two tabs provided are RoutesView(), and MapView(). Within this view is a nested navigation view to facilitate navigation between later Views. */
        TabView {
            // Navigation begins on RoutesView(), the "home" of the app.
            NavigationView {
                RoutesView()
            }.tabItem { // Tab to indicate RoutesView screen.
                Text("Routes")
                Image(systemName: "list.bullet.circle")
            }
            
            // A second tab
            NavigationView {
                PlannerView()
            }.tabItem { // Tab to indicate PlannerView screen.
                Text("Trips")
                Image(systemName: "paperplane.circle").font(.title)
            }
        }
        .accentColor(Color.black) // Tabs will have an accent color of black
        .onAppear { // correcting a bug in the transparency of the tab bar
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            
            /*let navigationBarAppearance = UINavigationBarAppearance()
             navigationBarAppearance.configureWithOpaqueBackground()
             UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance */
        }
    }
    
}
