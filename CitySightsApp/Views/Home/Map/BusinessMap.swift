//
//  BusinessMap.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-28.
//


import SwiftUI
import MapKit

struct BusinessMapView: UIViewRepresentable {
    
    @EnvironmentObject var viewModel: ContentModel
    
    var location: [MKPointAnnotation] {
    
        var annotations = [MKPointAnnotation]()
        
        // Create a set of annotations from our list of businesses
        
        for business in viewModel.restaurants + viewModel.arts {
            let a = MKPointAnnotation()
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                annotations.append(a)
            }

            
            
        }
        return annotations
    }
    
    
    func updateUIView(_ uiView: MKMapView, context: Self.Context) {
        // Update the element if needed.
        
        // remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        // add the ones based on the business
        //uiView.addAnnotations(self.location)
        uiView.showAnnotations(self.location, animated: true)
        
        
    }
 
    // Create and configure the map view element.
    func makeUIView(context: Self.Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // TODO: Set the region
        
        
        return mapView
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }

}
