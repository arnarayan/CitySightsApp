//
//  LocationDeniedView.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-30.
//

import SwiftUI

struct LocationDeniedView: View {

    
    private let turquoise = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        VStack {
            Spacer()
            Text("Whoops!").bold().foregroundColor(.white)
            Text("We need to access your location to provide you with the best sights in the city.  You can change your decision at anytime in Settings.")
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                let url = URL(string: UIApplication.openSettingsURLString)!
                UIApplication.shared.open(url)
            }, label: {
                ZStack {
                    Rectangle().padding().foregroundColor(Color.white)
                        .cornerRadius(30)
                        .shadow(color: .gray, radius: 10)
                        .padding().frame(height: 100)
                    Text("Go to Settings")
                        .foregroundColor(turquoise).bold()
                }
            })
            Spacer()
        }.ignoresSafeArea(.all).background(turquoise)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
