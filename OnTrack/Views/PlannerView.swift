//
//  PlannerView.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/12/22.
//

import SwiftUI
import WebKit

/* This View will employ the WMATA trip planner page to assist those taking longer, or more complicated journeys. It is a list of the user's previously planned trips. There is a two bar item to add a trip, which will emloy AddView(). */
struct PlannerView: View {
    // See PlannerViewModel class. Provides a basis for previously saved trips.
    @EnvironmentObject var plannerVM: PlannerViewModel
    @StateObject var webVM = WebViewModel()
    
    var body: some View {
        // Displays a List view of all previously planned trips
        VStack {
            if (plannerVM.savedTrips.isEmpty) {
                VStack(alignment: .center) {
                    Text("No Saved Trips")
                        .font(.headline)
                        .foregroundColor(Color("easyBlue"))
                        .fontWeight(.bold)
                    
                    Text("To save a trip, click the plus icon and visit WMATA's trip planner. Once you've planned a trip, click \"Save Search\"")
                        .font(.subheadline)
                        .foregroundColor(Color("mainTextColor"))
                }
                
            } else {
                List {
                    ForEach(plannerVM.savedTrips) { trip in
                        NavigationLink(destination: SwiftUIWebView(webView: webVM.webView)
                            .onAppear {
                                webVM.loadUrl(urlString: trip.wmataLink!)
                            }) {
                                
                                VStack(alignment: .leading) {
                                    
                                    // "Denton Hall to L'Enfant Plaza" in bold, headline font
                                    Text(trip.loc ?? "ERROR")
                                        .font(.headline).foregroundColor(Color("easyBlue"))
                                        .fontWeight(.bold)
                                    
                                    Text(trip.arrDep ?? "ERROR")
                                        .font(.subheadline)
                                        .foregroundColor(Color("mainTextColor"))
                                    
                                    
                                    // "Traveling by [rail] on route with [earliest arrival time] and no more than [.5] mile of walking
                                    Text("Traveling by \(trip.travelBy!) on the route with \(trip.chosenRoute!) and no more than \(trip.walkMax!) mile of walking")
                                        .font(.caption)
                                        .foregroundColor(Color("subTextColor"))
                                    
                                }
                            }
                        /*.onTapGesture  {
                         plannerVM.updateTrip(trip: <#T##TripEntity#>)
                         }*/
                    }
                    .onDelete(perform: plannerVM.deleteTrip)
                }
                .listStyle(.automatic)
            }
        }
        .navigationTitle("Planned Trips")//.foregroundColor(Color("mainTextColor"))
        .toolbar { // Links to the "More/Settings" View, which will link to a full schedule of WMATA routes...
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                
                // AddView button
                Button(action: {}, label: {
                    NavigationLink(destination: AddTripView()) {
                        Image(systemName: "plus.circle")
                            .resizable().frame(width: 35, height: 35)
                    }
                    
                })
                
                // SettingsView button
                Button(action: {}, label: {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.circle")
                            .resizable().frame(width: 35, height: 35)
                    }
                })
            }
            
        } .accentColor(Color("accentBlue"))
    }
}

struct SwiftUIWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

struct PlannerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlannerView()
        }.environmentObject(PlannerViewModel())
    }
}
