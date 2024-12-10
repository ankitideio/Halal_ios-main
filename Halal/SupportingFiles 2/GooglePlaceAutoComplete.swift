//
//  GooglePlaceAutoComplete.swift
//  BeautAsap
//
//  Created by snow-macmini-1 on 16/10/20.
//  Copyright © 2020 macbook-snow-03. All rights reserved.
//

import UIKit
import GooglePlaces

protocol GooglePlaceAutoCompleteProtocol: class{
    func didSelectAddress(place:GMSPlace)
}

class GooglePlaceAutoComplete: NSObject{
  static let shared = GooglePlaceAutoComplete()
    weak var delegate: GooglePlaceAutoCompleteProtocol?
    private override init(){
    }
   
func setupAutoComplete(viewController: UIViewController){
let acController = GMSAutocompleteViewController()
acController.changeGooglePlaceUI()
acController.delegate = self
acController.modalPresentationStyle = .fullScreen
viewController.present(acController, animated: true, completion: nil)
}
}

extension GooglePlaceAutoComplete: GMSAutocompleteViewControllerDelegate {
      func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        // Get the place name from 'GMSAutocompleteViewController'
        // Then display the name in textField
        delegate?.didSelectAddress(place: place)
        getReverseGeoAddress(place:place)


    // Dismiss the GMSAutocompleteViewController when something is selected
        
        let acController = GMSAutocompleteViewController()
        acController.changeBackGooglePlaceUI()
        
     viewController.dismiss(animated: true, completion: nil)
      }
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // Handle the error
        print("Error: ", error.localizedDescription)
      }
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        // Dismiss when the user canceled the action
        let acController = GMSAutocompleteViewController()
        acController.changeBackGooglePlaceUI()
        viewController.dismiss(animated: true, completion: nil)
      }
    }


extension GMSAutocompleteViewController{
       func changeGooglePlaceUI(){
       let blackColorAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.black]
       UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).setTitleTextAttributes(blackColorAttribute, for: .normal)
       }
    
    func changeBackGooglePlaceUI(){
          let whiteColorAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
          UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).setTitleTextAttributes(whiteColorAttribute, for: .normal)
          }
}
extension GooglePlaceAutoComplete {
private func getReverseGeoAddress(place: GMSPlace){
let locationInfo = place.coordinate
print(locationInfo)
let locationLatLong = CLLocation(latitude: CLLocationDegrees(exactly: locationInfo.latitude) ?? 0.0, longitude: CLLocationDegrees(exactly: locationInfo.longitude) ?? 0.0)
CLGeocoder().reverseGeocodeLocation(locationLatLong, completionHandler: {(placemarks, error) -> Void in
if error != nil {
return
}
else if let country = placemarks?.first?.country,
let city = placemarks?.first?.locality,
let postalCode = placemarks?.first?.postalCode{
 
}

else {
}
})
}
}
