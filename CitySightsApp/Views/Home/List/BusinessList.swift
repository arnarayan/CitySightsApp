//
//  BusinessList.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-20.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var viewModel: ContentModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment:.leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSection(businesses: viewModel.restaurants, sectionTitle: "Restaurants")
                BusinessSection(businesses: viewModel.arts, sectionTitle: "Arts")
                


            }.padding()
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
