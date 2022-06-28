//
//  ContentModel.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-10.
//

import Foundation
import CoreLocation

class ContentModel : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    var currentCategory = ""
    var locationManager = CLLocationManager()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var latData: CLLocationDegrees
    @Published var lonData: CLLocationDegrees
    @Published var restaurants = [Business]()
    @Published var arts = [Business]()
    
    
    var remoteDataUrl: String = ""
    var session: URLSession = URLSession.shared
    
    override init() {
        
        latData = 0
        lonData = 0
        super.init()
        // Request permission from the user
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        
        // Start geolocating the user, only after getting permission
        //locationManager.startUpdatingLocation()
        
    }
    
    func isAuthorized() -> Bool {
        if (locationManager.authorizationStatus == CLAuthorizationStatus.authorizedAlways ||
            locationManager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse) {
            return true
        }
        if (locationManager.authorizationStatus == .notDetermined) {
            return false
        }
        return false
    }
    
    
    // Mark - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        self.authorizationState = locationManager.authorizationStatus
        
        if locationManager.authorizationStatus == CLAuthorizationStatus.authorizedAlways ||
            locationManager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse {
            
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == CLAuthorizationStatus.denied {
            // We don't have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Gives us the location of the user
        self.latData = locations.first?.coordinate.latitude ?? 0
        self.lonData = locations.first?.coordinate.longitude ?? 0
        
        // Stop requesting the location after we get it once
        if let locater = locations.first {
            locationManager.stopUpdatingLocation()
            
            // todo: if we have the coordinates of the user, send into the Yelp API
            self.getBusinesses(category: Constants.Arts, location: locater)
            self.getBusinesses(category: Constants.Restaurants, location: locater)
        }
        
        
    }
    
    func getBusinesses(category: String, location: CLLocation) {
        self.getRemoteData(category: category, location: location)
    }
    
    func getRemoteData(category: String, location: CLLocation)  {
        var urlComponents = URLComponents(string: Constants.Url)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: Constants.Limit),
        ]

                                          
        if let urlThing = urlComponents?.url {
            var request = URLRequest(url: urlThing, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
            request.addValue(Keys.API_KEY, forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"

            let dataTask = self.session.dataTask(with: request) { (data, response, error) in
                self.currentCategory = category
                self.responseHandler(data: data, response: response, error: error)
            }
            dataTask.resume()
        }
        



    }
    
    
    func responseHandler(data:Data?, response: URLResponse?, error: Error?)  {
        
        if (error == nil && data != nil) {
        
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(BusinessSearch.self, from: data!)

                var businesses = response.businesses
                businesses.sort {
                    (b1, b2) -> Bool in
                    return b1.distance ?? 0 < b2.distance ?? 0
                }
                DispatchQueue.main.async {
                    switch self.currentCategory {
                        case Constants.Restaurants:
                            self.restaurants = businesses
                        case Constants.Arts:
                            self.arts = businesses
                    default:
                        break
                    }
                    
                }
                
                
            }
            catch {
                print(error)
            }
            
        }
    }
    
}
