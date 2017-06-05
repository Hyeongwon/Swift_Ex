//
//  ViewController.swift
//  Mission_08
//
//  Created by byunhyeongwon on 2017. 6. 5..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{

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
        
        // 정확도 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // 위치데이터를 추적하기 위해 사용자에게 승인 요구
        locationManager.requestWhenInUseAuthorization();
        
        // 위치 업데이트 시작
        locationManager.startUpdatingLocation();
        
        // 위치 보기 설정
        myMap.showsUserLocation = true;
        
        
    }
    
    // 위도, 경도, 스팬을 입력받아 지도에 표시
    func goLocation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D {
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue);
        let spanValue = MKCoordinateSpanMake(span, span);
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue);
        myMap.setRegion(pRegion, animated: true);
        return pLocation;
    }
    
    // 특정 위도와 경도에 핀 설치하고 핀에 타이틀과 서브 타이틀의 문자열 표시
    func setAnnotation(latitude latitudeValue : CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span : Double, title strTitle: String, subtitle strSubtitle:String) {
        
        let annotation = MKPointAnnotation();
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span);
        annotation.title = strTitle;
        annotation.subtitle = strSubtitle;
        myMap.addAnnotation(annotation);
    }
    
    //위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last;
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01);
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler:
        {
            (placemarks, error) -> Void in
            let pm = placemarks!.first;
            let country = pm!.country;
            var address:String = country!
            
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!;
            }
            
            self.lblLocationInfo1.text = "현재위치"
            self.lblLocationInfo2.text = address;
        })
        
        locationManager.stopUpdatingLocation();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
        
            self.lblLocationInfo1.text = " ";
            self.lblLocationInfo2.text = " ";
            locationManager.startUpdatingLocation();
            
        } else if sender.selectedSegmentIndex == 1 {
            
            setAnnotation(latitude: 37.751853, longitude: 128.87605740000004, delta: 1, title: "폴리텍 대학교", subtitle: "강원도 강릉시 남산초교길 121");
            self.lblLocationInfo1.text = "보고계신 위치";
            self.lblLocationInfo2.text = "폴리텍 대학교";
            
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitude: 37.751853, longitude: 128.87605740000004, delta: 0.1, title: "폴리텍 대학교", subtitle: "강원도 강릉시 남산초교길 121");
            self.lblLocationInfo1.text = "보고계신 위치";
            self.lblLocationInfo2.text = "폴리텍 대학교";
            
        } else if sender.selectedSegmentIndex == 3 {
            setAnnotation(latitude: 37.751853, longitude: 128.87605740000004, delta: 1, title: "폴리텍 대학교", subtitle: "강원도 강릉시 남산초교길 121");
            self.lblLocationInfo1.text = "보고계신 위치";
            self.lblLocationInfo2.text = "폴리텍 대학교";
            
        }
    }

}

