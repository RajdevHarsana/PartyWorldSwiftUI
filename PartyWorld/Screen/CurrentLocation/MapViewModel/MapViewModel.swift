//
//  MapViewModel.swift
//  PartyWorld
//
//  Created by Rajesh gurjar on 07/06/22.
//
import MapKit
import CoreLocation

enum MapDetils{
    static let startingLocation = CLLocationCoordinate2D(latitude: 26.825140, longitude: 75.807540)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class MapViewModel: NSObject , ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetils.startingLocation, span: MapDetils.defaultSpan)
    
    var locationManager : CLLocationManager?
    var locationName = String()
    var latitude = Double()
    var longitude = Double()
    
    func checkIfLocationServicesEnable(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager!.startUpdatingLocation()
        }else{
            print("Turn on Location")
        }
    }
    
    func requestAllowOnceLocationPermission(){
        locationManager?.requestLocation()
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location is Restricted")
        case .denied:
            print("Location is Denied")
        case .authorizedAlways , .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetils.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else{
            //show an error
            return
            
        }
        locationManager?.stopUpdatingLocation()
        let lat = String(latestLocation.coordinate.latitude)
        let long = String(latestLocation.coordinate.longitude)
        getAddressFromLatLon(pdblLatitude: lat, withLongitude: long)
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MapDetils.defaultSpan)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
            let lat: Double = Double("\(pdblLatitude)")!
            //21.228124
            let lon: Double = Double("\(pdblLongitude)")!
            //72.833770
            let ceo: CLGeocoder = CLGeocoder()
            center.latitude = lat
            center.longitude = lon

            let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


            ceo.reverseGeocodeLocation(loc, completionHandler:
                {(placemarks, error) in
                    if (error != nil)
                    {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    }
                    let pm = placemarks! as [CLPlacemark]

                    if pm.count > 0 {
                        let pm = placemarks![0]
                        print(pm.country ?? "")
                        print(pm.locality ?? "")
                        print(pm.subLocality ?? "")
                        print(pm.thoroughfare ?? "")
                        print(pm.postalCode ?? "")
                        print(pm.subThoroughfare ?? "")
                        var addressString : String = ""
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + ", "
                        }
                        if pm.thoroughfare != nil {
                            addressString = addressString + pm.thoroughfare! + ", "
                        }
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + ", "
                        }
                        if pm.country != nil {
                            addressString = addressString + pm.country! + ", "
                        }
                        if pm.postalCode != nil {
                            addressString = addressString + pm.postalCode! + " "
                        }


                        print(addressString)
                        self.locationName = addressString
                  }
            })

        }
    
}
