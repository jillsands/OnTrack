//
//  Database.swift
//  OnTrack
//
//  Created by Jillian Sands on 7/31/22.
//

import Foundation

final class Database {
    private let FAV_KEY = "fav key"
    
    func save(routes: Set<Int>) {
        let array = Array(routes)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
    }
}
