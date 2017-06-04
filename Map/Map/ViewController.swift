//
//  ViewController.swift
//  Map
//
//  Created by byunhyeongwon on 2017. 6. 4..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblLocationInfo1.text = "";
        lblLocationInfo2.text = "";
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestWhenInUseAuthorization();
        locationManager.startUpdatingLocation();
        myMap.showsUserLocation = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goLocation(latitude latitudeValue : CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D {
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue);
        let sapnValue = MKCoordinateSpanMake(span, span);
        let pRegion = MKCoordinateRegionMake(pLocation, sapnValue);
        myMap.setRegion(pRegion, animated: true);
        
        return pLocation;
    }
    
    func setAnnotation(latitude latitudeValue : CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span : Double, title strTitle: String, subtitle strSubTitle: String) {
        
        let annotation = MKPointAnnotation();
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span);
        
        annotation.title = strTitle;
        annotation.subtitle = strSubTitle;
        
        myMap.addAnnotation(annotation);
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last;
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01);
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first;
            let country = pm!.country;
            var address:String = country!;
            if pm!.locality != nil {
                
                address += " ";
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address;
        })
        
        locationManager.stopUpdatingLocation();
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
            self.lblLocationInfo1.text = "";
            self.lblLocationInfo2.text = "";
            locationManager.stopUpdatingLocation();
        } else if sender.selectedSegmentIndex == 1 {
            
            setAnnotation(latitude: 37.751853, longitude: 128.876055740000004, delta: 1, title: "강릉 폴리텍", subtitle: "강원도 강릉시 남산초교길 121");
            self.lblLocationInfo1.text = "보고 계신 위치";
            self.lblLocationInfo2.text = "강릉 폴리텍";
            
        } else if sender.selectedSegmentIndex == 2 {
            
            setAnnotation(latitude: 37.5307871, longitude: 126.8981, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 영등포구 당산로 41길 11");
            self.lblLocationInfo1.text = "보고 계신 위치";
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사";
            
        }
    }


}

