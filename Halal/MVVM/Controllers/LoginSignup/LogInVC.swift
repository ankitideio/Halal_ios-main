//
//  LogInVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 30/09/21.
//

import UIKit
import CoreLocation
import FBSDKLoginKit
import FBSDKCoreKit
import AuthenticationServices
class LogInVC: UIViewController, CLLocationManagerDelegate, ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding {
    
    @IBOutlet var vwBase: UIView!
    @IBOutlet weak var vwAppleLogin: UIView!
    @IBOutlet weak var facebookLoginBtn: FBLoginButton!
    @IBOutlet weak var fbLoginBtn: FBLoginButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var vwFacebook: UIView!
    @IBOutlet weak var btnCross: UIButton!
    @IBOutlet weak var btnForgot: UIButton!
    
    var deviceType = "I"
    var deviceToken = ""
    var lat:String?
    var long:String?
    var isComingFrom = false
    var third_party_id:String?
    var profileimage:String?
    var username:String?
    var email:String?
    var phoneNo:String?
    var webService = ViewModelForLogin()
    var webServiceSocial = ViewModelForSocialLogin()
    var locationManager = CLLocationManager()
    var facebookModel:FacebookLoginModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        determineMyCurrentLocation()
        uiSet()
    }
    func uiSet(){
        setupProviderLoginView()
        if let token = AccessToken.current,
           !token.isExpired {
            
        }else{
//            facebookLoginBtn.permissions = ["public_profile", "email"]
//            facebookLoginBtn.delegate = self
//            let buttonText = NSAttributedString(string: "Sign in with Facebook")
//            facebookLoginBtn.setAttributedTitle(buttonText, for: .normal)
        }
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        
        if self.traitCollection.userInterfaceStyle == .light {
            vwBase.backgroundColor = UIColor(red: 238.0/255, green: 238.0/255, blue: 238.0/255, alpha: 1.0)
        }else{
            btnForgot.setTitleColor(.white, for: .normal)
            btnCross.setTitleColor(UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0), for: .normal)
        }
        btnLogIn.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        vwFacebook.isHidden = true
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func determineMyCurrentLocation() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        lat = ("\(userLocation.coordinate.latitude)")
        long = ("\(userLocation.coordinate.longitude)")
        saveHomeCurrentLat(homeCurrentLat: "\(userLocation.coordinate.latitude)")
        saveHomeCurrentLong(homeCurrentLog: "\(userLocation.coordinate.longitude)")
        
        
    }
    
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
        
    }
    
    @IBAction func actionCross(_ sender: Any) {
        if isComingFrom == true{
            SceneDelegate().makeRootController(IDStr: "signUp")
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func actionFacebook(_ sender: Any) {
        
        
    }
    func setupProviderLoginView() {
        if #available(iOS 13.2, *) {
            let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
            authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
            self.vwAppleLogin.addSubview(authorizationButton)
            
            authorizationButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                authorizationButton.centerXAnchor.constraint(equalTo: self.vwAppleLogin.centerXAnchor),
                authorizationButton.centerYAnchor.constraint(equalTo: self.vwAppleLogin.centerYAnchor),
                authorizationButton.widthAnchor.constraint(equalToConstant: self.vwAppleLogin.frame.size.width),
                authorizationButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    @objc
    func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
   
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Create an account in your system.
            let userIdentifier = appleIDCredential.user
            let userFirstName = /appleIDCredential.fullName?.givenName
            //    let userLastName = appleIDCredential.fullName?.familyName
            let userEmail = /appleIDCredential.email
            //    let appleTocken = appleIDCredential.identityToken
            
            webServiceSocial.webServiceForAppleLogin(obj: self, third_party_id: userIdentifier, email: userEmail, username: userFirstName)
            
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            // Sign in using an existing iCloud Keychain credential.
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            
        }
        
        
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            return self.view.window!
            
        }
    }
    @IBAction func actionBtnLogIn(_ sender: Any) {
        
        checkValidData()
        
    }
    
    @IBAction func actionForgotPassword(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        vc.modalPresentationStyle = .overFullScreen
        navigationController?.present(vc, animated: true, completion: nil)
        
    }
    func checkValidData(){
        switch Validations.validLogin(email: /txtFldEmail.text,password: /txtFldPassword.text) {
        case .success:
            loginApi()
        case.failure(_, let message):
            TostErrorMessage(view: self.view, message: message)
        }
    }
    func loginApi() {
        webService.webServiceForLogin(obj: self)
        
    }
    
}
extension LogInVC: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        print("Token\(token)")
        
        //      deviceToken = /token
        //      webServiceSocial.webServiceForFacebooktoeken(obj: self)
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",parameters: ["fields": "email,name,first_name,last_name,picture,short_name,middle_name,age_range"], tokenString: token, version: nil, httpMethod: .get)
        
        
        
        request.start{ (connection, result , error) in
            print("\(result)")
            if result != nil{
                let dict = result as! [String: AnyObject] as NSDictionary
                self.email = dict.object(forKey: "email") as? String
                self.third_party_id = dict.object(forKey: "id") as? String
                self.username = dict.object(forKey: "name") as? String
                self.profileimage = dict.object(forKey: "picture") as? String
                let loginManager = LoginManager()
                loginManager.logOut()
                self.webServiceSocial.webServiceForFacebookLogin(obj: self)
            }
            
        }
        
        
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
}
