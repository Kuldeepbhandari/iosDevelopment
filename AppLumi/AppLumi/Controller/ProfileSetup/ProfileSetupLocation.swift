//
//  ProfileSetupLocation.swift
//  AppLumi
//
//  Created by appinventiv on 07/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire

class ProfileSetupLocation: UIViewController,UISearchBarDelegate {
    
    @IBOutlet var searchText: UITextField!
    @IBOutlet var searchBarView: CustomView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var informationView: InformationView!
    @IBOutlet var setTitle: SetTitle!
    
    var latitude = CLLocationDegrees()
    var longtitude = CLLocationDegrees()
    
    //    MARK:Variables
    let locationManager = CLLocationManager()
    let regionInMeters : Double = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationManager()
        informationView.locationImage.image = #imageLiteral(resourceName: "icProfileSetupLocationActive")
    }
    
    
    //    MARK:This function is used to save the location on the server
    func sendLocationOfUser(completion:@escaping CompletionHandler){
        let body : [String:Any] = ["latitude":latitude,
                                   "longitude":longtitude
        ]
        AF.request(UPDATE_LOCATION_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                print(response.value)
                print("location is send to the user")
                completion(true)
            }else{
                debugPrint(response.error as Any)
                completion(false)
            }
        }
    }
    //    MARK:This function is used to setup location manager
    func setUpLocationManager(){
     //   locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
      //  locationManager.requestLocation()
    }
    
    //    MARK:This function is used to check the status of is user access the location service or not
    func checkLocationManager(){
        if CLLocationManager.locationServicesEnabled(){
            setUpLocationManager()
            checkLocationAuthorization()
        }else{
            //show an alert if user is denied
            
        }
    }
    //    MARK:This funtion is used to search location using entered text
    func searchLocation(){
        //crate an search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchText.text
        
        let activitySearch = MKLocalSearch(request: searchRequest)
        activitySearch.start { (response, error) in
            if response == nil{
                print("Error")
            }else{
                //Remove anonation
                for annotations in self.mapView.annotations{
                    self.mapView.removeAnnotation(annotations)
                }
                //Getting data
                self.latitude = response?.boundingRegion.center.latitude ?? 0.0
                self.longtitude = response?.boundingRegion.center.longitude ?? 0.0
                //                Create anonation
                let anonation = MKPointAnnotation()
                anonation.title = self.searchText.text
                anonation.coordinate = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longtitude)
                self.mapView.addAnnotation(anonation)
                // Zooming in coordinate
                let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2DMake(self.latitude, self.longtitude)
                let spain = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: spain)
                self.mapView.setRegion(region, animated: true)
                
            }
        }
    }
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
          //  locationManager.requestLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied,.restricted:
            let alertController = UIAlertController(title: "Location Acess Denied", message: "Lumi app needs your location to give know your location . open setting to change authorization", preferredStyle: .alert)
            let canelAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                alertController.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(canelAction)
            let openSetting = UIAlertAction(title: "Open", style: .default) { (action) in
                if let url = URL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            alertController.addAction(openSetting)
            present(alertController, animated: true, completion: nil)
            break
        case .authorizedAlways:
           // locationManager.requestLocation()
            break
        @unknown default:
            print("Fatral Error")
        }
    }
    
    @IBAction func nextBtnWasPressed(_ sender: UIButton) {
        print(longtitude)
        print(latitude)
        
        if latitude == 0.0 && longtitude == 0.0{
            let alert = UIAlertController(title: "Please Select Location on the map", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }else{
        sendLocationOfUser { (sucess) in
            if sucess{
                print("location is send")
                guard let answerVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileSetupBio_AnswerVC") as? ProfileSetupBio_AnswerVC else {return}
                       self.navigationController?.pushViewController(answerVC, animated: true)
            }
            }
        }
    }
    
    @IBAction func searchLocation(_ sender: UIButton) {
        searchLocation()
    }
}
//MARK mapView Function

extension ProfileSetupLocation:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pinAnnoation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "DropablePin")
        pinAnnoation.pinTintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        pinAnnoation.accessibilityLabel = searchText.text
        pinAnnoation.animatesDrop = true
        return pinAnnoation
    }
    
}


//extension ProfileSetupLocation:CLLocationManagerDelegate{
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error.localizedDescription)
//    }
//}
