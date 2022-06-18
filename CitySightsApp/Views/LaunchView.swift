//
//  ContentView.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-10.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var viewModel: ContentModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        Text("\(viewModel.latData)")
        Text("\(viewModel.lonData)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView().environmentObject(ContentModel())
    }
}
