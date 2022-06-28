//
//  RowDivider.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-27.
//

import SwiftUI

struct RowDivider: View {
    
    var leftLabel: String
    var leftContent: String
    var rightLabel: String
    var rightContent: String
    
    var body: some View {
        HStack {
            Text("\(leftLabel)").bold()
            Text("\(leftContent)").lineLimit(1)
            Spacer()
            Link(rightLabel, destination: URL(string: rightContent)!)
        }.padding()
        Divider()
    }
}

