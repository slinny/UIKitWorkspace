//
//  MapViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 6/24/24.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        mapView.frame = view.bounds
        
        // Set the delegate and request location access
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        // Check if location services are enabled
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        } else {
            print("Location services are not enabled")
        }
        
        // Show user location on the map
        mapView.showsUserLocation = true
        
        // Add zoom buttons
        setupZoomButtons()
    }
    
    func setupZoomButtons() {
        let zoomInButton = UIButton(type: .system)
        zoomInButton.setTitle("+", for: .normal)
        zoomInButton.addTarget(self, action: #selector(zoomIn), for: .touchUpInside)
        zoomInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zoomInButton)
        
        let zoomOutButton = UIButton(type: .system)
        zoomOutButton.setTitle("-", for: .normal)
        zoomOutButton.addTarget(self, action: #selector(zoomOut), for: .touchUpInside)
        zoomOutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zoomOutButton)
        
        // Add Auto Layout constraints
        NSLayoutConstraint.activate([
            zoomInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            zoomInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            zoomOutButton.bottomAnchor.constraint(equalTo: zoomInButton.topAnchor, constant: -10),
            zoomOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    @objc func zoomIn() {
        var region = mapView.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        mapView.setRegion(region, animated: true)
    }
    
    @objc func zoomOut() {
        var region = mapView.region
        region.span.latitudeDelta *= 2.0
        region.span.longitudeDelta *= 2.0
        mapView.setRegion(region, animated: true)
    }
    
    func loadData() {
        // Implement any additional data loading if needed
    }
    
    // CLLocationManagerDelegate method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        // Stop updating location to save battery life
        locationManager.stopUpdatingLocation()
        
        // Center the map on the user's location
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        // Add a pin at the user's location
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = "You are here"
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle error appropriately
        print("Failed to get user location: \(error.localizedDescription)")
        if let clError = CLError.Code(rawValue: (error as NSError).code) {
            switch clError {
            case .denied:
                print("Location access denied by user")
            case .locationUnknown:
                print("Location data unavailable")
            default:
                print("Location error: \(clError)")
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mapView.frame = view.bounds
    }
}


