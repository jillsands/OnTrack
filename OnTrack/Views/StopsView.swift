//
//  StopsView.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/7/22.
//

import SwiftUI
import UIKit

struct StopsView: View {
    var route: Route
    
    var body: some View {
        //Color("easyBlue")
        // For each station that the route stops at
        ScrollView {
            ForEach(route.stops, id: \.self) { station in
                ZStack(alignment: .leading) {
                    //Color(UIColor.white)
                    Color("simpleBackgroundColor")
                    HStack {
                        // Display circle indicating how many minutes it is away from this station
                        MinuteCircle()
                        
                        // Display station title
                        VStack(alignment: .leading) {
                            HStack {
                                Text(station.title)
                                    .foregroundColor(Color("mainTextColor"))
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .lineLimit(2)
                                    .padding(.bottom, 5) // Separating RouteButton from title
                                
                                // Displays icons of services offered next to the title text
                               
                                ServiceIcons(station: station)
                            }

                            // Display routes that you may transfer to at this station
                            HStack {
                                if (station.routesServiced.count > 1) { RouteButton(route: route, station: station) }
                            }
                        }
                        .padding(.horizontal, 3) // Separating circle from text
                    }
                    .padding(10) // Separating list items from each other
                    
                }.clipShape(RoundedRectangle(cornerRadius: 15)) // Separating list item from edges of phone
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
            }
            .navigationTitle("\(route.imageName) Line Stops").foregroundColor(Color("mainTextColor"))
            .toolbar {
                
                // Image(route.imageName).resizable().font(.system(size: 0.5))
                
                Button(action: {}, label: {
                    NavigationLink(destination: MapView()) {
                        Image(systemName: "map.circle")
                            .resizable().frame(width: 35, height: 35).foregroundColor(Color("accentBlue"))
                    }
                })
            }.accentColor(Color.black)
        }//.background(Color(UIColor.systemGray5))
    }
}

/* This struct will show images of the services that each stop provides. Possible services include parking, transfer to the Marc Train, and transfer to the Amtrak train. */
struct ServiceIcons: View {
    var station: Station
    var body: some View {
        if (station.hasParking) { Image("park").resizable().frame(width: 30, height: 30, alignment: .center) }
        if (station.hasMarc) { Image("marc").resizable().frame(width: 30, height: 30, alignment: .bottom) }
        if (station.hasAmtrak) { Image("amtrak").resizable().frame(width: 30, height: 30, alignment: .bottom) }
    }
}
/* This struct defines a circular view that acts as a minute marker for the next closest arrival to each station. */
struct MinuteCircle: View {
    var body: some View {
        
        ZStack {
            Circle()
                .fill(Color("accentBlue"))
            
            VStack{
                Text("0")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                Text("mins")
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 50, height: 50, alignment: .center)
    }
}

/* This struct defines a text button that will represent all the routes one may transfer to at each station. */
struct RouteButton: View {
    var route: Route
    var station: Station
    
    var body: some View {
        
        Text("Transfer to:").foregroundColor(Color("subTextColor"))
        ForEach(station.routesServiced, id: \.self) { routeID in
            //ZStack {
                let transferRoute = routesData[routeID]
                if transferRoute.id != route.id {
                    Button(action: {}, label: {
                        NavigationLink(destination: StopsView(route: transferRoute)) {
                            Text(transferRoute.imageName)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(4)
                                .background(transferRoute.color)
                                .cornerRadius(5)
                        }
                    })
                }
            //}
        }
    }
    
}


struct StopsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StopsView(route: routesData[4])
        }
        
    }
}
