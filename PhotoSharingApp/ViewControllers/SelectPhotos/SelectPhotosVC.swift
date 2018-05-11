//
//  SelectPhotosVC.swift
//  PhotoSharingApp
//
//  Created by Azharuddin on 07/02/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class SelectPhotosVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func OpenGallery(_ sender: UIButton) {
        openGallary()
    }
    
    @IBAction func TakePhoto(_ sender: UIButton) {
        openCamera()
    }
    
    func openGallary()
    {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func openCamera()
    {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Camera Not Found", message: "This device has no Camera", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        //imageView.image = image
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        print("back")
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
