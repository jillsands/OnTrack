//
//  DataFetching.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/11/22.
//

import Foundation

class DataFetching: ObservableObject {
    @Published var dataList = [MetroFeed]()
    
    init() {
    /*
     
     location=College+Park+Metro
     
     destination=L%27ENFANT+PLAZA
     
     travelby-trip-planner=BCFKLRSTX123 // travel by both: BCFKLRSTX123, bus: BKX, rail: CLR
     
     arrdep-trip-planner=D  // "Leave At": D, "Arrive By": A, "Earliest Trip": F, "Last Trip": A
     
     hour-leaving-trip-planner=1, minute-leaving-trip-planner=33, period-leaving-trip-planner=PM // For leave at and arrive by only
     
     month-leaving-trip-planner=8, day-leaving-trip-planner=11 // For leave at and arrive by only
     
     route-trip-planner=T // "Gets me there first" = T, "Least walking" = W, "Fewest Transfers" = X
     
     walk-distance-trip-planner=.75 // walk up to 3/4 mile
     
     ALLOW TO RELOAD W URL
     
        */
        let url = URL(string: "https://api.wmata.com/StationPrediction.svc/json/GetPrediction/{All}")

        guard url != nil else {
            return
        }

        let session = URLSession.shared
        session.setValue("{e13626d03d8e4c03ac07f95541b3091b}", forKey: "api_key")

        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // Check for erors
            if error == nil && data != nil {
                // Parse JSON
                let decoder = JSONDecoder()
                
                do {
                    let metroFeed = try decoder.decode(MetroFeed.self, from: data!)
                    print(metroFeed)
                }
                catch {
                    print("Error in JSON parsing")
                }
            }
        }

        // Make the API call
        dataTask.resume()
    }
    
}
