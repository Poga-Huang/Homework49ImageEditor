//
//  PreviewHeadshotViewController.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/5.
//

import UIKit
import PhotosUI

class PreviewImageViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,PHPickerViewControllerDelegate {
    
    
    struct segueIdentifier{
        static let toEditor = "showEditor"
    }

    @IBOutlet weak var previewImageView: UIImageView!

    //接受傳遞資料
    var editingImage:EditingImage
    var previewImage:UIImage
    init?(coder:NSCoder,passImage:UIImage,editingImage:EditingImage){
        self.previewImage = passImage
        self.editingImage = editingImage
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if editingImage == .backView{
            previewImageView.contentMode = .scaleAspectFill
        }else if editingImage == .headshot{
            previewImageView.contentMode = .scaleAspectFit
        }
        previewImageView.image = previewImage
        
    }
    
    @IBAction func dismissSelf(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func selectImageSource(_ sender: UIButton) {
       showSourceTypeActionSheet()
    }
    
    @IBSegueAction func passImageToEditor(_ coder: NSCoder) -> EditImageViewController? {
        let controller = EditImageViewController(coder: coder, passImage: previewImage)
        return controller
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
    //UIImagePickerViewControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectImage = info[.originalImage] as? UIImage{
            //取得使用者選擇圖片
            previewImage = selectImage
            picker.dismiss(animated: true) {
                self.performSegue(withIdentifier:segueIdentifier.toEditor, sender: nil)
            }
        }else{
            picker.dismiss(animated: true, completion: nil)
        }
       
    }
    
    //PHPickerViewController
    func showPhotoLibrary(){
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    //PHPickerViewControllerDelegate
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProviders = results.map(\.itemProvider)
        if let itemProvider = itemProviders.first,itemProvider.canLoadObject(ofClass: UIImage.self){
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    if let image = image as? UIImage {
                        self.previewImage = image
                        picker.dismiss(animated: true) {
                            self.performSegue(withIdentifier:segueIdentifier.toEditor, sender: nil)
                        }
                    }
                }
              
            }
        }else{
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
}
