//
//  RectangleCard.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-28.
//

import SwiftUI

struct RectangleCard: View {
    var color = Color.white
    
    
    var body: some View {
        Rectangle().padding().foregroundColor(color)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 10)
            .padding()
 
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
