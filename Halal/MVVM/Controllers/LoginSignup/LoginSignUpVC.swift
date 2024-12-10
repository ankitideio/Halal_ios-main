//
//  LoginSignUpVC.swift
//  Halal
//
//  Created by Ankit KaleRamans on 19/08/21.
//

import UIKit
import FBSDKLoginKit
import CoreLocation
import FBSDKCoreKit
import AuthenticationServices
class LoginSignUpVC: UIViewController,CLLocationManagerDelegate,ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding {
    
    @IBOutlet var vwBase: UIView!
    @IBOutlet weak var vwAppleSignUp: UIView!
    @IBOutlet weak var facebookLoginBtn: FBLoginButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnApple: UIButton!
    @IBOutlet weak var lblSalam: UILabel!
    @IBOutlet weak var lblSignup: UILabel!
    @IBOutlet weak var vwName: UIView!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var btnSignUpLogin: UIButton!
    @IBOutlet weak var lblSignUpWithEmail: UILabel!
    @IBOutlet weak var vwAlreadyAccount: UIView!
    @IBOutlet weak var vwLogin: UIView!
    @IBOutlet weak var vwPrivacyPolicy: UIView!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var vwFacebook: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblSigin: UILabel!
    @IBOutlet weak var Privacy: UIButton!
    @IBOutlet weak var btnTerms: UIButton!
    @IBOutlet weak var lblTerm: UILabel!
    @IBOutlet weak var lblPrivacy: UILabel!
    @IBOutlet weak var lblAnd: UILabel!
    @IBOutlet weak var vwSplash: UIView!
    
    var webService = ViewModalForSignUp()
    var webServiceSocial = ViewModelForSocialLogin()
    var isComming = false
    var deviceType = "I"
    var deviceToken = ""
    var lat = ""
    var long = ""
    var locationManager = CLLocationManager()
    var third_party_id:String?
    var profileimage:String?
    var username:String?
    var email:String?
    var phoneNo:String?
    fileprivate var splashViewController: SplashVC? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if fetchSplashStatusForSignUp() == true{
            showSplashViewController()
        }else{
            vwSplash.isHidden = true
        }
        
        determineMyCurrentLocation()
        // if isComming == true
        uiSet()
    }
    
    func showSplashViewControllerNoPing() {
        
        let loadingScreen = SplashVC(tileViewFileName: "SplashVCAnimation")
        self.splashViewController = loadingScreen
        loadingScreen.pulsing = true
        loadingScreen.view.backgroundColor = UIColor.init(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        loadingScreen.willMove(toParent: self)
        addChild(loadingScreen)
        view.addSubview(loadingScreen.view)
        loadingScreen.didMove(toParent: self)
    }
    
    func showSplashViewController() {
        vwSplash.isHidden = true
        showSplashViewControllerNoPing()
        
        delay(2.00) {
            self.splashViewController?.willMove(toParent: nil)
            self.splashViewController?.removeFromParent()
            self.splashViewController?.view.removeFromSuperview()
            self.didMove(toParent: nil)
        }
    }
    
    public func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func uiSet(){
        setupProviderLoginView()
        if let token = AccessToken.current,
           !token.isExpired {
        }else{
//            facebookLoginBtn.permissions = ["public_profile", "email"]
//            facebookLoginBtn.delegate = self
//            let buttonText = NSAttributedString(string: "Sign up with Facebook")
//            facebookLoginBtn.setAttributedTitle(buttonText, for: .normal)
        }
        if self.traitCollection.userInterfaceStyle == .light {
            vwBase.backgroundColor = UIColor(red: 238.0/255, green: 238.0/255, blue: 238.0/255, alpha: 1.0)
            btnSignUpLogin.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            lblSigin.textColor = .darkGray
            btnTerms.titleLabel?.textColor = .darkGray
            Privacy.titleLabel?.textColor = .darkGray
            lblAnd.textColor = .darkGray
        }else{
            btnLogin.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            btnSignUpLogin.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            btnTerms.setTitleColor(.white, for: .normal)
            Privacy.setTitleColor(.white, for: .normal)
        }
        lblTerm.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        lblPrivacy.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        txtFldName.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        txtFldEmail.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        txtFldPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        txtFldName.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        txtFldEmail.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        txtFldPassword.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        vwFacebook.isHidden = true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
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
    func setupProviderLoginView() {
        if #available(iOS 13.2, *) {
        let authorizationButton = ASAuthorizationAppleIDButton(type: .signUp, style: .black)
        authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        self.vwAppleSignUp.addSubview(authorizationButton)
            
            authorizationButton.translatesAutoresizingMaskIntoConstraints = false
                        NSLayoutConstraint.activate([
                            authorizationButton.centerXAnchor.constraint(equalTo: self.vwAppleSignUp.centerXAnchor),
                            authorizationButton.centerYAnchor.constraint(equalTo: self.vwAppleSignUp.centerYAnchor),
                            authorizationButton.widthAnchor.constraint(equalToConstant: self.vwAppleSignUp.frame.size.width),
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        lat = ("\(userLocation.coordinate.latitude)")
        long = ("\(userLocation.coordinate.longitude)")
        
    }
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    @IBAction func actionFacebook(_ sender: Any) {
    }
    @IBAction func actionLoginBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
        vc.isComingFrom = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionGoogle(_ sender: Any) {
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
            
            webServiceSocial.webServiceForAppleSignUp(obj: self, third_party_id: userIdentifier, email: /userEmail, username: /userFirstName)
            
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            // Sign in using an existing iCloud Keychain credential.
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            
        }
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            return self.view.window!
        }
        
    }

    @IBAction func actionSignUpLogin(_ sender: Any) {
        // signUpApi()
        checkValidData()
        
    }
    
    @IBAction func actionPrivacyPolicy(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GetDirectionVC") as! GetDirectionVC
        vc.isComingFrom = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionTerms(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GetDirectionVC") as! GetDirectionVC
        vc.isComingFrom = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func signUpApi() {
        
        webService.webServiceForSignUp(obj: self)
    }
    func checkValidData(){
        
        switch Validations.validSignUp(username: txtFldName.text!, email: txtFldEmail.text!, password: txtFldPassword.text!){
        case .success:
            signUpApi()
        case.failure( _, let message):
            TostErrorMessage(view: self.view, message: message)
        }
    }
}
extension LoginSignUpVC: LoginButtonDelegate {
    
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
                self.webServiceSocial.webServiceForFacebookSignUp(obj: self)
            }
            
        }
        
        
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
}

