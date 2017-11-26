//
//  CheckInViewController.swift
//  Qrproject
//
//  Created by popmiiz on 10/31/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit
import MapKit

class CheckInViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.delegate = self
        let myLocation1 = MyAnnotation()
        //let myLocation1 = MKPointAnnotation()
            myLocation1.coordinate = CLLocationCoordinate2DMake(13.7455368, 100.533418)
            myLocation1.title = "True Incube Space"
            myLocation1.subtitle = "ปทุมวัน"
            myLocation1.image = UIImage(named : "true.png")!
       
        let myLocation2 = MyAnnotation()
        //let myLocation2 = MKPointAnnotation()
            myLocation2.coordinate = CLLocationCoordinate2DMake(13.7443, 100.5444)
            myLocation2.title = "ห้างสรรพสินค้าเซ็นทรัล"
            myLocation2.subtitle = "ชิดลม"
            myLocation2.image = UIImage(named : "cen.png")!
        let myLocation3 = MyAnnotation()
        //let myLocation3 = MKPointAnnotation()
            myLocation3.coordinate = CLLocationCoordinate2DMake(13.72848, 100.53506)
            myLocation3.title = "เซ็นทรัลสีลมคอมเพล็กซ์"
            myLocation3.subtitle = "ถนนสีลม"
            myLocation3.image = UIImage(named : "cen.png")!
        let myLocation4 = MyAnnotation()
        //let myLocation4 = MKPointAnnotation()
            myLocation4.coordinate = CLLocationCoordinate2DMake(13.7236035, 100.5291469)
            myLocation4.title = "สถานี BTS ช่องนนทรี"
            myLocation4.subtitle = "ถนนนราธิวาสราชนครินทร์"
            myLocation4.image = UIImage(named : "bts.png")!
        
        //var myLocationAnnotationSet : [MKPointAnnotation] = []
        var myLocationAnnotationSet : [MyAnnotation] = []
            myLocationAnnotationSet.append(myLocation1)
            myLocationAnnotationSet.append(myLocation2)
            myLocationAnnotationSet.append(myLocation3)
            myLocationAnnotationSet.append(myLocation4)
            myMapView.showAnnotations(myLocationAnnotationSet,animated: true)
            myMapView.selectAnnotation(myLocation1, animated: true)
        //สร้าง Object MKPlaceMark สําหรับกําหนดจุดบนแผนที่
        let startPlaceMark = MKPlacemark(coordinate: myLocation4.coordinate)
        let destinationPlaceMark = MKPlacemark(coordinate: myLocation1.coordinate)
        //สร้าง Object MKMapItem ใช้สําหรับการ Routing
        let startMapItem = MKMapItem(placemark: startPlaceMark)
        let destinationMapItem = MKMapItem(placemark: destinationPlaceMark)
        
        //สร้าง MKDrirectionsRequest
        let directionRequest = MKDirectionsRequest()
            directionRequest.source = startMapItem
            directionRequest.destination = destinationMapItem
            directionRequest.transportType = .automobile
        //คํานวณเส้นทาง
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (response, error) in guard response != nil else{
                if error != nil {
                    print("Error : \(error!)")
                }
                return
            }
            let route = response?.routes[0]
            self.myMapView.add((route?.polyline)!,level: .aboveRoads)
            let showingRect = route?.polyline.boundingMapRect
            self.myMapView.setVisibleMapRect(showingRect!, edgePadding: UIEdgeInsetsMake(45.0, 45.0, 45.0, 45.0), animated:true)
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation:
        MKAnnotation) -> MKAnnotationView? {
        //กําหนด id ของ MKAnnotationView
        let identifier = "MyPin"
        //เรียกใช้ซ้ํา
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0,width: 53, height: 53))
        let v = annotation as! MyAnnotation
            leftIconView.image = v.image
            annotationView!.leftCalloutAccessoryView = leftIconView
            return annotationView
    }
            
        func mapView(_ mapView: MKMapView, rendererFor overlay:
            MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 4.0
            return renderer
    }
        // Do any additional setup after loading the view.
    

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
