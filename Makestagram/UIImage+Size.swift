//
//  UIImage+Size.swift
//  Makestagram
//
//  Created by Selim Ben Lamine on 7/25/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
