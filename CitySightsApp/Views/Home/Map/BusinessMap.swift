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
    @Binding var selectedBusiness: Business?
    
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
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // TODO: Set the region
        
        
        return mapView
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(vw: self)
    }
    
    class Coordinator : NSObject, MKMapViewDelegate {
        
        var mapsView: BusinessMapView
        
        init(vw: BusinessMapView) {
            self.mapsView = vw
        }
        
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            var annotationView: MKAnnotationView
            
            if annotation is MKUserLocation {
                return nil
            }
            
            
            if (mapView.dequeueReusableAnnotationView(withIdentifier: Keys.Business) == nil) {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Keys.Business)
                annotationView.canShowCallout = true
                annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Keys.Business)!
                annotationView.annotation = annotation
            }
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            // User tapped on the annotation view
            
            
            for business in mapsView.viewModel.restaurants + mapsView.viewModel.arts {
                if (business.name == view.annotation?.title) {
                    mapsView.selectedBusiness = business
                    break
                }

                
                
            }
            
            
        }
    }

}
