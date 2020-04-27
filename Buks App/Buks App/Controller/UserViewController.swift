
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
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileImage()

        profileImage.layer.masksToBounds = false
        profileImage.layer.borderWidth = 1
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    // oq precisa na image view
    func setupProfileImage() {
         self.profileImage.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(switchUserPhoto))
        singleTap.numberOfTapsRequired = 1
        self.profileImage.addGestureRecognizer(singleTap)
    }
    
    // definido o gesture
    @objc func switchUserPhoto() {
        didTapSomeImage = false
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)

    }
    
    // definindo o picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        if didTapSomeImage == false {
             self.profileImage.image = image
        }
        dismiss(animated: true)

    }

}
