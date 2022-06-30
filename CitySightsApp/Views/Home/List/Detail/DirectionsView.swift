//
//  DirectionsView.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-29.
//

import SwiftUI

struct DirectionsView: View {
    var business: Business
    
    
    var body: some View {
        VStack(alignment: .leading) {
            // Business Title
            HStack {
                VStack(alignment: .leading) {
                    Text(business.name ?? "unknown..").bold().font(.largeTitle)
                    ForEach(business.location!.displayAddress!, id: \.self) { addr in
                        Text(addr)
                    }
                    
                    VStack(alignment:.leading) {
                        Image("regular_\(business.rating ?? 0)")
                        Text("\(business.reviewCount ?? 0) reviews.").font(.caption)
                    }
                }
                Spacer()
                if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude, let name = business.name {
                    Link("Open in maps", destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!)
                }
                
            }.padding()
            
            DirectionsMapView(business: business)
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}


