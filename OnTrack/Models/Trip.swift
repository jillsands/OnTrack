//
//  Trip.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/12/22.
//
/*
import Foundation

// To make immutable, use let instead of var
struct Trip: Identifiable, Hashable {
    var id = UUID()
    var startingLocation: String
    var destination: String
    var travelBy: String
    var arrDep: String
    var time: String
    var date: String
    var chosenRoute: String
    var walkMax: String
    var wmataLink: String
    
    // Default initializer, user must enter all values except id (only used for testing)
    init(startingLocation: String, destination: String, travelBy: String, arrDep: String, time: String, date: String, chosenRoute: String, walkMax: String, wmataLink: String) {
        self.startingLocation = startingLocation
        self.destination = destination
        self.travelBy = travelBy
        self.arrDep = arrDep
        self.time = time
        self.date = date
        self.chosenRoute = chosenRoute
        self.walkMax = walkMax
        self.wmataLink = wmataLink
    }
    
    // Parsing wmataLink to find all other components
    init(wmataLink: String) {
        let components = wmataLink.components(separatedBy: "&")
        /*  Returns:
            0.["https://www.wmata.com/schedules/trip-planner/trip-planner-results.cfm?locationLatLng=38.8972013%2C-77.02822119999999",
             1. "destinationLatLng=38.9896967%2C-76.93776",
             2. "first-form=",
             3. "location=METRO+CENTER+STATION+ENTRANCE",
             4. "destination=COLLEGE+PARK",
             5. "travelby-trip-planner=BCFKLRSTX123",
             6. "arrdep-trip-planner=D",
             7. "hour-leaving-trip-planner=10",
             8. "minute-leaving-trip-planner=19",
             9. "period-leaving-trip-planner=AM",
             10. "month-leaving-trip-planner=8",
             11. "day-leaving-trip-planner=12",
             12. "route-trip-planner=T",
             13. "walk-distance-trip-planner=.75"] */
        
        // Removing all of the identifier text (ex. "arrdep-trip-planner=D" -> "D")
        var idData = [String]()
        for string in components {
            let startIdx = string.index(string.firstIndex(of: "=")!, offsetBy: 1) // substring starts after "="
            idData.append(String(string[startIdx..<string.endIndex]))
        }
        
        
        // Replacing "+" delimiter with a space and making title case.
        startingLocation = idData[3].replacingOccurrences(of: "+", with: " ").capitalized
        destination = idData[4].replacingOccurrences(of: "+", with: " ").capitalized
        
        // travel by both: BCFKLRSTX123, bus: BKX, rail: CLR
        if (idData[5] == "BCFKLRSTX123") {
            travelBy = "rail and bus"
        } else if (idData[5] == "BKX") {
            travelBy = "bus"
        } else {
            travelBy = "rail"
        }
        
        // "Leave At": D, "Arrive By": A, "Earliest Trip": F, "Last Trip": L
        if (idData[6] == "D") {
            arrDep = "Leaving at"
        } else if (idData[6] == "A") {
            arrDep = "Arriving by"
        } else if (idData[6] == "F"){
            arrDep = "Earliest trip"
        } else {
            arrDep = "Last trip"
        }
        
        time = idData[7] + ":" + idData[8] + " " + idData[9] // in the form of "8:11"
        date = idData[10] + "/" + idData[11] // in the form of "8/11"
        
        // on the route with the [chosenRoute] 
        // "Gets me there first" = T, "Least walking" = W, "Fewest Transfers" = X
        if (idData[12] == "T") {
            chosenRoute = "earliest arrival time"
        } else if (idData[12] == "W") {
            chosenRoute = "least walking"
        } else {
            chosenRoute = "fewest transfers"
        }
        
        // Double value; no parsing needed (" miles" added in planner view)
        walkMax = idData[13]
        
        // No parsing needed.
        self.wmataLink = wmataLink
    }
    
    // Hashable Functons
    static func == (lhs: Trip, rhs: Trip) -> Bool {
        return lhs.startingLocation == rhs.startingLocation &&
        lhs.wmataLink == rhs.wmataLink
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(startingLocation)
        hasher.combine(wmataLink)
    }
    
    
}
*/
