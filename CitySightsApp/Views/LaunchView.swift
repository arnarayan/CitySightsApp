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
        
        // Detect the authorization status of geolocating the user
        if viewModel.authorizationState == .denied {
            LocationDeniedView()
            // if undetermined, show onboarding
        }else if !viewModel.isAuthorized() {
            OnboardingView()
        }
        
        else if viewModel.isAuthorized() {
            HomeView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView().environmentObject(ContentModel())
    }
}
