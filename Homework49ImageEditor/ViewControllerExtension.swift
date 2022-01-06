//
//  ViewControllerExtension.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/5.
//

import Foundation
import UIKit

extension UIViewController:UIScrollViewDelegate{
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
    func cropImage(view:UIView)->UIImage{
        let renderer = UIGraphicsImageRenderer(bounds: CGRect(x:0 , y: 0, width: 360, height: 360))
               let image = renderer.image(actions: { (context) in
                   view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
               })
        return image
    }
}
