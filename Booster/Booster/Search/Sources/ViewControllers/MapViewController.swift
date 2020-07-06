//
//  MapViewController.swift
//  Booster
//
//  Created by 노한솔 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let mapView = NMFMapView(frame: view.frame)
      let marker1 = NMFMarker()
      marker1.position = NMGLatLng(lat: 37.495882759889525, lng: 126.95779727139859)
      marker1.mapView = mapView
      
      let infoWindow = NMFInfoWindow()
      let dataSource = NMFInfoWindowDefaultTextSource.data()
      dataSource.title = "숭실대학교"
      infoWindow.dataSource = dataSource
      
      infoWindow.open(with: marker1)
      
      let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.495882759889525, lng: 126.95779727139859))
      mapView.moveCamera(cameraUpdate)
      
      view.addSubview(mapView)
      
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
