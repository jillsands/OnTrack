//
//  MetroFeed.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/8/22.
//

import Foundation

struct MetroFeed: Codable, Identifiable {
    var trains: [Train]?
    var id = UUID()
    
}

