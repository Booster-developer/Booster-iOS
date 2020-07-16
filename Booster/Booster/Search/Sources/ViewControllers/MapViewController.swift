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
  var whereareyoufrom:Int = 0
  @IBOutlet weak var map: UIView!
  var storesinuniv:[StoreData] = []
  var storeXPos:[Double]=[]
  var storeYPos:[Double]=[]
  var getName:String = ""
  var storeX:Double = 0
  var storeY:Double = 0
  @IBOutlet weak var univName: UILabel!
  @IBAction func backBtn(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  override func viewDidLoad() {
    univName.text = getName
    super.viewDidLoad()
    print(whereareyoufrom)
    let mapView = NMFMapView(frame: view.frame)
    var markers = [NMFMarker()]
    if whereareyoufrom == 1{
    for i in 0..<storesinuniv.count{
      storeXPos.append(storesinuniv[i].store_x_location)
      storeYPos.append(storesinuniv[i].store_y_location)
      let marker = NMFMarker()
      marker.position = NMGLatLng(lat: storeXPos[i], lng: storeYPos[i])
      marker.mapView = mapView
      markers.append(marker)
      let infoWondow = NMFInfoWindow()
      let dataSource = NMFInfoWindowDefaultTextSource.data()
      dataSource.title = storesinuniv[i].store_name
      infoWondow.open(with: markers[i])
    }
      
      let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: storeXPos[0], lng: storeYPos[0]), zoomTo: 15)
      
      print(cameraUpdate)
           mapView.moveCamera(cameraUpdate)
    }
    else {
      let marker1 = NMFMarker()
      marker1.position = NMGLatLng(lat: storeX, lng: storeY)
      marker1.mapView = mapView
      let infoWindow = NMFInfoWindow()
      let dataSource = NMFInfoWindowDefaultTextSource.data()
      dataSource.title = getName
      infoWindow.dataSource = dataSource
      
      infoWindow.open(with: marker1)
      
      let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: storeX, lng: storeY), zoomTo: 15)
      mapView.moveCamera(cameraUpdate)
    }
    map.addSubview(mapView)
      //view.addSubview(mapView)
      
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
