//
//  GMapViewController.swift
//  MatZyp
//
//  Created by User on 2016. 11. 19..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit
import GoogleMaps

class GMapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        GMSServices.provideAPIKey("AIzaSyCG-ZjlJaZK64zDyb2rGQ8eIgNs2DlhbPs")
        let camera = GMSCameraPosition.camera(withLatitude: 37.558814, longitude: 127.040152, zoom: 12)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        self.view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(37.558814, 127.040152)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "알촌"
        marker.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
