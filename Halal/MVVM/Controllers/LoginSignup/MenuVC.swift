//
//  MenuVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 04/10/21.
//

import UIKit

class MenuVC: UIViewController {
  
    @IBOutlet weak var lblNotAvailable: UILabel!
    @IBOutlet weak var clsnMenu: UICollectionView!
    var arrMenu = [MenuRslt]()
    var webService = ViewModelForRestuarentDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      uiSet()
    }
    func uiSet(){
        clsnMenu.delegate = self
        clsnMenu.dataSource = self
//        webService.webServiceForMenu(obj: self)
    }
    override func viewWillAppear(_ animated: Bool) {
    
    }

  

}
