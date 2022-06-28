//
//  Section.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-20.
//

import SwiftUI

struct BusinessSection: View {
    
    @EnvironmentObject var viewModel: ContentModel
    var businesses: [Business]
    var sectionTitle: String
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: sectionTitle, color: Color.yellow)) {
                ForEach(self.businesses) { biz in
                    NavigationLink(destination: {
                        BusinessDetail(business: biz)
                    }, label: {
                        BusinessRow(business: biz)
                    })
                    
                }
            }

        }

    
}


