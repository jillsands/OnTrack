//
//  Station.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/12/22.
//

import Foundation

struct Station: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var hasParking: Bool = false // Default value, so we only have to specify if it actually has hasParking, etc.
    var hasMarc: Bool =  false
    var hasAmtrak: Bool =  false
    var majorTransfers: Bool = false
    var routesServiced: [Int] // using their id numbers, so its easier to access them later
    
    // Hashable Functons
    static func == (lhs: Station, rhs: Station) -> Bool {
        return lhs.title == rhs.title && lhs.routesServiced == rhs.routesServiced
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(title)
           hasher.combine(routesServiced)
    }
    
}


// All Stations (found at https://www.wmata.com/rider-guide/stations/)
// future iterations: read in location, name, and stations stopped at?
var glenmont = Station(title: "Glenmont", hasParking: true, routesServiced: [0])
var wheaton = Station(title: "Wheaton", hasParking: true, routesServiced: [0])
var forestGlen = Station(title: "Forest Glen", hasParking: true, routesServiced: [0])
var silverSpring = Station(title: "Silver Spring", hasParking: true, hasMarc: true, routesServiced: [0])
var takoma = Station(title: "Takoma", hasParking: true, routesServiced: [0])
var fortTotten = Station(title: "Fort Totten", hasParking: true, majorTransfers: true, routesServiced: [0, 1, 2])
var brookland = Station(title: "Brookland-CUA", routesServiced: [0])
var rh = Station(title: "Rhode Island Ave", hasParking: true, routesServiced: [0])
var noma = Station(title: "NoMa-Gallaudet U",routesServiced: [0])
var union = Station(title: "Union Station", hasMarc: true, hasAmtrak: true, routesServiced: [0])
var jud = Station(title: "Judiciary Sq", routesServiced: [0])
var gallery = Station(title: "Gallery Place (Chinatown)", majorTransfers: true, routesServiced: [0, 1, 2])
var metro = Station(title: "Mtro Center", majorTransfers: true, routesServiced: [0, 3, 4, 5])
var farragutN = Station(title: "Farragut North", routesServiced: [0])
var dupont = Station(title: "Dupont Circle", routesServiced: [0])
var woodley = Station(title: "Woodley Park (Zoo/Adams Morgan)", routesServiced: [0])
var cleveland = Station(title: "Cleveland Park", routesServiced: [0])
var friendship = Station(title: "Friendship Heights", routesServiced: [0])
var bethesda = Station(title:"Bethesda", routesServiced: [0])
var medical = Station(title: "Medical Center", routesServiced: [0])
var grosvenor = Station(title: "Grosvenor-Strathmore", hasParking: true, routesServiced: [0])
var whiteFlint = Station(title: "White Flint", hasParking: true, routesServiced: [0])
var twinbrook = Station(title: "Twinbrook", hasParking: true, routesServiced: [0])
var rockville = Station(title: "Rockville", hasParking: true, hasMarc: true, hasAmtrak: true, routesServiced: [0])
var shadyGrove = Station(title: "Shady Grove", hasParking: true, routesServiced: [0])
var greenbelt = Station(title: "Greenbelt", hasParking: true, hasMarc: true, routesServiced: [1, 2])
var cp = Station(title: "College Park-U of MD", hasParking: true, hasMarc: true, routesServiced: [1, 2])
var pgPlaza = Station(title: "Prince George's Plaza", hasParking: true, routesServiced: [1, 2])
var hyattsville = Station(title: "West Hyattsville", hasParking: true, routesServiced: [1, 2])
var georgia = Station(title: "Goergia Ave - Petworth", routesServiced: [1, 2])
var columbia = Station(title: "Columbia Heights", routesServiced: [1, 2])
var uSt = Station(title: "U St", routesServiced: [1, 2])
var shaw = Station(title: "Shaw-Howard U", routesServiced: [1, 2])
var mtVernon = Station(title: "Mt Vernon Sq (7th St-Convention Center)", routesServiced: [1, 2])
var archives = Station(title: "Archives (Navy Memorial-Penn Quarter)", routesServiced: [1, 2])
var lenfant =  Station(title: "L'Enfant Plaza", majorTransfers: true, routesServiced: [1, 2, 3, 4, 5])
var pentagon =  Station(title: "Pentagon", routesServiced: [1, 5])
var pentagonCity = Station(title: "Pentagon", routesServiced: [1, 5])
var crystal = Station(title: "Crystal City", routesServiced: [1, 5])
var dca = Station(title: "Ronald Reagan  Washington National Airport", routesServiced: [1, 5])
var braddock = Station(title: "Braddock Rd", routesServiced: [1, 5])
var kingSt = Station(title: "King St-Old Town", hasAmtrak: true, majorTransfers: true, routesServiced: [1, 5])
var eisenhower = Station(title: "Eisenhower Ave", routesServiced: [1])
var huntington = Station(title: "Huntington", hasParking: true, routesServiced: [1])
var vanDorn = Station(title: "Van Dorn St", hasParking: true, routesServiced: [5])
var franconia = Station(title: "Franconia-Springfield", hasParking: true, routesServiced: [5])
var waterfront = Station(title: "Waterfront", routesServiced: [2])
var navyYard = Station(title: "Navy Yard-Ballpark", routesServiced: [2])
var anacostia = Station(title: "Anacostia", hasParking: true, routesServiced: [2])
var congress = Station(title: "Congress Heights", routesServiced: [2])
var southern = Station(title: "Southern Ave", hasParking: true, routesServiced: [2])
var naylor = Station(title: "Naylor Rd", hasParking: true, routesServiced: [2])
var suitland = Station(title: "Suitland", hasParking: true, routesServiced: [2])
var branch = Station(title: "Branch Ave", hasParking: true, routesServiced: [2])
var vienna = Station(title: "Vienna-Fairfax-GMU", hasParking: true, routesServiced: [3])
var dunn = Station(title: "Dunn Loring-Merifield", hasParking: true, routesServiced: [3])
var wFallsChurch = Station(title: "West Falls Church-VT/UVA", hasParking: true, routesServiced: [3])
var eFallsChurch = Station(title: "East Falls Church", hasParking: true, majorTransfers: true, routesServiced: [3, 4])
var ballston = Station(title: "Ballston-MU", routesServiced: [3, 4])
var vaSq = Station(title: "Virginia Sq-GMU", routesServiced: [3, 4])
var clarendon = Station(title: "Clarendon", routesServiced: [3, 4])
var court = Station(title: "Court House", routesServiced: [3, 4])
var rosslyn = Station(title: "Rosslyn", majorTransfers: true, routesServiced: [3, 4, 5])
var gwu = Station(title: "Foggy Bottom-GWU", routesServiced: [3, 4, 5])
var farragutW = Station(title: "Farragut West", routesServiced: [3, 4, 5])
var mcpherson = Station(title: "McPherson Sq", routesServiced: [3, 4, 5])
var fedTri = Station(title: "Federal Triangle", routesServiced: [3, 4, 5])
var smithsonian = Station(title: "Smithsonian-National Mall", routesServiced: [3, 4, 5])
var fedCent = Station(title: "Federal Center SW", routesServiced: [3, 4, 5])
var capitolS = Station(title: "Capitol South", routesServiced: [3, 4, 5])
var easternMarket = Station(title: "Eastern Market", routesServiced: [3, 4, 5])
var potomac = Station(title: "Potomac Ave", routesServiced: [3, 4, 5])
var stadium = Station(title: "Stadium-Armory", majorTransfers: true, routesServiced: [3, 4, 5])
var minnesota = Station(title: "Miennesota Ave", hasParking: true, routesServiced: [3])
var deanwood = Station(title: "Deanwood", hasParking: true, routesServiced: [3])
var cheverly = Station(title: "Cheverly", hasParking: true, routesServiced: [3])
var landover = Station(title: "Landover", hasParking: true, routesServiced: [3])
var newCarollton = Station(title: "New Carollton", hasParking: true, hasMarc: true, hasAmtrak: true, routesServiced: [3])
var wiehle = Station(title: "Wiehle-Reston East", hasParking: true, routesServiced: [4])
var springHill = Station(title: "Spring Hill", routesServiced: [4])
var greensboro = Station(title: "Greensboro", routesServiced: [4])
var tysons = Station(title: "Tysons Corner", routesServiced: [4])
var mclean = Station(title: "McLean", routesServiced: [4])
var benning = Station(title: "Benning Rd", routesServiced: [4, 5])
var capitolH = Station(title: "Capitol Heights", hasParking: true, routesServiced: [4, 5])
var addison = Station(title: "Addison Rd-Seat Pleasanr", hasParking: true, routesServiced: [4, 5])
var morgan = Station(title: "Morgan Blvd", hasParking: true, routesServiced: [4, 5])
var largo = Station(title: "Largo Town Center", hasParking: true, routesServiced: [4, 5])
var arlington = Station(title: "Arlington Cemetery", routesServiced: [5])
