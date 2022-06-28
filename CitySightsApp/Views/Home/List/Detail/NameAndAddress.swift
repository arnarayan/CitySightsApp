//
//  NameAndAddress.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-27.
//

import SwiftUI

struct NameAndAddress: View {
    
    var business: Business
    
    var body: some View {
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
            Image(systemName: "heart.fill")
            
        }.padding()
        Divider()
    }
}


