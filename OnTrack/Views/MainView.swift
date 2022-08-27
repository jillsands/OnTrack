//
//  MainView.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/18/22.
//

import SwiftUI

struct MainView: View {
    
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
        .accentColor(Color("accentBlue"))
        /*.onAppear { // correcting a bug in the transparency of the tab bar
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance*/
            
            /*let navigationBarAppearance = UINavigationBarAppearance()
             navigationBarAppearance.configureWithOpaqueBackground()
             UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance */
        }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
