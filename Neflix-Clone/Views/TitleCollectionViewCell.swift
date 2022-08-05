//
//  TitleCollectionViewCell.swift
//  Neflix-Clone
//
//  Created by Miguel Rueda Carbajal on 03/08/22.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let imagePosterView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imagePosterView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imagePosterView.frame = contentView.bounds
    }
    
    public func configure(with image:String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)") ?? nil
        
        if url == nil{
            imagePosterView.image = UIImage(named: "netflixLogo")
        }
        
        else {
            imagePosterView.sd_setImage(with: url, completed: nil)
            
        }
        
    }
    
}
