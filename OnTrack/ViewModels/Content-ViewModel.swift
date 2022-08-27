//
//  Content-ViewModel.swift
//  OnTrack
//
//  Created by Jillian Sands on 7/31/22.
//

import Foundation
import SwiftUI

extension RoutesView {
    final class RouteViewModel: ObservableObject {
        @Published var routes = [Route]()
        @Published var showingFavs = false
        @Published var favRoutes: Set<Int>
        
        var filteredRoutes: [Route] {
            if showingFavs {
                return routes.filter { favRoutes.contains($0.id) }
            } else {
                return routes
            }
        }
        
        private var database = Database()
        
        init() {
            self.favRoutes = database.load()
            self.routes = routesData
        }
        
        func toggleView() {
            withAnimation {
                showingFavs.toggle()
            }
        }
        
        func contains (_ route: Route) -> Bool {
            favRoutes.contains(route.id)
        }
        
        func toggleFav(route: Route) {
            if(contains(route)) {
                favRoutes.remove(route.id)
            } else {
                favRoutes.insert(route.id)
            }
            database.save(routes: favRoutes)
        }
    }
}
