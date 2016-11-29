//
//  GMapViewController.swift
//  MatZyp
//
//  Created by User on 2016. 11. 19..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class GMapViewController: UIViewController, GMSMapViewDelegate, UISearchBarDelegate, LocateOnTheMap, GMSAutocompleteFetcherDelegate{

    /**
     * Called when an autocomplete request returns an error.
     * @param error the error that was received.
     */
    public func didFailAutocompleteWithError(_ error: Error) {
        //        resultText?.text = error.localizedDescription
    }
    
    /**
     * Called when autocomplete predictions are available.
     * @param predictions an array of GMSAutocompletePrediction objects.
     */
    public func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
        //self.resultsArray.count + 1
        
        for prediction in predictions {
            
            if let prediction = prediction as GMSAutocompletePrediction!{
                self.resultArray.append(prediction.attributedFullText.string)
            }
        }
        self.searchResultController.reloadDataWithArray(self.resultArray)
        //   self.searchResultsTable.reloadDataWithArray(self.resultsArray)
        print(resultArray)
    }
    
    
    var searchResultController : SearchResultsController!
    var resultArray = [String]()
    var gmsFetcher: GMSAutocompleteFetcher!
    
    @IBAction func searchWithAddress(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: searchResultController)
        searchController.searchBar.delegate = self
        self.present(searchController, animated: true, completion: nil)
    }
    
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        searchResultController = SearchResultsController()
        searchResultController.delegate = self
        gmsFetcher = GMSAutocompleteFetcher()
        gmsFetcher.delegate = self
    }
    
    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String) {
        
        
        
        DispatchQueue.main.async { () -> Void in
            
            //let position = CLLocationCoordinate2DMake(lat, lon)
            //let marker = GMSMarker(position: position)
            
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 17)
            //self.googleMapsView.camera = camera
            let foundView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            self.view = foundView
            
            //marker.title = "Address : \(title)"
            //marker.map = self.googleMapsView
            
        }
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //let previous = storyboard.instantiateViewController(withIdentifier: "MatZypListView") as! MatZypListViewController
        let vc = storyboard.instantiateViewController(withIdentifier: "SegViewControllerID") as! SegViewController
        
        let selectedIndex:Int = marker.userData as! Int
        let location = dataCenter.locations[selectedIndex] as Location
        let setting = dataCenter.setting as Setting
        let matzyp = location.matzyps?[selectedIndex]

        //previous.location = location
        //previous.setting = setting
        vc.matzyp = matzyp
        vc.setting = setting
        //self.navigationController!.pushViewController(previous, animated: true)
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //        let placeClient = GMSPlacesClient()
        //
        //
        //        placeClient.autocompleteQuery(searchText, bounds: nil, filter: nil)  {(results, error: Error?) -> Void in
        //           // NSError myerr = Error;
        //            print("Error @%",Error.self)
        //
        //            self.resultsArray.removeAll()
        //            if results == nil {
        //                return
        //            }
        //
        //            for result in results! {
        //                if let result = result as? GMSAutocompletePrediction {
        //                    self.resultsArray.append(result.attributedFullText.string)
        //                }
        //            }
        //
        //            self.searchResultController.reloadDataWithArray(self.resultsArray)
        //
        //        }
        
        
        self.resultArray.removeAll()
        gmsFetcher?.sourceTextHasChanged(searchText)
        
        
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
