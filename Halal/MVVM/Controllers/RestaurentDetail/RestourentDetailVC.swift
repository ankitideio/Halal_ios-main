//
//  RestourentDetailVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 04/10/21.
//

import UIKit
import CoreLocation
import WebKit
import GoogleMaps
import GooglePlaces
import MapKit
class RestourentDetailVC: UIViewController {
    
    @IBOutlet weak var btnOrderNow: UIButton!
    @IBOutlet weak var heightOrderNowVw: NSLayoutConstraint!
    @IBOutlet weak var lblEstimateType: UILabel!
    @IBOutlet weak var heightVw: NSLayoutConstraint!
    @IBOutlet weak var mkMapView: MKMapView!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var tblVwHalalOption: UITableView!
    @IBOutlet weak var imgVwFvrt: UIImageView!
    @IBOutlet weak var btnFvrt: UIButton!
    @IBOutlet weak var lblDeliveryStatus: UILabel!
    @IBOutlet weak var lblLunch: UILabel!
    @IBOutlet weak var lblDinner: UILabel!
    @IBOutlet weak var imgVwRestuarent: UIImageView!
    @IBOutlet weak var vwScroll: UIScrollView!
    @IBOutlet weak var vwHours: UIView!
    @IBOutlet weak var vwOffer: UIView!
    @IBOutlet weak var heightConatinerVw: NSLayoutConstraint!
    @IBOutlet weak var lblKm: UILabel!
    @IBOutlet weak var lblNowOpen: UILabel!
    @IBOutlet weak var lblBreakfast: UILabel!
    @IBOutlet weak var lblAvrageCost: UILabel!
    @IBOutlet weak var lblCusineName: UILabel!
    @IBOutlet weak var lblOpeningClosingStatus: UILabel!
    @IBOutlet weak var lblRestuarentName: UILabel!
    @IBOutlet weak var vwReview: UIView!
    @IBOutlet weak var scrollVw: UIScrollView!
    @IBOutlet weak var vwMap: UIView!
    @IBOutlet weak var collVwRestourentDetail: UICollectionView!
    @IBOutlet weak var vwMenu: UIView!
    @IBOutlet weak var vwGallary: UIView!
    @IBOutlet weak var lblPaymentOption: UILabel!
    @IBOutlet weak var lblHalalOption: UILabel!
    
    var arrNearByRestrnt = [nearByRestaurent]()
    var arrInfo = [moreInformation]()
    var time:String?
    var webSite:String?
    var r_id = String()
    var isSelected = false
    var lattitude = String()
    var longitude = String()
    var presentdate = String()
    var phone = String()
    var callData:resultModel?
    var month:String?
    var resName:String?
    var arrReviews = [ReviewsModel]()
    var webService = ViewModelForRestuarentDetail()
    var webServiceReview = ViewModelForGoogleReview()
    var webServiceFav = ViewModelForFavorites()
    var webServiceCall = ViewModelForNearVenues()
    var isComingFrom = false
    var isComingPush = false
    var attrs = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12.0),
        NSAttributedString.Key.foregroundColor : UIColor.init(red: 58.0/255.0, green: 90.0/255.0, blue: 58.0/255.0, alpha: 1.0),
        NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any] as [NSAttributedString.Key : Any] as [NSAttributedString.Key : Any]
    
    var attributedString = NSMutableAttributedString(string:"")
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()

    }
    func uiSet(){
        if fetchComingNotification() == true{
            self.resName = fetchRatingData()["resName"] as? String ?? ""
            self.r_id = "\(fetchRatingData()["resId"] as? Int ?? 0)"
            self.time = fetchRatingData()["time"] as? String ?? ""
            self.presentdate = fetchRatingData()["todayDate"] as? String ?? ""
            self.lattitude = fetchRatingData()["latitude"] as? String ?? ""
            self.longitude = fetchRatingData()["longitude"] as? String ?? ""
            self.callData?.contact = fetchRatingData()["contact"] as? String ?? ""
        }
        apiAnalytics(type: 1)
        mkMapView.delegate = self
        tblVwHalalOption.delegate = self
        tblVwHalalOption.dataSource = self
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let current = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        month = formatter.string(from: current)
        webService.webServiceForGallery(obj: self)
        webServiceCall.webServiceForRestaurentTrackActivity(obj: self)
       
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    func apiAnalytics(type:Int){
        webService.webServiceForAnalytics(obj: self, type: /type)
    }
    
    @IBAction func actionDirection(_ sender: Any) {
        apiAnalytics(type: 2)
        let url = URL(string:  "http://maps.apple.com/maps?daddr=" + fetchResCurrentLat() + "," + fetchResCurrentLong() + "&saddr=" + fetchResLatitude() + "," + fetchResLongitude() + "&views=traffic")
        webServiceCall.webServiceForLocationTrackActivity(obj: self)
        UIApplication.shared.open(url!)
    }
    
    @IBAction func actionKmBtn(_ sender: UIButton) {
        apiAnalytics(type: 2)
        let url = URL(string:  "http://maps.apple.com/maps?daddr=" + fetchResCurrentLat() + "," + fetchResCurrentLong() + "&saddr=" + fetchResLatitude() + "," + fetchResLongitude() + "&views=traffic")
        webServiceCall.webServiceForLocationTrackActivity(obj: self)
        UIApplication.shared.open(url!)
    
    }
    @IBAction func actionOrderNow(_ sender: UIButton) {
        if webSite != ""{
            print("call")
        }else{
            print("web")
        }
    }
    
    func checkRange(_ range: NSRange, contain index: Int) -> Bool {
        return index > range.location && index < range.location + range.length
    }
   
    func annotationsOnMap() {
        let Annotation = MKPointAnnotation()
        let lat = Double(/fetchResLatitude())
        let long = Double(/fetchResLongitude())
        Annotation.coordinate = CLLocationCoordinate2D(latitude: /lat, longitude: /long)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.40, longitudeDelta:
                                            0.40)
        let coordinate = CLLocationCoordinate2D.init(latitude: /lat, longitude: /long) // provide you lat and long
        let region = MKCoordinateRegion.init(center: coordinate, span: span)
        mkMapView.setRegion(region, animated: true)
        mkMapView.addAnnotation(Annotation)
        
        
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        if fetchComingNotification() == true{
            SceneDelegate().makeRootController(IDStr: "TTabBarViewController")
        }else{
            self.navigationController?.popViewController(animated: true)
        }

    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
    }
    @IBAction func actionCall(_ sender: UIButton) {
        apiAnalytics(type: 3)
        webServiceCall.webServiceForTrackActivity(obj: self)
        if isComingFrom == true{
            if let url = URL(string: "tel://\(/fetchPhoneNumber().filter {!$0.isWhitespace})"),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil) }
            print("tel://\(/fetchPhoneNumber())")
        }else{
            if let url = URL(string: "tel://\(/callData?.r_contact?.filter {!$0.isWhitespace})"),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil) }
            print("tel://\(/callData?.r_contact)")
        }
       
    }
    
    @IBAction func actionReviews(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RateAndReviewVC") as! RateAndReviewVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionWebsite(_ sender: UIButton) {
        if fetchResWebSite() != ""{
            if /fetchResWebSite().contains("https") || /fetchResWebSite().contains("http"){
                if let url = URL(string: /fetchResWebSite()) {
                    UIApplication.shared.open(url)
                }
            }else{
                if let url = URL(string: "http://\(/fetchResWebSite())") {
                    UIApplication.shared.open(url)
                }
            }
        }else{
            TostErrorMessage(view: self.view, message: "Website not available")
        }
        
    }
    
    @IBAction func actionShare(_ sender: UIButton) {
        let text = callData?.name
        
        let myWebsite = "Please download Hala Advisor App from the link given below:"
        let link = "https://google.com/store/apps/details?id=com.dapl.halaladvisor"
        let shareAll = [ text,myWebsite, link] as [Any]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func actionFavourit(_ sender: UIButton) {
        btnFvrt.setImage(UIImage(named: "NewFav"), for: .normal)
        webServiceFav.webServiceForAddToFavDetailResturant(obj: self)
    }
    
    
    @IBAction func actionReview(_ sender: UIButton) {
        if sender.tag == 0{
            scrollVw.setContentOffset(.zero, animated: true)
            webService.webServiceForGallery(obj: self)
            vwReview.backgroundColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
            vwMenu.backgroundColor = .systemGray5
            vwOffer.backgroundColor = .systemGray5
            vwGallary.backgroundColor = .systemGray5
            vwHours.backgroundColor = .systemGray5
        }
        else if sender.tag == 1{
            scrollVw.setContentOffset(.zero, animated: true)
            heightVw.constant = CGFloat(400)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*1, y: 0), animated: true)
            
            vwReview.backgroundColor = .systemGray5
            vwMenu.backgroundColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
            vwOffer.backgroundColor = .systemGray5
            vwGallary.backgroundColor = .systemGray5
            vwHours.backgroundColor = .systemGray5
            
        }else if sender.tag == 2{
            scrollVw.setContentOffset(.zero, animated: true)
            heightVw.constant = CGFloat(400)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*2, y: 0), animated: true)
            
            vwReview.backgroundColor = .systemGray5
            vwMenu.backgroundColor = .systemGray5
            vwOffer.backgroundColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
            vwGallary.backgroundColor = .systemGray5
            vwHours.backgroundColor = .systemGray5
            
        }else if sender.tag == 3{
            
            scrollVw.setContentOffset(.zero, animated: true)
            heightVw.constant = CGFloat(400)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*3, y: 0), animated: true)
            
            vwReview.backgroundColor = .systemGray5
            vwMenu.backgroundColor = .systemGray5
            vwOffer.backgroundColor = .systemGray5
            vwGallary.backgroundColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
            vwHours.backgroundColor = .systemGray5
            
        }else if sender.tag == 4{
            scrollVw.setContentOffset(.zero, animated: true)
            heightVw.constant = CGFloat(400)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*4, y: 0), animated: true)
            
            vwReview.backgroundColor = .systemGray5
            vwMenu.backgroundColor = .systemGray5
            vwOffer.backgroundColor = .systemGray5
            vwGallary.backgroundColor = .systemGray5
            vwHours.backgroundColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
            
        }else {
            scrollVw.setContentOffset(.zero, animated: true)
            heightVw.constant = CGFloat(400)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*5, y: 0), animated: true)
            
        }
        
    }
    
}

extension RestourentDetailVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNearByRestrnt.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collVwRestourentDetail.dequeueReusableCell(withReuseIdentifier: "NearbyVenuesCVC", for: indexPath) as! NearbyVenuesCVC
        
        cell.imgVwResturent.sd_setImage(with: URL(string: /arrNearByRestrnt[indexPath.row].image), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
        cell.lblResturentName.text = arrNearByRestrnt[indexPath.row].name
        cell.lblOpenStauts.text = arrNearByRestrnt[indexPath.row].status_resturent
        if /arrNearByRestrnt[indexPath.row].status_resturent == "Open"{
            cell.lblOpenStauts.text = "OPEN"
            cell.lblOpenStauts.backgroundColor = UIColor(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }else{
            cell.lblOpenStauts.text = "CLOSED"
            cell.lblOpenStauts.backgroundColor = .red
        }
        if arrNearByRestrnt[indexPath.row].resFav == 1 {
            cell.btnFvrt.setImage(UIImage(named: "heart3"), for: .normal)
        }else{
            cell.btnFvrt.setImage(UIImage(named: "like"), for: .normal)
        }
        cell.btnFvrt.tag = indexPath.row
        cell.btnFvrt.addTarget(self, action:#selector(addToFvrt), for: .touchUpInside)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 310, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    @objc func addToFvrt(sender:UIButton){
        let cell = collVwRestourentDetail.cellForItem(at: IndexPath(row: sender.tag, section: 0)) as! NearbyVenuesCVC
        cell.btnFvrt.setImage(UIImage(named: "heart3"), for: .normal)
        r_id = /arrNearByRestrnt[sender.tag].rId
        webServiceFav.webServiceForAddToFavDetail(obj: self, index: sender.tag)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RestourentDetailVC") as! RestourentDetailVC
        vc.lattitude = /arrNearByRestrnt[indexPath.row].latitude
        vc.longitude = /arrNearByRestrnt[indexPath.row].longitude
        vc.r_id = /arrNearByRestrnt[indexPath.row].rId
        vc.presentdate = presentdate
        vc.time = time
        saveRestaurentName(name: /arrNearByRestrnt[indexPath.row].name)
        saveIsComing(isComing: false)
        self.navigationController?.pushViewController(vc, animated: true)
 
    }
}

extension RestourentDetailVC:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView = mkMapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            
        }
        else {
            annotationView!.annotation = annotation
        }
        
        annotationView!.image = UIImage(named: "ann2")
        
        return annotationView
    }
}
extension String {
    static func format(strings: [String],
                       boldFont: UIFont = UIFont.italicSystemFont(ofSize: 12),
                       boldColor: UIColor = .orange,
                       inString string: String,
                       font: UIFont = UIFont.italicSystemFont(ofSize:12),
                       color: UIColor = UIColor.black) -> NSAttributedString {
        let attributedString =
        NSMutableAttributedString(string: string,
                                  attributes: [
                                    NSAttributedString.Key.font: font,
                                    NSAttributedString.Key.foregroundColor: color])
        let boldFontAttribute = [NSAttributedString.Key.font: boldFont, NSAttributedString.Key.foregroundColor: boldColor]
        for bold in strings {
            attributedString.addAttributes(boldFontAttribute, range: (string as NSString).range(of: bold))
        }
        return attributedString
    }
}

extension UILabel {
    func indexOfAttributedTextCharacterAtPoint(point: CGPoint) -> Int {
        assert(self.attributedText != nil, "This method is developed for attributed string")
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: self.frame.size)
        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.lineBreakMode = self.lineBreakMode
        layoutManager.addTextContainer(textContainer)
        
        let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return index
    }
    
}
