//
//  ImageEditor.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/6.
//

import Foundation
import CoreImage.CIFilterBuiltins
import UIKit

class ImageEditor{
    var image:UIImage?
    let filter = ImageFilter()
    
    func changeImageFilter(tag:Int)->UIImage?{
        let defaultImage = image
        switch tag{
        case 0:
            return defaultImage
        case 1:
            return filter.changeFilter(image: image, tag: tag)
        case 2:
            return filter.changeFilter(image: image, tag: tag)
        case 3:
            return filter.changeFilter(image: image, tag: tag)
        case 4:
            return filter.changeFilter(image: image, tag: tag)
        case 5:
            return filter.changeFilter(image: image, tag: tag)
        default:
            return nil
        }
    }
}
