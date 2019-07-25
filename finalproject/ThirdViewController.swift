//
//  ThirdViewController.swift
//  
//
//  Created by TYanna Morrisond on 11/26/18.
//  Copyright © 2018 TYanna Morrison. All rights reserved.
//

import UIKit
import MapKit

class buildingAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
    }
}
class ThirdViewController: UIViewController {

    @IBOutlet weak var zoomSlider: UISlider!
    @IBOutlet weak var myMapView: MKMapView!
    
    let PVAMUCenter = CLLocationCoordinate2D(latitude: 30.092540, longitude: -95.990437) ////administration building
    let PVAMURegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30.092540, longitude: -95.990437), latitudinalMeters: 1300, longitudinalMeters: 1300)
    var pvuAnnotations: [buildingAnnotation] = []  //Holds all the annotations for the PVAMU campus
    
    
    //Display next building bubble
    var buildingIndex: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        buildingIndex = 0
        
        initializeMap()
        
        zoomSlider.maximumValue = 3.0
        zoomSlider.minimumValue = 0.0
        zoomSlider.setValue(1.05, animated: true) //slider's starting-up value
        self.zoomSliderAction(self) // Set the correct zoom according to the slider initial value
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeMap(){
        myMapView.mapType = .hybrid  //standard (by default), satellite, hybrid, satelliteFlyover, and hybridFlyover
        myMapView.isZoomEnabled = true
        myMapView.isScrollEnabled = true
        myMapView.isRotateEnabled = true
        myMapView.isPitchEnabled = true
        
        //set to PVAMU main campus
        myMapView.setRegion(PVAMURegion, animated: true)
        myMapView.setCenter(PVAMUCenter, animated: true)
        
        createBuildingAnnotation()
        
        //add all the annotations
        for annotation in pvuAnnotations {
            myMapView.addAnnotation(annotation)
        }
        
        myMapView.selectAnnotation(pvuAnnotations[buildingIndex], animated: true) //Show the administration building bubble
    }
    
    //Prepare the building information
    func createBuildingAnnotation(){//build up all the annotations
        var pointLoc = CLLocationCoordinate2D(latitude: 30.092354, longitude: -95.989454) ////administration building
        var tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Administration Building"
        tempAnnotation.subtitle = "President & Provost Office"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.092196, longitude: -95.986490)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Architecture Building"
        tempAnnotation.subtitle = "College of Architecture"
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.097351, longitude: -95.989646)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "S.R.Collins Building"
        tempAnnotation.subtitle = "Engineering, Dean's Office, CS, CPET"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.095899, longitude: -95.987622)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "ECE Building"
        tempAnnotation.subtitle = "Engineering"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.096425, longitude: -95.988693)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "C.L. Willson / GilChrist Building"
        tempAnnotation.subtitle = "Engineering, Mechanical, Chemical, Civil"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.091221, longitude: -95.994117)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Blackshear Stadium"
        tempAnnotation.subtitle = "Football"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.092733, longitude: -95.991295)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Memorial Student Center"
        tempAnnotation.subtitle = "Bookstore, Cafeterial, Registrar's Office"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.093156, longitude: -95.985377)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Science Building"
        tempAnnotation.subtitle = "Chemistry Dept., Distance Learning"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.093043, longitude: -95.992735)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Recreation Center"
        tempAnnotation.subtitle = "Swimming Pool, Fitness"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.098852, longitude: -95.987497)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "University Village"
        tempAnnotation.subtitle = "University College"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.094297, longitude: -95.995043)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "University Village"
        tempAnnotation.subtitle = "University College"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.094423, longitude: -95.986013)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "University Village"
        tempAnnotation.subtitle = "University College"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.095125, longitude: -95.990662)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Business / Agriculture"
        tempAnnotation.subtitle = "College of Business"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.095661, longitude: -95.991528)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Don K. CLark Building"
        tempAnnotation.subtitle = "Juvenile Justice"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.094507, longitude: -95.992064)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "W.R.F Delco Building"
        tempAnnotation.subtitle = "Education, Graduate School"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.096655, longitude: -95.986211)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Jessie & Marry Jones Building"
        tempAnnotation.subtitle = "Agriculture Research Center"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.090358, longitude: -95.991332)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "ROTC & Music"
        tempAnnotation.subtitle = "ROCT, Music"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.093433, longitude: -95.989246)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "W.R. Bank Building"
        tempAnnotation.subtitle = "Math, Music"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.092263, longitude: -95.988539)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Harrington Science Building"
        tempAnnotation.subtitle = "Human Resource, Parking Service"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.095042, longitude: -95.989809)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Hilliard Hall Building"
        tempAnnotation.subtitle = "Communication, English"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.094715, longitude: -95.988990)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "G.R. Wollfolk Building"
        tempAnnotation.subtitle = "Political Science"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.093930, longitude: -95.987425)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Library Building"
        tempAnnotation.subtitle = "Library"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.093451, longitude: -95.990303)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Evens Hall"
        tempAnnotation.subtitle = "Evens Hall"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.093845, longitude: -95.990734)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Handerson Hall"
        tempAnnotation.subtitle = "Handerson Hall"
        pvuAnnotations.append(tempAnnotation)
        
        pointLoc = CLLocationCoordinate2D(latitude: 30.093728, longitude: -95.993862)
        tempAnnotation = buildingAnnotation(coordinate: pointLoc)
        tempAnnotation.title = "Leroy G. Moore Building"
        tempAnnotation.subtitle = "Gym"
        pvuAnnotations.append(tempAnnotation)
    }
    
    @IBAction func nextBubbleAction(_ sender: Any) {
        buildingIndex = buildingIndex + 1
        if buildingIndex == pvuAnnotations.count {
            buildingIndex = 0
        }
        myMapView.selectAnnotation(pvuAnnotations[buildingIndex], animated: true) //Show the administration building bubble
        
    }
    
    @IBAction func zoomSliderAction(_ sender: Any) {
        let miles = Double(self.zoomSlider.value)
        let delta = miles / 69.0
        
        var currentRegion = self.myMapView.region
        currentRegion.span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        self.myMapView.region = currentRegion
        
        //hide / show all annoation and label msg
        let annotations = self.myMapView.annotations
        for annotation in annotations
        {
            if (self.myMapView.region.span.latitudeDelta > 0.040)  //0.010
            {
                self.myMapView.view(for: annotation)?.isHidden =  true
            }
            else {
                self.myMapView.view(for: annotation)?.isHidden = false
            }
        }
    }
    

}


