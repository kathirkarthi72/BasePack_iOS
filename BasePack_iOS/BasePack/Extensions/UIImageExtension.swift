//
//  UIImageExtension.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    
    func maskWithColor(color: UIColor) -> UIImage? {
        //        let maskImage = cgImage!
        //
        //        let width = size.width
        //        let height = size.height
        //        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        //
        //        let colorSpace = CGColorSpaceCreateDeviceRGB()
        //        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        //        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        //
        //        context.clip(to: bounds, mask: maskImage)
        //        context.setFillColor(color.cgColor)
        //        context.fill(bounds)
        //
        //        if let cgImage = context.makeImage() {
        //            let coloredImage = UIImage(cgImage: cgImage)
        //            return coloredImage
        //        } else {
        //            return nil
        //        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

       /// Returns the data for the specified image in JPEG format.
       /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
       /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
       func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
           return jpegData(compressionQuality: jpegQuality.rawValue)
       }
}


