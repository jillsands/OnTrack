//
//  PlannerViewModel.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/12/22.
//
import CoreData
import Foundation

class PlannerViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedTrips: [TripEntity] = []

    init() {
        container = NSPersistentContainer(name: "TripsContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data: \(error)")
            }
        }
        fetchTrips()
    }
    
    func fetchTrips() {
        let request = NSFetchRequest<TripEntity>(entityName: "TripEntity")
        
        do {
            savedTrips = try container.viewContext.fetch(request)
        } catch let error {
           print("Error fetching. \(error)")
        }
        
    }
    
    /* This function initializes a new TripEntity and adds it to savedTrips. The parameter, wmataLink, represents the hyperlink of the webpage, represented as a String. This hyperlink provides specifications of all of the required properties, but needs to be parsed to identify such fields. Logic is involved in doing so. */
    func addTrip(wmataLink: String) {
        let newTrip = TripEntity(context: container.viewContext) // Trip to be added to savedTrips
        
        let components = wmataLink.components(separatedBy: "&") /* Separates the String into an array of the form:
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
        
        // Beginning to parse the components array to identify and format all the fields
        
        // Removing all of the identifier text (ex. "arrdep-trip-planner=D" -> "D")
        var data = [String]()
        for string in components {
            let startIdx = string.index(string.firstIndex(of: "=")!, offsetBy: 1) // substring starts after "="
            data.append(String(string[startIdx..<string.endIndex]))
        }
        
        
        /* Starting Location and Destination:
        Replacing "+" delimiter with a space and making title case. */
        // %26 = &, %27 = ', %7C = |
        newTrip.loc = data[3].replacingOccurrences(of: "+", with: " ").capitalized + " to " + data[4].replacingOccurrences(of: "+", with: " ").capitalized
        
        /* Time and Date:
         Formating time as "8:11" and date as "8/11" */
        let time = data[7] + ":" + data[8] + " " + data[9]
        let date = data[10] + "/" + data[11]
        
        /* ArrDep
         Phrasing the selections by adding date, and time where relevant */
        if (data[6] == "D") { // "D" corresponds to the "Leave at" selection
            newTrip.arrDep = "Leaving at \(time) on \(date)"
        } else if (data[6] == "A") {  // "A" corresponds to the "Arrive by" selection
            newTrip.arrDep = "Arriving by \(time) on \(date)"
        } else if (data[6] == "F") {  // "F" corresponds to the "Earliest Trip" selection
            newTrip.arrDep = "Earliest trip on \(date)"
        } else if (data[6] == "L") { // "L" corresponds to the "Last Trip" selection
            newTrip.arrDep = "Last trip on \(date)"
        } else {
            newTrip.arrDep = "ERROR"
        }
        

        /* travelBy: */
        if (data[5] == "BCFKLRSTX123") { // Corresponds to the "Travel by rail and bus: selection
            newTrip.travelBy = "rail and bus"
        } else if (data[5] == "BKX") { // Corresponds to the "Travel by bus: selection
            newTrip.travelBy = "bus"
        } else if (data[5] == "") { // Corresponds to the "Travel by rail" selection
            newTrip.travelBy = "rail"
        } else {
            newTrip.travelBy = "ERROR"
        }
        
        
        /* chosenRoute */
        if (data[12] == "T") { // "T" corresponds to "Gets me there first"
            newTrip.chosenRoute = "earliest arrival time"
        } else if (data[12] == "W") { // "W"  corresponds to "least walking"
            newTrip.chosenRoute = "least walking"
        } else if (data[12] == "X"){ // "X" corresponds to "fewest transfers"
            newTrip.chosenRoute = "fewest transfers"
        } else {
            newTrip.chosenRoute = "ERROR"
        }
        
        // Double value; no parsing needed (" miles" added in planner view)
        newTrip.walkMax = data[13]
        
        newTrip.wmataLink = wmataLink
        
        newTrip.id = UUID()
        
        savedTrips.append(newTrip) // Adding to trips array
        saveData() // Persisting this data
    }
    
    // Removes the TripEntity at the given index in savedTrips. Updates savedTrips to reflects this change.
    func deleteTrip(indexSet: IndexSet) {
        guard let index = indexSet.first else { return } // Becuase we know this array will always be size 1
        let trip = savedTrips[index]
        container.viewContext.delete(trip)
        saveData()
    }
    
    // Updates savedTrips to reflect any added/removed TripEntity objects.
    func saveData() {
        do {
            try container.viewContext.save()
            fetchTrips()
        } catch let error {
            print("Error saving \(error)")
        }
    }
}

// https://www.youtube.com/watch?v=nwpmWu1SP1k&list=PLwvDm4VfkdpheGqemblOIA7v3oq0MS30i&index=4&ab_channel=SwiftfulThinking
