//
//  PostService.swift
//  Makestagram
//
//  Created by Selim Ben Lamine on 7/25/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
    static func create(for image: UIImage) {
        let imageRef = Storage.storage().reference().child("test_image.jpg")
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            print("image url: \(urlString)")
        }
    }
    private static func create(forURLString urlString: String, aspectHeight: CGFloat) {
      
        // Create a reference to the current user. We'll need the user's UID to construct the location of where we'll store our post data in our database.
        let currentUser = User.current
      
        // Initialize a new Post using the data passed in by the parameters.
        let post = Post(imageURL: urlString, imageHeight: aspectHeight)
       
        // Convert the new post object into a dictionary so that it can be written as JSON in our database. We haven't added this computed variable to our Post object yet so the compiler will throw an error right now.
        let dict = post.dictValue
        
        // Construct the relative path to the location where we want to store the new post data. Notice that we're using the current user's UID as child nodes to keep track of which Post belongs to which user.

        let postRef = Database.database().reference().child("posts").child(currentUser.uid).childByAutoId()
       
        //Write the data to the specified location.
        postRef.updateChildValues(dict)
    }
}
