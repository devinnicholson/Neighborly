//
//  MapTableViewCell.swift
//  fireFighters
//
//  Created by shelby chen on 1/13/18.
//  Copyright © 2018 shelby chen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapTableViewCell: UITableViewCell, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        mapView.delegate = self
        
        let slo = CLLocationCoordinate2D(latitude: 35.2828, longitude: -120.6596)
        
        let span = MKCoordinateSpanMake(0.07, 0.07)
        let region = MKCoordinateRegion(center: slo, span: span)
        mapView.setRegion(region, animated: true)
        
        let locations = [
            ["title": "Red Cross", "latitude": 35.2538, "longitude": -120.6667],
            ["title": "Salvation Army", "latitude": 35.2760, "longitude": -120.6592],
            ["title": "Good Will Central Coast",     "latitude": 35.2760, "longitude": -120.6502],
            ["title": "Good Will Donation Center",     "latitude": 35.2926, "longitude": -120.6678],
            ["title": "RISE San Luis Obispo County",     "latitude": 35.2519, "longitude": -120.6724],
            ["title": "United Way of San Luis Obispo", "latitude": 35.2795, "longitude": -120.6602],
            ["title": "Family Care Network", "latitude": 35.2370, "longitude": -120.6292],
            ["title": "Current Location", "latitude": 35.2804, "longitude": -120.6623]
        ]
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            
            mapView.addAnnotation(annotation)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
