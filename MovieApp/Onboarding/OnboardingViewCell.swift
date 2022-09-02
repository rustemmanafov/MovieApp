//
//  OnboardingViewCell.swift
//  MovieApp
//
//  Created by Rustem Manafov on 02.09.22.
//

import UIKit

class OnboardingViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        imageView.image = UIImage(named: slide.image)
        descriptionLabel.text = slide.description
    }
}
