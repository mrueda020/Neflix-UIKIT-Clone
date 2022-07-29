//
//  HomeHeaderUIView.swift
//  Neflix-Clone
//
//  Created by Miguel Rueda Carbajal on 11/06/22.
//

import UIKit

class HomeHeaderUIView: UIView {
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemCyan
        return imageView
    }()

    private let playButton: UIButton = {
        let playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.layer.borderWidth = 1
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    
    private let downloadButton: UIButton = {
        let downloadButton = UIButton()
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.layer.borderColor = UIColor.white.cgColor
        downloadButton.layer.borderWidth = 1
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        return downloadButton
    }()
    
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.systemBackground.cgColor]
        gradientLayer.frame = bounds
        
        layer.addSublayer(gradientLayer)
        
    }
    
    func addConstraints(){
        
        let playButtonConstrains = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100)
           ]
        
        let downloadButtonConstrains = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -75),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
           ]
        
        NSLayoutConstraint.activate(playButtonConstrains)
        NSLayoutConstraint.activate(downloadButtonConstrains)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        addConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
