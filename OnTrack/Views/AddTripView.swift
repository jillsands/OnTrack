//
//  AddTripView.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/26/22.
//

import SwiftUI

struct AddTripView: View {
    // For list
    @EnvironmentObject var plannerVM: PlannerViewModel
    
    // For web view
    @StateObject private var webVM = WebViewModel()
    
    // Used to return to PlannerView() when add button is pressed
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            SwiftUIWebView(webView: webVM.webView)
                        .onAppear {
                            webVM.loadUrl(urlString: "https://www.wmata.com/schedules/trip-planner/")
                        }
            
            // "Add Trip" button should retrieve current URL and add it as a trip
                // would like to do this on back button click.
            Button(action: {
                plannerVM.addTrip(wmataLink: webVM.getURL()) // Retrieve URL from WMATA site
                presentationMode.wrappedValue.dismiss() // Return to PlannerView()
            }, label: {
                Text("Save Search")
                    .foregroundColor(Color("simpleBackgroundColor"))
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color("easyBlue"))
                    .cornerRadius(10)
                    .padding()
            })
        }
    }
}

struct AddTripView_Previews: PreviewProvider {
    static var previews: some View {
        AddTripView().environmentObject(PlannerViewModel())
    }
}
