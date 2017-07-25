//
//  MGPhotoHelper.swift
//  Makestagram
//
//  Created by Selim Ben Lamine on 7/25/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import UIKit

class MGPhotoHelper: NSObject {
    
    // MARK: - Properties
    
    var completionHandler: ((UIImage) -> Void)?
    
    // MARK: - Helper Methods
    
    func presentActionSheet(from viewController: UIViewController) {
        // Initialize a new UIAlertController of type actionSheet. UIAlertController can be used to present different types of alerts. An action sheet is a popup that will be displayed at the bottom edge of the screen.
        
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        // Check if the current device has a camera available. The simulator doesn't have a camera and won't execute the if clause.
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { [unowned self] action in
                self.presentImagePickerController(with: .camera, from: viewController)
            })
            
            alertController.addAction(capturePhotoAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { [unowned self] action in
                self.presentImagePickerController(with: .photoLibrary, from: viewController)
            })
            
            alertController.addAction(uploadAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Present the UIAlertController from our UIViewController. Remember, we must pass in a reference from the view controller presenting the alert controller for this method to properly present the UIAlertController.
        viewController.present(alertController, animated: true)
    }
    
    func presentImagePickerController(with sourceType: UIImagePickerControllerSourceType, from viewController: UIViewController) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        
        viewController.present(imagePickerController, animated: true)
    }
}
extension MGPhotoHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            completionHandler?(selectedImage)
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
