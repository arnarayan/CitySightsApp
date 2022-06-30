//
//  OnboardingView.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-29.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var selectedIndex = 0
    @EnvironmentObject private var viewModel: ContentModel
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    var body: some View {
        VStack(spacing:0) {
            TabView(selection: $selectedIndex) {
                ZStack {
                    Rectangle().foregroundColor(blue)
                    VStack {
                        Image("city2").resizable().frame(width: 300, height: 300)
                        Text("Welcome to the City Sights!").foregroundColor(Color.white).font(Font.custom("Avenir Heavy", size: 16))
                        Text("City Sights helps you find the best of the city!").foregroundColor(Color.white).font(Font.custom("Avenir Heavy", size: 10))
                            .multilineTextAlignment(.center)
                    }
                    

                }.tag(0).background(blue)
                ZStack {
                    Rectangle().foregroundColor(turquoise)
                    VStack {
                        Image("city1").resizable().frame(width: 300, height: 300)
                        Text("Ready to discover your city?").foregroundColor(Color.white).font(Font.custom("Avenir Heavy", size: 16))
                        Text("We'll show you the best restaurants, venues and more, based on your location!").foregroundColor(Color.white).font(Font.custom("Avenir Heavy", size: 10)).multilineTextAlignment(.center)
                    }
                   
                }.tag(1).background(turquoise)
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

            Button(action: {
                if (selectedIndex == 0) {
                    selectedIndex = 1
                }else if (selectedIndex == 1) {
                    viewModel.requestAuthoriztion()
                }
                    
            }, label: {
               
                ZStack {
                    Rectangle().padding().foregroundColor(Color.white)
                        .cornerRadius(30)
                        .shadow(color: .gray, radius: 10)
                        .padding().frame(height: 100)
                    if (selectedIndex==0) {
                        Text("Next").foregroundColor(blue).bold()
                    }else if(selectedIndex==1) {
                        Text("Get My Location").foregroundColor(turquoise).bold()
                    }
                }
            }).background(selectedIndex == 0 ? blue : turquoise)

            

        }.ignoresSafeArea(SafeAreaRegions.all)
            
    }
}


