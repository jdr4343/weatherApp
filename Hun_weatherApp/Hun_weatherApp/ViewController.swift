//
//  ViewController.swift
//  Hun_weatherApp
//
//  Created by 신지훈 on 2021/07/30.
//
//Location: CoreLocation
//table view
//custom cell: collection view
//API request to get the data
import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet var table: UITableView!
    var models = [Weather]()
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Register 2 cell
        table.register(HourlyTableViewCell.nib(), forCellReuseIdentifier: HourlyTableViewCell.identifier)
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier )
        
        table.delegate = self
        table.dataSource = self
        //Location
   
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
    }
    //위치 프롬포트 
        func setupLocation() {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if !locations.isEmpty, currentLocation == nil {
                currentLocation = locations.first
                locationManager.stopUpdatingLocation()
                requestWeatherForLocation()
            }
        }
    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation else {
            return
        }
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        
        print("\(long) | \(lat)")
    }
        
        
        //table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
struct Weather {
    
}
