//
//  HomeView.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-18.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if (viewModel.restaurants.count != 0 || viewModel.arts.count != 0){
            NavigationView {
                // Determine if we should show list or map
                if (!self.isMapShowing) {
                    VStack(alignment: .leading) {
                        HStack() {
                            Image(systemName: "location")
                            Text("San Fransciso")
                            Spacer()
                            Button(action: {
                                self.isMapShowing = true
                            }, label: {
                                Text("Switch to map view.")
                            })
                        }
                        Divider()
                        VStack(alignment: .leading) {
                            BusinessList()
                        }
                    }.navigationBarHidden(true)
                }else {
                    BusinessMapView().ignoresSafeArea()                }
            }

                
        }else {
            ProgressView()
        }
        
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
