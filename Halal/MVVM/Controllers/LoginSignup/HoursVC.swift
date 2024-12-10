//
//  HoursVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 04/10/21.
//

import UIKit

class HoursVC: UIViewController {
    @IBOutlet weak var lblSatTo: UILabel!
    @IBOutlet weak var lblMonOpn: UILabel!
    @IBOutlet weak var lblThuOpn: UILabel!
    @IBOutlet weak var lblWedTo: UILabel!
    @IBOutlet weak var lblFriTo: UILabel!
    
    @IBOutlet weak var lblSunTo: UILabel!
    @IBOutlet weak var lblThuTo: UILabel!
    @IBOutlet weak var lblTueTo: UILabel!
    @IBOutlet weak var lblMonTo: UILabel!
    @IBOutlet weak var lblSunCls: UILabel!
    @IBOutlet weak var lblSunOpn: UILabel!
    @IBOutlet weak var lblSatCls: UILabel!
    @IBOutlet weak var lblSatOpn: UILabel!
    @IBOutlet weak var lblFriCls: UILabel!
    @IBOutlet weak var lblFriOpn: UILabel!
    @IBOutlet weak var lblThuCls: UILabel!
    @IBOutlet weak var lblWedCls: UILabel!
    @IBOutlet weak var lblWedOpn: UILabel!
    @IBOutlet weak var lblTueCls: UILabel!
    @IBOutlet weak var lblTueOpn: UILabel!
    @IBOutlet weak var lblMonCls: UILabel!
    @IBOutlet weak var vwMonday: UIView!
    @IBOutlet weak var vwwwd: UIView!
    @IBOutlet weak var vwFriday: UIView!
    @IBOutlet weak var vwSunday: UIView!
    
    var hourData:OpenHour?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.traitCollection.userInterfaceStyle == .dark {
            vwwwd.backgroundColor = .systemGray5
            vwMonday.backgroundColor = .systemGray5
            vwFriday.backgroundColor  = .systemGray5
            vwSunday.backgroundColor  = .systemGray5
            lblSatTo.textColor = .white
            lblMonOpn.textColor = .white
            lblThuOpn.textColor = .white
            lblWedTo.textColor = .white
            lblFriTo.textColor = .white
            lblSunTo.textColor = .white
            lblThuTo.textColor = .white
            lblTueTo.textColor = .white
            lblMonTo.textColor = .white
            lblSunCls.textColor = .white
            lblSunOpn.textColor = .white
            lblSatCls.textColor = .white
            lblSatOpn.textColor = .white
            lblFriCls.textColor = .white
            lblFriOpn.textColor = .white
            lblThuCls.textColor = .white
            lblWedCls.textColor = .white
            lblWedOpn.textColor = .white
            lblTueCls.textColor = .white
            lblTueOpn.textColor = .white
            lblMonCls.textColor = .white
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
