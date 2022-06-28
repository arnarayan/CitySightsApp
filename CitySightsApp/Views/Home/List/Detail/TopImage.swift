//
//  TopImage.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-28.
//

import SwiftUI

struct TopImage: View {
    
    var business: Business
    @ObservedObject var dataService = DataService()
    
    
    var body: some View {
        GeometryReader { geo in
            if (getImage() != nil) {
                Image(uiImage: getImage()!)
                    .resizable()
                    .clipped()
                    .scaledToFill()
                    .frame(width:geo.size.width, height:geo.size.height)
                    
            }
        }
        

    }
    
    func getImage() -> UIImage? {
        

        dataService.getCurrentIcon(imageUrl: business.imageUrl!)

        return dataService.yelpImage
    }
}


