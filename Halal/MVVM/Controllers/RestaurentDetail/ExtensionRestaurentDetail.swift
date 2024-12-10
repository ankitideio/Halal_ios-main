//
//  ExtensionRestaurentDetail.swift
//  Halal
//
//  Created by snow-macmini-1 on 08/11/21.
//

import UIKit

extension RestourentDetailVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 26
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HalalOptionTVC", for: indexPath) as! HalalOptionTVC
        
        cell.lblOption.text = arrInfo[indexPath.row].more_info
        
        return cell
    }
    
    
}
