//
//  MapView.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/18/22.
//

import SwiftUI

/* Provides a view of the metro map for users to reference while looking at the routes and stations. This View is intended to be presented modally whenever clicked. */
struct MapView: View {
    var body: some View {
        ZStack {
            Image("metro map")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .border(Color("easyBlue"), width: 7)
                .cornerRadius(10)
                .padding(.all, 11)
                /*.cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("easyBlue"), lineWidth: 5))*/
            // Select a station
            // Pinpoint on map
            // "This station is in __, Maryland. From this station, you may board the __ and __ lines."
        }
        .navigationTitle("WMATA Metro Map")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
