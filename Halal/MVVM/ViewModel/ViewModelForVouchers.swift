//
//  ViewModelForVouchers.swift
//  Halal
//
//  Created by snow-macmini-1 on 30/10/21.
//

import UIKit

class ViewModelForVouchers: NSObject {
    func webServiceForOffers(obj:OffersVC){
            let param = ["r_id":fetchResId()] as [String: Any]
           
            ApiConnection().postDatatoServer(apiOfferList, parameter: param as NSDictionary, success: { (response) in
                let responseDict = response.dictionaryObject
                let data = OfferListModel.init(attributes: /responseDict as NonOptionalDictionary)
                print("responseOffersss",response)
               if data.status == true{
                   if /data.arrOffer.count == 0{
                       obj.lblOffer.isHidden = false
                   }else{
                       obj.lblOffer.isHidden = true
                   }
                   obj.arrOffers = /data.arrOffer
                   obj.tblVwOffers.reloadData()
        
                }else{
                    TostErrorMessage(view: obj.view, message: /data.message)
                }
            }) { (error) in
                TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
            
        }

        func webServiceForRedeemOffer(obj:RedeemVoucherVC){
            let param = ["user_id":fetchUserId(),"offer_id":obj.offer_id  ,"email":/obj.txtFldEmail.text] as [String: Any]

                ApiConnection().postDatatoServer(apiRedeemOffer, parameter: param as NSDictionary, success: { (response) in
                    let responseDict = response.dictionaryObject
                    let data = OfferListModel.init(attributes: /responseDict as NonOptionalDictionary)
                    print("responseRedeemOffr",response)
                   if data.status == true{
                       let vc = obj.storyboard?.instantiateViewController(withIdentifier: "GoToVoucherVC") as! GoToVoucherVC
                       vc.resname = /obj.RestName
                       vc.Off = /obj.off
                       obj.navigationController?.pushViewController(vc, animated: true)

                    }else{
                        TostErrorMessage(view: obj.view, message: /data.message)
                    }
                }) { (error) in
                    TostErrorMessage(view: obj.view, message: error.localizedDescription)
            }

            }

        
    }


