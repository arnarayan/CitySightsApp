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
    @State var selectedBusiness: Business?
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
                    ZStack(alignment: .top) {
                        BusinessMapView(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item:$selectedBusiness) { business in
                                BusinessDetail(business: business)
                            }
                        ZStack {
                            RectangleCard(color: Color.white).frame(height: 100)
                            HStack {
                                Image(systemName: "location")
                                Text("Waterloo, ON")
                                Spacer()
                                Button(action: {
                                    self.isMapShowing = false
                                }, label: {
                                    Text("Switch to list view.")
                                })
                            }.font(.footnote).padding([.leading, .trailing], 50)
                        }
                        
                        
                    }.navigationBarHidden(true)

                    
                }
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
