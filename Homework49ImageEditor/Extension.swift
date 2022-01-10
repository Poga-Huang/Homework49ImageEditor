//
//  ViewControllerExtension.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/5.
//

import Foundation
import UIKit

extension UIViewController:UIScrollViewDelegate{
    
    //提示alert
    func alert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    //縮放圖片
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for subview in scrollView.subviews{
            if subview.isKind(of: UIView.self){
                return subview
            }
        }
        return nil
    }
    //截圖
    
    func screenshot(view:UIView)->UIImage{
        let renderer = UIGraphicsImageRenderer(bounds: CGRect(x:0 , y: 0, width:view.frame.width, height:view.frame.height))
               let image = renderer.image(actions: { (context) in
                   view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
               })
        return image
    }
   
    
}
//照片轉向問題
extension CGImagePropertyOrientation {
    //UIImage的照片面向
    init(_ uiOrientation: UIImage.Orientation) {
        //判斷照片面向
        switch uiOrientation {
            case .up: self = .up
            case .upMirrored: self = .upMirrored
            case .down: self = .down
            case .downMirrored: self = .downMirrored
            case .left: self = .left
            case .leftMirrored: self = .leftMirrored
            case .right: self = .right
            case .rightMirrored: self = .rightMirrored
        @unknown default:
            self = .up
        }
    }
}
