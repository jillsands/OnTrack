//
//  Stations.swift
//  OnTrack
//
//  Created by Jillian Sands on 7/31/22.
//

import Foundation

struct Station: Identifiable {
    var id = UUID()
    var title: String
    var parking: Bool
    var marc: Bool
    var amtrak: Bool
    var transfers: [String] = [String]()
}

// All Stations
var glenmont = Station(title: "Glenmont", parking: true, marc: false, amtrak: false)
var wheaton = Station(title: "Wheaton", parking: true, marc: false, amtrak: false)
var forestGlen = Station(title: "Forest Glen", parking: true, marc: false, amtrak: false)
var silverSpring = Station(title: "Silver Spring", parking: true, marc: true, amtrak: false)
var takoma = Station(title: "Takoma", parking: true, marc: false, amtrak: false)
var fortTotten = Station(title: "Fort Totten", parking: true, marc: false, amtrak: false, transfers: ["Red", "Yellow", "Green"])
var brookland = Station(title: "Brookland-CUA", parking: false, marc: false, amtrak: false)
var rh = Station(title: "Rhode Island Ave", parking: true, marc: false, amtrak: false)
var noma = Station(title: "NoMa-Gallaudet U", parking: false, marc: false, amtrak: false)
var union = Station(title: "Union Station", parking: false, marc: true, amtrak: true)
var jud = Station(title: "Judiciary Sq", parking: false, marc: false, amtrak: false)
var gallery = Station(title: "Gallery Place", parking: false, marc: false, amtrak: false, transfers: ["Red", "Yellow", "Green"])
var metro = Station(title: "Mtro Center", parking: false, marc: false, amtrak: false, transfers: ["Red", "Orange", "Silver", "Blue"])
var farragut = Station(title: "Farragut North", parking: false, marc: false, amtrak: false)
var dupont = Station(title: "Dupont Circle", parking: false, marc: false, amtrak: false)
var woodley = Station(title: "Woodley Park (Zoo/Adams Morgan)", parking: false, marc: false, amtrak: false)
var cleveland = Station(title: "Cleveland Park", parking: false, marc: false, amtrak: false)
var friendship = Station(title: "Friendship Heights", parking: false, marc: false, amtrak: false)
var bethesda = Station(title:"Bethesda", parking: false, marc: false, amtrak: false)
var medical = Station(title: "Medical Center", parking: false, marc: false, amtrak: false)
var grosvenor = Station(title: "Grosvenor-Strathmore", parking: true, marc: false, amtrak: false)
var whiteFlint = Station(title: "White Flint", parking: true, marc: false, amtrak: false)
var twinbrook = Station(title: "Twinbrook", parking: true, marc: false, amtrak: false)
var rockville = Station(title: "Rockville", parking: true, marc: true, amtrak: true)
var shadyGrove = Station(title: "Shady Grove", parking: true, marc: false, amtrak: false)



// An array of stations for each line
var redStops = [glenmont, wheaton, forestGlen, silverSpring, takoma, brookland, rh, noma, union, jud, gallery, metro, farragut, dupont, woodley, cleveland, friendship, bethesda, medical, grosvenor, whiteFlint, twinbrook, rockville]

