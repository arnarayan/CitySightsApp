//
//  BusinessSectionHeader.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-20.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    var color: Color
    
    var body: some View {
        ZStack(alignment:.leading) {
            Rectangle().foregroundColor(color)
            Text(title)
                .font(.headline)
                .padding(.bottom, 5.0)
        }

    }
}


