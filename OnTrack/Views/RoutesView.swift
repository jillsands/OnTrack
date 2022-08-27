//
//  RoutesView.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/5/22.
//

import SwiftUI

/* This View is essentially an iOS List View of the metro map. */
struct RoutesView: View {
    
    @State private var selectedView = 0
    @StateObject private var routeVM = RouteViewModel()
    var allRoutes: [Route] = routesData
    
    var body: some View {
        
        VStack {
            /* Segmented Control*/
            Picker("View All/View Favorites", selection: $selectedView) {
                Text("All").tag(0)
                Text("Favorites").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .colorMultiply(Color("easyBlue"))
            .onTapGesture {
                routeVM.toggleView()
                // Making sure picker moves
                if (selectedView == 0) {
                    selectedView = 1
                } else {
                    selectedView = 0
                }
            }
            
           
            /* List of Routes */
            List(routeVM.filteredRoutes) { route in
                NavigationLink(destination: StopsView(route: route)) {
                    HStack {
                        Image(route.imageName).resizable().frame(width: 15, height: 15) // Route Color
                        VStack { // Route Name
                            Text(route.title).font(.system(size: 25))
                        }
                        
                        Spacer()
                        Image(systemName: routeVM.contains(route) ? "star.fill": "star")
                            .foregroundColor(.black)
                            .onTapGesture {
                                routeVM.toggleFav(route: route)
                            }
                    }.foregroundColor(Color("mainTextColor"))
                        
                }
            }
        }
        .toolbar { // Links to the "More/Settings" View, which will link to a full schedule of WMATA routes...
            ToolbarItemGroup(placement: .navigationBarTrailing) {

                Button(action: {}, label: {
                    NavigationLink(destination: MapView()) {
                        Image(systemName: "map.circle")
                            .resizable().frame(width: 35, height: 35)
                    }
                })
                
                Button(action: {}, label: {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.circle")
                            .resizable().frame(width: 35, height: 35)
                    }
                })
                
                
            }
            
        }.accentColor(Color("accentBlue"))
            .navigationTitle("Routes")
    }
}

struct RoutesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoutesView()
        }
        
    }
}

