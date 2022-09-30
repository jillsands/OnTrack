//
//  MinuteView.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/11/22.
//

import SwiftUI

struct MinuteView: View {
    @ObservedObject var data = DataFetching()
    var body: some View {
        List(data.dataList) { x in
            VStack {
                ForEach(x.trains!, id: \.self) { train in
                    Text(train.Line!)
                    Text(train.LocationName!)
                    Text(train.Mins!)
                }
            }
        }
    }
}

struct MinuteView_Previews: PreviewProvider {
    static var previews: some View {
        MinuteView()
    }
}
