//
//  Routes.swift
//  OnTrack
//
//  Created by Jillian Sands on 7/30/22.
//

import Foundation
import SwiftUI

struct Route:Identifiable, Hashable{
    var id: Int
    var title: String
    var color: Color
    var imageName: String // also functions as a String version of the routes name
    var isFav: Bool
    var stops: [Station]
    
    // Hashable Functons
    static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.title == rhs.title && lhs.color == rhs.color
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(title)
           hasher.combine(color)
    }
}

var routesData = [
    
    Route(id: 0, title: "Glenmont / Shady Grove", color: Color.red, imageName: "Red", isFav: false,
          stops: [glenmont, wheaton, forestGlen, silverSpring, takoma, fortTotten, brookland, rh, noma, union, jud, gallery, metro, farragutN, dupont, woodley, cleveland, friendship, bethesda, medical, grosvenor, whiteFlint, twinbrook, rockville]),
    Route(id: 1, title: "Huntington / Greenbelt ", color: Color.yellow, imageName: "Yellow", isFav: false,
          stops: [greenbelt, cp, pgPlaza, hyattsville, fortTotten, georgia, columbia, uSt, shaw, mtVernon, gallery, archives, lenfant, pentagon, pentagonCity, crystal, dca, braddock, kingSt, eisenhower, huntington]),
    Route(id: 2, title: "Branch Ave / Greenbelt", color: Color.green, imageName: "Green", isFav: false,
          stops: [greenbelt, cp, pgPlaza, hyattsville, fortTotten, georgia, columbia, uSt, shaw, mtVernon, gallery, archives, lenfant, waterfront, navyYard, anacostia, congress, southern, naylor, suitland, branch]),
    Route(id: 3, title: "New Carollton / Vienna", color: Color.orange, imageName: "Orange", isFav: false,
          stops: [vienna, dunn, wFallsChurch, eFallsChurch, ballston, vaSq, clarendon, court, rosslyn, gwu, farragutW, mcpherson, metro, fedTri, smithsonian, lenfant, fedCent, capitolS, easternMarket, potomac, stadium, minnesota, deanwood, cheverly, landover, newCarollton]),
    Route(id: 4, title: "Wiehle-Reston East / Largo Town Center", color: Color.gray, imageName: "Silver", isFav: false,
          stops: [wiehle, springHill, greensboro, tysons, mclean, eFallsChurch, ballston, vaSq, clarendon, court, rosslyn, gwu, farragutW, mcpherson, metro, fedTri, smithsonian, lenfant, fedCent, capitolS, easternMarket, potomac, stadium, benning, capitolH, addison, morgan, largo]),
    Route(id: 5, title: "Franconia-Springfield / Largo Town Center", color: Color.blue, imageName: "Blue", isFav: false,
          stops: [franconia, vanDorn, kingSt, braddock, dca, crystal, pentagonCity, pentagon, arlington, gwu, farragutW, mcpherson, metro, fedTri, smithsonian, lenfant, fedCent, capitolS, easternMarket, potomac, stadium, benning, capitolH, addison, morgan, largo])
]
