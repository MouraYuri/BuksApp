
//
//  UserViewController.swift
//  Buks App
//
//  Created by Carlos on 24/09/19.
//  Copyright © 2019 Carlos. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var didTapSomeImage: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileImage()
        setupProfileImage2()
        
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var backgroundImageUser: UIImageView!
    
    
    func setupProfileImage() {
         self.profileImage.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(switchUserPhoto))
        singleTap.numberOfTapsRequired = 1
        self.profileImage.addGestureRecognizer(singleTap)
    }
    
    @objc func switchUserPhoto(){
        didTapSomeImage = false
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        if didTapSomeImage == false{
             self.profileImage.image = image
        }else{
            self.backgroundImageUser.image = image
        }
        dismiss(animated: true)
        
    }
    ////////
    func setupProfileImage2() {
       
        self.backgroundImageUser.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(switchUserPhoto2))
        singleTap.numberOfTapsRequired = 1
        self.backgroundImageUser.addGestureRecognizer(singleTap)
        
        
    }
    
    @objc func switchUserPhoto2(){
        didTapSomeImage = true
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
  
}
