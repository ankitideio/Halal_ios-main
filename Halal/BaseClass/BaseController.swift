//
//

import UIKit
import AVFoundation
import MessageUI
import CoreData
import CoreLocation

typealias videoBlock = ((URL)->Void)
typealias imageBlock = ((UIImage)->Void)
typealias getPhoneContants = (()->())
typealias getApiContants = (()->())
typealias thread = (()->())
typealias backgroundQueue = ((NSManagedObjectContext)->())

enum SelectOne:String{
    case pleaseSelect = "Select"
    case camera = "Camera"
    case photos = "Photos"
    case cancel = "Cancel"
    case messgeForNotPermit = "accessCamera"
    case publicMovie = "public.movie"
    case whatsAppNotInstalled = "Whatsapp"
    case mailNotFound = "Mail"
    case messageNotFound = "Message"
    case UpdateApp = "Update App"
    case Update = "Update"
    case quantity = "Quantity"
    case points = "points1"
    case edit = "Edit"
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class BaseController: UIViewController {

    //MARK::- VARIABLES
    var photosOnly = true
    var completionHandlerVideoUrl: videoBlock? = nil
    var completionHandler: imageBlock? = nil
    
    //MARK::- VIEW CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        view.endEditing(true)
    }
    deinit {
        print("release \(self)")
    }
    //MARK::- OVERRIDE FUNCTIONS
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    //MARK::- FUNCTIONS
    
    func geocode(cordinate:CLLocationCoordinate2D, completion: @escaping (CLPlacemark?) -> ())  {
        let latitude = cordinate.latitude
        let longitude = cordinate.longitude
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {return}
            completion(placemark)
        }
    }
    
    func backgroundQueueForCoreData(queue:backgroundQueue?){
//        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        privateContext.parent = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        privateContext.perform {
//            if let block = queue{
//                block(privateContext)
//            }
//        }
    }
    
    func mainThreadAsync(main:thread?){
        DispatchQueue.main.async {
            if let block = main{
                block()
            }
        }
    }
    
    func mainThreadsync(main:thread?){
        DispatchQueue.main.sync {
            if let block = main{
                block()
            }
        }
    }

    func makeVwRound(vw:[UIView]){
        for v in vw{
            v.cornerRadiusUi = v.bounds.size.width/2
        }
    }
    
    func transform(vw:[UISwitch]){
        for v in vw{
            v.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        }
    }
    
    func openUrlinSafari(_ strUrl:String){
        guard let url = URL(string: strUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    func hideIndicator() {
        
    }
    
    func animation(){
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    func showIndicator() {
        
    }
    
    func popBaseVc(){
        navigationController?.popViewController(animated: true)
    }
    
    func shareImageAndText(image:UIImage?,text:String) {
        var shareArr = [text] as [Any]
        if let img = image{shareArr.append(img)}
        let activityViewController = UIActivityViewController(activityItems: shareArr , applicationActivities: nil)
        activityViewController.excludedActivityTypes = [.print,.postToWeibo, .copyToPasteboard, .addToReadingList, .postToVimeo]
        activityViewController.popoverPresentationController?.sourceView = view
        present(activityViewController, animated: true, completion: nil)
    }
}

extension BaseController :UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //CheckPermitionIf camera Permition Off
    func checkPermissionOfCamera() -> Bool
    {
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        
        switch cameraAuthorizationStatus {
        case .denied:
         //   TostErrorMessage(view: self.view, message: SelectOne.messgeForNotPermit.localized)
           // Alerts.shared.show(alert: .oops, message: SelectOne.messgeForNotPermit.localized , type: .error)
            return false
        case .authorized: break
        case .restricted: break
        case .notDetermined: break
        }
        return true
    }
    
    // for open camera
    func camera()
    {
        if checkPermissionOfCamera() == false{
            return
        }
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let picker = UIImagePickerController()
            //          picker.allowsEditing = true
            picker.delegate = self
            picker.sourceType = .camera
            picker.cameraCaptureMode = .photo
            picker.videoMaximumDuration = 60
            picker.videoQuality = .typeMedium
            if photosOnly == false{
                picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            }
            present(picker, animated: true, completion: nil)
        }
    }
    
    // for access of photos
    func photos (){
        let picker = UIImagePickerController()
        //      picker.allowsEditing = true
        picker.delegate = self
        picker.videoMaximumDuration = 60
        picker.videoQuality = .typeMedium
        picker.sourceType = .photoLibrary
        if photosOnly == false{
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        }
        present(picker, animated: true, completion: nil)
    }
    
    //action sheet for take photo
    func getImageOrVideo (isPhotoOnly:Bool, getImage: imageBlock?,getVideoUrl: videoBlock?) {
        photosOnly = isPhotoOnly
        completionHandlerVideoUrl = getVideoUrl
        completionHandler=getImage
        
        let alert = UIAlertController(title: SelectOne.pleaseSelect.localized, message: "", preferredStyle:UIScreen.main.bounds.size.width <= 450.0 ? UIAlertController.Style.actionSheet : UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: SelectOne.camera.localized, style: UIAlertAction.Style.default, handler: { action in
            self.camera()
        }))
        alert.addAction(UIAlertAction(title: SelectOne.photos.localized, style: UIAlertAction.Style.default, handler: { action in
            self.photos()
        }))
        alert.addAction(UIAlertAction(title: SelectOne.cancel.localized, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // image picker delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let chosenImage = info[.originalImage]as? UIImage{
            dismiss(animated:true, completion: nil)
            completionHandler!(chosenImage)
        }else if let type = info[.mediaType] as? String{
            if type == SelectOne.publicMovie.rawValue{
                if let url = info[.mediaURL] as? URL{
                    dismiss(animated:true, completion: nil)
                    completionHandlerVideoUrl!(url)
                }
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
extension BaseController : MFMessageComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
    }
    
    func sendMessage(arrNo:[String],text:String){
        if MFMessageComposeViewController.canSendText() {
            let controller = MFMessageComposeViewController()
            controller.body = text
            controller.recipients = arrNo
            controller.messageComposeDelegate = self
            present(controller, animated: true, completion: nil)
        }else{
        //    TostErrorMessage(view: self.view, message: SelectOne.messageNotFound.localized)
           // Alerts.shared.show(alert: .oops, message: SelectOne.messageNotFound.localized , type: .error)
        }
    }
}

extension BaseController : MFMailComposeViewControllerDelegate{
    func sendMail(arrEmail:[String],title:String,message:String){
        if MFMailComposeViewController.canSendMail(){
            let controller = MFMailComposeViewController()
            controller.mailComposeDelegate = self
            controller.setSubject(title)
            controller.setMessageBody(message, isHTML: false)
            controller.setToRecipients(arrEmail)
            present(controller, animated: true, completion: nil)
        }else{
        //    TostErrorMessage(view: self.view, message: SelectOne.mailNotFound.localized)
           // Alerts.shared.show(alert: .oops, message: SelectOne.mailNotFound.localized , type: .error)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Mail cancelled")
        case .saved:
            print("Mail saved")
        case .sent:
            print("Mail sent")
        case .failed:
            print("Mail sent failure: \(String(describing: error?.localizedDescription))")
        default:
            break
        }
        dismiss(animated: true, completion: nil)
    }
}

extension BaseController {
//    func shareTextToWhatsapp(text:String){
//        var str = text
//        str = /str.addingPercentEncoding(withAllowedCharacters: (NSCharacterSet.urlQueryAllowed))
//        guard let whatsappURL = URL(string: "whatsapp://send?text=\(str)")else{return}
//        if UIApplication.shared.canOpenURL(whatsappURL) {
//            UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
//        } else {
//            Alerts.shared.show(alert: .oops, message: SelectOne.whatsAppNotInstalled.localized , type: .error)
//        }
//    }
}
