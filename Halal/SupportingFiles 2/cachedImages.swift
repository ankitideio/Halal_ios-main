//
//  cachedImages.swift
//  ITG
//
//  Created by macbook-snow-03 on 24/02/20.
//  Copyright © 2020 Snow-Macmini-2. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()
func downloadViodThunnailImage(url: String, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
    if let cachedImage = imageCache.object(forKey: url as NSString) {
        print("video thibnail from cache successfully.")
        completion(cachedImage, nil)
    } else {
        
        let asset = AVAsset(url: URL(string: url)!)
          let assetImgGenerate = AVAssetImageGenerator(asset: asset)
          assetImgGenerate.appliesPreferredTrackTransform = true
          //Can set this to improve performance if target size is known before hand
          //assetImgGenerate.maximumSize = CGSize(width,height)
          let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
        
        DispatchQueue.global().async {
            
            do {
                
                let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
                
                DispatchQueue.main.async(execute: {
                    let thumbnail = UIImage(cgImage: img)
                                             imageCache.setObject(thumbnail, forKey: url as NSString)
                                           completion(thumbnail,nil)
                    
                })
                        
                       
            } catch {
                print(error.localizedDescription)
                completion(nil,error)
            }
        }
        
        

    }
}

let pdfCacheImage = NSCache<NSString, UIImage>()


func getPdfThubnailFromUrl(url:String,completion: @escaping (_ image:UIImage?,_ error:Error?) -> Void) {
    
    if let cachedImage = pdfCacheImage.object(forKey: url as NSString) {
        print("pdf thibnail from cache successfully.")
        completion(cachedImage, nil)
    } else {
        
        //PdfthumbnailConvertotFunc
        
        let pdfUrl = URL(string: url)
        let width = 240.0
        let pageNumber = 1
        
        
        let pdf:CGPDFDocument = CGPDFDocument(pdfUrl! as CFURL)!;
               
               let firstPage = pdf.page(at: pageNumber)
               
               var pageRect:CGRect = firstPage!.getBoxRect(CGPDFBox.mediaBox);
        let pdfScale:CGFloat = CGFloat(width)/pageRect.size.width;
               pageRect.size = CGSize(width: pageRect.size.width*pdfScale, height: pageRect.size.height*pdfScale);
               pageRect.origin = CGPoint.zero;
               
               UIGraphicsBeginImageContext(pageRect.size);
               
               let context:CGContext = UIGraphicsGetCurrentContext()!;
               
               // White BG
               context.setFillColor(red: 1.0,green: 1.0,blue: 1.0,alpha: 1.0);
               context.fill(pageRect);
               
               context.saveGState();
               
               // Next 3 lines makes the rotations so that the page look in the right direction
               context.translateBy(x: 0.0, y: pageRect.size.height);
               context.scaleBy(x: 1.0, y: -1.0);
               context.concatenate((firstPage?.getDrawingTransform(CGPDFBox.mediaBox, rect: pageRect, rotate: 0, preserveAspectRatio: true))!);
               
               
        
        DispatchQueue.global().async {
            
            context.drawPDFPage(firstPage!);
            context.restoreGState();
            
            DispatchQueue.main.async(execute: {
                       
                       let thm:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
                                     
                                     UIGraphicsEndImageContext();
                              
                                      pdfCacheImage.setObject(thm, forKey: url as NSString)
                                      completion(thm,nil)
                   })
                          
        }
        
        
       
              
    }
}
