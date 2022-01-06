//
//  PreviewViewController.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/5.
//

import UIKit
import PhotosUI

class PreviewBackViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,PHPickerViewControllerDelegate{
    
    
    @IBOutlet weak var previewImage: UIImageView!
    var previousPageImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewImage.image = previousPageImage
        
    }
    //關掉Preview
    @IBAction func dismissSelf(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    //選擇編輯的照片來源
    @IBAction func selectImageSource(_ sender: UIButton) {
        print("選擇背景照片來源")
    }
    //跳出照片來源選項
    func showSourceTypeActionSheet(){
        let alert = UIAlertController(title: nil, message:nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "開啟相機", style: .default) { _ in
            print("開啟相機")
            self.showCamera()
            alert.dismiss(animated: true, completion: nil)
        }
        let photoLibraryAction = UIAlertAction(title: "選擇相簿照片", style:.default) { _ in
            print("開啟相簿")
            self.showPhotoLibrary()
            alert.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            print("取消")
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cameraAction)
        alert.addAction(photoLibraryAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    //UIImagePickerViewController
    func showCamera(){
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            alert(title: "提醒", message: "此裝置沒有相機")
            return
        }
        let controller = UIImagePickerController()
        controller.sourceType = .camera
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //PHPickerViewController
    func showPhotoLibrary(){
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
