//
//  BusinessRow.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-21.
//

import SwiftUI
import UIKit

struct BusinessRow: View {
    var business: Business
    @ObservedObject var dataService = DataService()
    
    
    var body: some View {

        VStack {
            HStack {

                if (getImage() != nil) {
                    Image(uiImage: getImage()!)
                        .resizable()
                        .frame(width: 58, height: 58, alignment: .center)
                        .cornerRadius(5)
                        .scaledToFit()
                }
                VStack(alignment: .leading) {
                    // Name and Distance
                    Text(business.name ?? "unknown..").bold()
                    Text(" \((business.distance ?? 0)/1000, specifier: "%.2f") kms away").font(.caption)
                }
                
                Spacer()
                
                VStack(alignment:.leading) {
                    Image("regular_\(business.rating ?? 0)")
                    Text("\(business.reviewCount ?? 0) reviews.").font(.caption)
                }
                
            }
            Divider()
        }
    }
    
    func getImage() -> UIImage? {
        

        dataService.getCurrentIcon(imageUrl: business.imageUrl!)

        return dataService.yelpImage
    }
}


