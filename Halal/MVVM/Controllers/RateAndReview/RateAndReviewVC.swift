//
//  RateAndReviewVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit

class RateAndReviewVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextViewDelegate {
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var imgVwSelectImage: UIImageView!
    @IBOutlet weak var clsnReview: UICollectionView!
    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var lblRatingCount: UILabel!
    @IBOutlet weak var lblTextvwCharacterCount: UILabel!
    @IBOutlet weak var txtVwReview: UITextView!
    @IBOutlet weak var customVw: CustomDashedView!
    
    var arrImage = [UIImage]()
    var ratingId:String?
    var range:String?
    var text:String?
    var restaurentName:String?
    var imageId:String?
    var reviewID:String?
    var imgStatus = false
    var arrReviewImage = [Revieimage]()
    var webService = ViewModelForReviews()
    var resturantId:Int?
    var isComing = false
    var time = String()
    var presentdate = String()
    var lattitude = String()
    var longitude = String()
    var contact = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       uiSet()
    }
    
    func uiSet(){
       
        if self.traitCollection.userInterfaceStyle == .dark {
            txtVwReview.backgroundColor = .systemGray5
            customVw.backgroundColor = .systemGray5
          
        }
        txtVwReview.delegate = self
        imgVwSelectImage.isHidden = true
        clsnReview.delegate = self
        clsnReview.dataSource = self
       
        lblRestaurantName.text = restaurentName
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
               let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
               statusBarView.backgroundColor = statusBarColor
               view.addSubview(statusBarView)
   
       }
    override func viewWillAppear(_ animated: Bool) {
       
        webService.webServiceForFetchReviewa(obj: self)
        let date = Date()
        print("date",date)
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todaysDate = dateFormatter.string(from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let totalTime = "\(hour)" + ":" + "\(minutes)"
        presentdate = "\(todaysDate)"
        time = "\(totalTime)"
        saveRatingData(ratingData: ["resName": restaurentName ?? "","resId":resturantId ?? 0,"time":time,"todayDate":presentdate,"latitude":lattitude,"longitude":longitude,"contact":contact])
//        lblRating.text = "\(vwRating.rating)"
    }
    
    func checkValidData(){
        switch Validations.validReview(review: /txtVwReview.text) {
           case .success:
              loginApi()
           case.failure(_, let message):
            TostErrorMessage(view: self.view, message: message)
        }
       }
       func loginApi() {
           webService.webServiceAddReview(obj: self)
       }
override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
    }
    @IBAction func actionBackBtn(_ sender: UIButton) {
        if isComing == true{
//            SceneDelegate().checkUserExist()
            SceneDelegate().makeRootController(IDStr: "ResDetail")

        }else{
            self.navigationController?.popViewController(animated: true)
        }
       
    }
    
    
    @IBAction func btnPublish(_ sender: UIButton) {
        checkValidData()
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        lblTextvwCharacterCount.text = "\(numberOfChars)" + "/" + "120"
        return numberOfChars < 120
    
    }
    @IBAction func actionAddPhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
            picker.delegate = self
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [self]
                action in
            picker.sourceType = .camera
                
                self.present(picker, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
                action in
                picker.sourceType = .photoLibrary
                self.present(picker, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as? UIImage
           
            clsnReview.reloadData()
            arrImage.append(image!)
            picker.dismiss(animated: true, completion: nil)
            if arrImage.count < 5{
                
                if (picker.sourceType == UIImagePickerController.SourceType.camera) {

            let imgName = UUID().uuidString
            let documentDirectory = NSTemporaryDirectory()
            let localPath = documentDirectory.appending(imgName)
            let photoURL = URL.init(fileURLWithPath: localPath)
            let dictionary = ["id": "0","review_images":photoURL.absoluteString] as [String : Any]
            let dataImg = Revieimage.init(attributes: /dictionary as NonOptionalDictionary)
            arrReviewImage.append(dataImg)
         
            self.clsnReview.reloadData()
            if self.arrImage.count == 4{
            self.imgVwSelectImage.isHidden = true
            }else{
            self.imgVwSelectImage.isHidden = false
            }

            }else{
            if let imgUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL{

            if let url = info[.imageURL] as? URL{

            print("image URL: \(url)")


            let dictionary = ["id": "0","review_images":url.absoluteString] as [String : Any]
            let data = Revieimage.init(attributes: /dictionary as NonOptionalDictionary)
            arrReviewImage.append(data)
            self.clsnReview.reloadData()
           
            if self.arrImage.count == 4{
           self.imgVwSelectImage.isHidden = true
            }else{
            self.imgVwSelectImage.isHidden = false
         }

            }
            }
            }
            }

    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    
    }

