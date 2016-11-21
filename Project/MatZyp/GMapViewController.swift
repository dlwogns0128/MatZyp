//
//  GMapViewController.swift
//  MatZyp
//
//  Created by User on 2016. 11. 19..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit
import GoogleMaps

class GMapViewController: UIViewController, GMSMapViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        GMSServices.provideAPIKey("AIzaSyCG-ZjlJaZK64zDyb2rGQ8eIgNs2DlhbPs")
        let camera = GMSCameraPosition.camera(withLatitude: 37.558814, longitude: 127.040152, zoom: 12)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.delegate = self
        self.view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(37.558814, 127.040152)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "알촌"
        marker.userData = 1
        marker.map = mapView
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc : UITabBarController = storyboard.instantiateViewController(withIdentifier: "MatZypTabController") as! UITabBarController
        
        let selectedIndex:Int = marker.userData as! Int
        let location = dataCenter.locations[selectedIndex] as Location
        let setting = dataCenter.setting as Setting
        let matzyp = location.matzyps?[selectedIndex]
        
        guard let info_tab = vc.viewControllers?[0] as? InfoListViewController,
            let menu_tab = vc.viewControllers?[1] as? MenuListViewController,
            let review_tab = vc.viewControllers?[2] as? ReviewTableViewController else {
                return
        }
        
        info_tab.matzyp = matzyp
        info_tab.setting = setting
        
        menu_tab.matzyp = matzyp
        menu_tab.setting = setting
        
        review_tab.matzyp = matzyp
        review_tab.setting = setting
        
        self.present(vc, animated: true, completion: nil)
        
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
