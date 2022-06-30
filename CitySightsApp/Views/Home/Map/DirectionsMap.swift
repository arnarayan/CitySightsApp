//
//  DirectionsMap.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-29.
//

import SwiftUI
import MapKit


struct DirectionsMapView: UIViewRepresentable {

    
    
    @EnvironmentObject var viewModel: ContentModel
    var business: Business
    
    var start: CLLocationCoordinate2D {
        return viewModel.locationManager.location?.coordinate ?? CLLocationCoordinate2D()
    }
    
    var end:CLLocationCoordinate2D {
        if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
            return CLLocationCoordinate2D(latitude: lat, longitude: long)
        }else {
            return CLLocationCoordinate2D()
        }
    }

    
    func updateUIView(_ uiView: MKMapView, context: Self.Context) {

        
        
    }
 
    // Create and configure the map view element.
    func makeUIView(context: Self.Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: end))

        let directions = MKDirections(request: request)
        // TODO: Set the region
        directions.calculate { (response, error) in
            if (error == nil && response != nil) {
                for route in response!.routes {
                    mapView.addOverlay(route.polyline)
                    //mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                    mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100), animated: true)
                }
            }
        }
        let annotation = MKPointAnnotation()
        annotation.coordinate = end
        annotation.title  = business.name ?? ""
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.removeOverlays(uiView.overlays)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator : NSObject, MKMapViewDelegate {
        
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
            renderer.lineWidth = 5
            renderer.strokeColor = .blue
            return renderer
        }

    }
    
}
