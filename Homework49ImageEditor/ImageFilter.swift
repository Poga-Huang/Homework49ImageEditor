//
//  ImageFilter.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/6.
//

import Foundation
import CoreImage.CIFilterBuiltins
import UIKit

class ImageFilter{
    func ImageChangeToMonochrome(image:UIImage?)->UIImage?{
        let ciImage = CIImage(image:image!)
        let filter = CIFilter.colorMonochrome()
        filter.inputImage = ciImage
        if let output = filter.outputImage{
            let filterImage = UIImage(ciImage: output)
            return filterImage
        }
        return nil
    }
    func ImageChangeToEffectFade(image:UIImage?)->UIImage?{
        let ciImage = CIImage(image:image!)
        let filter = CIFilter.photoEffectFade()
        filter.inputImage = ciImage
        if let output = filter.outputImage{
            let filterImage = UIImage(ciImage: output)
            return filterImage
        }
        return nil
    }
    func ImageChangeToEffectInstant(image:UIImage?)->UIImage?{
        let ciImage = CIImage(image:image!)
        let filter = CIFilter.photoEffectInstant()
        filter.inputImage = ciImage
        if let output = filter.outputImage{
            let filterImage = UIImage(ciImage: output)
            return filterImage
        }
        return nil
    }
    func ImageChangeToEffectMono(image:UIImage?)->UIImage?{
        let ciImage = CIImage(image:image!)
        let filter = CIFilter.photoEffectMono()
        filter.inputImage = ciImage
        if let output = filter.outputImage{
            let filterImage = UIImage(ciImage: output)
            return filterImage
        }
        return nil
    }
    func ImageChangeToEffectTransfer(image:UIImage?)->UIImage?{
        let ciImage = CIImage(image:image!)
        let filter = CIFilter.photoEffectTransfer()
        filter.inputImage = ciImage
        if let output = filter.outputImage{
            let filterImage = UIImage(ciImage: output)
            return filterImage
        }
        return nil
    }
    func changeFilter(image:UIImage?,tag:Int)->UIImage?{
        let ciImage = CIImage(image:image!)
        var name = ""
        switch tag {
        case 1:
            name = "CIColorMonochrome"
        case 2:
            name = "CIPhotoEffectFade"
        case 3:
            name = "CIPhotoEffectInstant"
        case 4:
            name = "CIPhotoEffectMono"
        case 5:
            name = "CIPhotoEffectTransfer"
        default:
            break
        }
        
        let context = CIContext(options: nil)
        let filter = CIFilter(name: name)
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        if let outputImage = filter?.outputImage, let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let newImage = UIImage(cgImage: cgImage)
            return newImage
        }
        return nil
    }
}
