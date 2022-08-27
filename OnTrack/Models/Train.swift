//
//  Train.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/11/22.
//

import Foundation

struct Train: Codable, Identifiable, Hashable {
    var id = UUID()
    var Destination: String? //     Abbreviated version of the final destination for a train. This is similar to what is displayed on the signs at stations.
    var Line: String? //     Two-letter abbreviation for the line (e.g.: RD, BL, YL, OR, GR, or SV). May also be blank or No for trains with no passengers
    var LocationName: String? // name of the station where the train is arriving. Useful when passing in All as the StationCodes parameter.
    var Mins: String? // Minutes until arrival. Can be a numeric value, ARR (arriving), BRD (boarding), ---, or empty
    
    // Hashable Functons
    static func == (lhs: Train, rhs: Train) -> Bool {
        return lhs.Destination == rhs.Destination && lhs.LocationName == rhs.LocationName
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(Destination)
           hasher.combine(LocationName)
    }
}
